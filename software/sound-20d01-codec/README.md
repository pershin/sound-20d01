# PLAC Codec Specification

## General Description

**PLAC** (Player Lossless Audio Codec) is a lossless audio codec designed for compressing CD audio without loss of quality.

The codec uses **channel decorrelation** and **delta encoding** to reduce data size.

All multi-byte values are stored in **little-endian** format.

### Audio Format Parameters

- Sampling rate: **44100 Hz**
- Bit depth: **16 bits per sample**
- Channels: **2 (stereo)**

---

## 1. File Structure

A PLAC file consists of a file header followed by a sequence
of audio data chunks:

```
+----------------------+
| PLAC Header          |
+----------------------+
| Chunk 1              |
|  + Chunk Header      |
|  + Bitstream (Left)  |
|  + Bitstream (Right) |
+----------------------+
| Chunk 2              |
|  + Chunk Header      |
|  + Bitstream (Left)  |
|  + Bitstream (Right) |
+----------------------+
| ...                  |
```

---

## 2. Header section (`PLAC_header`)

Total size: **5 bytes**

| Field    | Size | Description                             |
| -------- | ---- | --------------------------------------- |
| FormatID | 4    | Format identifier `0x43414C50` ("PLAC") |
| Version  | 1    | Codec version (currently: `1`)          |

The `FormatID` field is stored as a 32-bit unsigned integer for efficient comparison on little-endian architectures.

Its value corresponds to the ASCII string "PLAC".

Structure in C:

```c
typedef struct {
    uint32_t FormatID;
    uint8_t Version;
} PLAC_header;
```

---

## 3. Data Chunk (`PLAC_chunk`)

Total size: **7 + 2 × sizeof(PLAC_channel) bytes** for the header + **Size** (data)

| Field      | Size | Description                                    |
| ---------- | ---- | ---------------------------------------------- |
| Size       | 2    | Size of the encoded data (bytes)               |
| NumSamples | 2    | Number of samples per channel in this chunk    |
| Mixres     | 1    | Inter-channel decorrelation factor. Range: 0-4 |
| Left       | 3    | Left channel parameters (`PLAC_channel`)       |
| Right      | 3    | Right channel parameters (`PLAC_channel`)      |
| Bitstream  | Size | Encoded deltas for both channels               |

Structure in C:

```c
typedef struct {
    uint16_t Size;
    uint16_t NumSamples;
    uint8_t Mixres;
    PLAC_channel Left;
    PLAC_channel Right;
} PLAC_chunk;
```

---

### 3.1 Mixres

The `Mixres` field can take values from 0 to 4 inclusive. It specifies the method and strength of inter-channel decorrelation for stereo audio.

| Value | Description                                                                                   |
| ----- | --------------------------------------------------------------------------------------------- |
| 0     | No decorrelation; left and right channels are unchanged.                                      |
| 1     | Mild decorrelation; left channel slightly mixed with right.                                   |
| 2     | Moderate decorrelation; left and right contribute equally to the mixed left channel.          |
| 3     | Strong decorrelation; left channel dominates the mixed left channel.                          |
| 4     | Maximum decorrelation; left channel fully preserved, right channel transformed as difference. |

---

### 3.2 Channel Parameters (`PLAC_channel`)

Total size: **3 bytes**

| Field | Size | Description                                         |
| ----- | ---- | --------------------------------------------------- |
| Bits  | 1    | Number of bits used to encode a single delta sample |
| Min   | 2    | Minimum delta value for this channel                |

Structure in C:

```c
typedef struct {
    uint8_t Bits;
    int16_t Min;
} PLAC_channel;
```

---

Sergey Pershin, 2026
