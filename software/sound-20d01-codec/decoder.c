#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <memory.h>
#include "plac.h"
#include "bitstream.h"

static void decode_channel(BitStream *, int16_t *, uint16_t, PLAC_channel *);

int decoder_init(void) {
    return 0;
}

void decoder_deinit(void) {
}

int decoder_decode(int16_t *output_buffer, FILE *src) {
    int i, j;
    int16_t l, r;
    size_t numread;
    uint32_t mixres;
    PLAC_chunk chunk;
    BitStream bs;
    static int16_t left_buffer[PLAC_BUFSIZ];
    static int16_t right_buffer[PLAC_BUFSIZ];
    static uint8_t chunk_buffer[PLAC_BUFSIZ * 2 * 2];

    numread = fread(&chunk, sizeof (PLAC_chunk), 1, src);
    if (0 == numread) {
        return 0;
    }

    numread = fread(chunk_buffer, sizeof (uint8_t), chunk.Size, src);
    if (numread != chunk.Size) {
        return 0;
    }

    bitstream_init(&bs, chunk_buffer);

    decode_channel(&bs, left_buffer, chunk.NumSamples, &chunk.Left);
    decode_channel(&bs, right_buffer, chunk.NumSamples, &chunk.Right);

    mixres = chunk.Mixres;

    for (i = 0, j = 0; chunk.NumSamples > i; i++, j += 2) {
        l = left_buffer[i];
        r = right_buffer[i];

        /* Interchannel Decorrelation */
        if (0 == mixres) {
            output_buffer[j] = l;
            output_buffer[j + 1] = r;
        } else {
            output_buffer[j] = l + r - ((mixres * r) >> 2);
            output_buffer[j + 1] = output_buffer[j] - r;
        }
    }

    return chunk.NumSamples * 2;
}

static void decode_channel(BitStream *br, int16_t *buffer, uint16_t n, PLAC_channel *ch) {
    int i;
    int16_t prev = 0;
    uint32_t val;

    for (i = 0; i < n; i++) {
        val = bitstream_read(br, ch->Bits);
        prev = prev + (int16_t) (val + ch->Min);
        buffer[i] = prev;
    }
}
