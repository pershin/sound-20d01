#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "utils.h"
#include "encoder.h"
#include "plac.h"
#include "bitstream.h"

static void group_by_channel(int16_t *, int16_t *, int16_t *, int);
static void interchannel_decorrelation(int16_t *, int16_t *, int, int);
static int bits_needed_signed(int16_t, int16_t);
static void prepare_channel(int16_t *, size_t, PLAC_channel *);
static void write_channel(BitStream *, int16_t *, size_t, PLAC_channel *);

int encoder_encode(int16_t *input_buffer, FILE *dest, int count, uint32_t mixres) {
    int half, output_size = 0;
    int16_t *left_buffer, *right_buffer;
    uint8_t *lr_buffer, *output_buffer;
    BitStream bs;
    PLAC_chunk chunk;
    size_t samples;

    half = count / 2;
    samples = half;

    lr_buffer = malloc(count * PLAC_NUM_CHANNELS * sizeof (int16_t));
    if (NULL == lr_buffer) {
        fprintf(stderr, "Insufficient memory available\n");
        return 0;
    }

    output_buffer = malloc(count * 100);
    if (NULL == output_buffer) {
        fprintf(stderr, "Insufficient memory available\n");
        return 0;
    }

    left_buffer = (int16_t *) & lr_buffer[0];
    right_buffer = (int16_t *) & lr_buffer[count];

    group_by_channel(input_buffer, left_buffer, right_buffer, count);

    /* Interchannel Decorrelation */
    interchannel_decorrelation(left_buffer, right_buffer, half, mixres);

    prepare_channel(left_buffer, samples, &chunk.Left);
    prepare_channel(right_buffer, samples, &chunk.Right);

    bitstream_init(&bs, output_buffer);

    write_channel(&bs, left_buffer, samples, &chunk.Left);
    write_channel(&bs, right_buffer, samples, &chunk.Right);

    bitstream_flush(&bs);

    chunk.Size = bs.pos;
    chunk.NumSamples = samples;
    chunk.Mixres = mixres;

    if (NULL != dest) {
        fwrite(&chunk, sizeof (PLAC_chunk), 1, dest);
        fwrite(bs.buffer, sizeof (uint8_t), bs.pos, dest);
    }

    output_size = sizeof (PLAC_chunk) + bs.pos;
    bs.pos = 0;

    free(output_buffer);
    free(lr_buffer);

    return output_size;
}

static void group_by_channel(
        int16_t *input_buffer,
        int16_t *left_buffer,
        int16_t *right_buffer,
        int count) {
    int i, j;

    for (i = 0, j = 0; count > i; i += 2, j++) {
        left_buffer[j] = input_buffer[i];
        right_buffer[j] = input_buffer[i + 1];
    }
}

static void interchannel_decorrelation(
        int16_t *left_buffer,
        int16_t *right_buffer,
        int n,
        int mixres) {
    int i;
    int16_t l, r;
    int32_t m2;

    if (0 == mixres) {
        return;
    }

    /* matrixed stereo */
    m2 = (1 << 2) - mixres;

    for (i = 0; n > i; i++) {
        l = left_buffer[i];
        r = right_buffer[i];

        /* Interchannel Decorrelation */
        left_buffer[i] = (mixres * l + m2 * r) >> 2;
        right_buffer[i] = l - r;
    }
}

static int bits_needed_signed(int16_t min_val, int16_t max_val) {
    int range = max_val - min_val;
    int bits = 0;

    while ((1 << bits) <= range) {
        bits++;
    }

    return bits ? bits : 1;
}

static void prepare_channel(int16_t *data, size_t n, PLAC_channel *ch) {
    size_t i;
    int16_t prev = 0, delta;
    int16_t max_val;

    ch->Min = data[0] - prev;
    max_val = ch->Min;

    for (i = 0; i < n; i++) {
        delta = data[i] - prev;
        prev = data[i];
        data[i] = delta;

        if (data[i] < ch->Min) {
            ch->Min = data[i];
        }

        if (data[i] > max_val) {
            max_val = data[i];
        }
    }

    ch->Bits = bits_needed_signed(ch->Min, max_val);
}

static void write_channel(BitStream *bw, int16_t *buffer, size_t n,
        PLAC_channel *ch) {
    size_t i;

    for (i = 0; i < n; i++) {
        uint32_t val = (uint32_t) (buffer[i] - ch->Min);
        bitstream_write(bw, val, ch->Bits);
    }
}
