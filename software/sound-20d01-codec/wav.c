#include <stdio.h>
#include <stdlib.h>
#include <memory.h>
#include "wav.h"

int wav_header_write(FILE *stream, uint32_t fsiz, uint32_t sample_rate,
        enum WAVE_NumChannels num_channels, uint8_t bits_per_sample) {
    WAVE_header *wav;
    int numwritten;

    wav = malloc(sizeof (WAVE_header));
    if (NULL == wav) {
        fprintf(stderr, "Insufficient memory available\n");
        return 0;
    }

    wav->riff.ChunkID = WAVE_ID_RIFF; /* "RIFF" */
    wav->data.Size = fsiz;
    wav->riff.ChunkSize = 36 + wav->data.Size;
    wav->riff.Format = WAVE_ID_WAVE; /* "WAVE" */
    wav->Subchunk1ID = WAVE_ID_FMT; /* "fmt " */
    wav->Subchunk1Size = 16;
    wav->fmt.AudioFormat = 1;
    wav->fmt.NumChannels = num_channels;
    wav->fmt.SampleRate = sample_rate;
    wav->fmt.BitsPerSample = bits_per_sample;
    wav->fmt.ByteRate = wav->fmt.SampleRate * wav->fmt.NumChannels
            * wav->fmt.BitsPerSample / 8;
    wav->fmt.BlockAlign = wav->fmt.NumChannels * wav->fmt.BitsPerSample / 8;
    wav->data.ID = WAVE_ID_DATA; /* "data" */

    fseek(stream, 0, SEEK_SET);

    numwritten = fwrite(wav, sizeof (WAVE_header), 1, stream);

    free(wav);

    return numwritten * sizeof (WAVE_header);
}

WAVE_header *wav_header_read(FILE *stream) {
    WAVE_header *wav;
    WAVE_chunk *chunk;
    int numread;
    long int offset;

    offset = 0;

    wav = malloc(sizeof (WAVE_header));
    if (NULL == wav) {
        fprintf(stderr, "Insufficient memory available\n");
        return NULL;
    }

    memset(wav, 0, sizeof (WAVE_header));

    chunk = malloc(sizeof (WAVE_chunk));
    if (NULL == chunk) {
        free(wav);
        fprintf(stderr, "Insufficient memory available\n");
        return NULL;
    }

    fseek(stream, 0, SEEK_SET);

    numread = fread(&wav->riff, sizeof (WAVE_RIFF), 1, stream);
    if (1 != numread) {
        free(wav);
        free(chunk);
        return NULL;
    }

    if (WAVE_ID_RIFF != wav->riff.ChunkID) {
        free(wav);
        free(chunk);
        return NULL;
    }

    if (WAVE_ID_WAVE != wav->riff.Format) {
        free(wav);
        free(chunk);
        return NULL;
    }

    for (;;) {
        numread = fread(chunk, sizeof (WAVE_chunk), 1, stream);
        if (1 != numread) {
            break;
        }

        switch (chunk->ID) {
            case WAVE_ID_FMT:
                if (sizeof (WAVE_fmt) != chunk->Size) {
                    break;
                }

                wav->Subchunk1ID = chunk->ID;
                wav->Subchunk1Size = chunk->Size;
                fread(&wav->fmt, sizeof (WAVE_fmt), 1, stream);
                break;

            case WAVE_ID_DATA:
                wav->data.ID = chunk->ID;
                wav->data.Size = chunk->Size;
                offset = ftell(stream);
                fseek(stream, chunk->Size, SEEK_CUR);
                break;

            default:
                /* Skip unknown chunk */
                fseek(stream, chunk->Size, SEEK_CUR);
        }
    }

    if (WAVE_ID_FMT != wav->Subchunk1ID) {
        free(wav);
        free(chunk);
        fprintf(stderr, "No 'fmt ' tag found\n");
        return NULL;
    }

    if (WAVE_ID_DATA != wav->data.ID) {
        free(wav);
        free(chunk);
        fprintf(stderr, "No 'data' tag found\n");
        return NULL;
    }

    fseek(stream, offset, SEEK_SET);

    return wav;
}
