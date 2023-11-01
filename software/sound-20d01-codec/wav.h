/*
 * File:   wav.h
 * Author: Sergey
 *
 * Created on October 30, 2023, 12:21 AM
 */

#ifndef WAV_H
#define WAV_H

#include <stdint.h>

#define WAVE_ID_RIFF 0x46464952 /* "RIFF" */
#define WAVE_ID_WAVE 0x45564157 /* "WAVE" */
#define WAVE_ID_FMT  0x20746d66 /* "fmt " */
#define WAVE_ID_DATA 0x61746164 /* "data" */

typedef struct {
    uint32_t ChunkID;
    uint32_t ChunkSize;
    uint32_t Format;
} WAVE_RIFF;

typedef struct {
    uint32_t ID;
    uint32_t Size;
} WAVE_chunk;

typedef struct {
    uint16_t AudioFormat;
    uint16_t NumChannels;
    uint32_t SampleRate;
    uint32_t ByteRate;
    uint16_t BlockAlign;
    uint16_t BitsPerSample;
} WAVE_fmt;

typedef struct {
    WAVE_RIFF riff;
    uint32_t Subchunk1ID;
    uint32_t Subchunk1Size;
    WAVE_fmt fmt;
    WAVE_chunk data;
} WAVE_header;

enum WAVE_NumChannels {
    WAV_MONO = 1,
    WAV_STEREO = 2
};

int wav_header_write(FILE *stream, uint32_t fsiz, uint32_t sample_rate,
        enum WAVE_NumChannels num_channels, uint8_t bits_per_sample);
WAVE_header *wav_header_read(FILE *stream);

#endif /* WAV_H */
