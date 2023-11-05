#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <malloc.h>
#include "utils.h"
#include "encoder.h"
#include "plac.h"

static void group_by_channel(int16_t *, int16_t *, int16_t *, int);
static void interchannel_decorrelation(int16_t *, int16_t *, int, int);
static void predictor(int16_t *, int);
static uint16_t compress(int16_t *, int, uint8_t *, FILE *);
static void conv16to8(int16_t *, int);

int encoder_encode(int16_t *input_buffer, FILE *dest, int count, uint32_t mixres) {
    int half, output_size;
    int16_t *left_buffer, *right_buffer;
    uint8_t *output_buffer;
    uint8_t flags;

    flags = 0;
    half = count / 2;

    output_buffer = malloc(count * PLAC_NUM_CHANNELS * sizeof (int16_t));
    if (NULL == output_buffer) {
        fprintf(stderr, "Insufficient memory available\n");
        return 0;
    }

    left_buffer = (int16_t *) & output_buffer[0];
    right_buffer = (int16_t *) & output_buffer[count];

    group_by_channel(input_buffer, left_buffer, right_buffer, count);

    /* Interchannel Decorrelation */
    flags |= (mixres << 4);
    interchannel_decorrelation(left_buffer, right_buffer, half, mixres);

    predictor(left_buffer, half);
    predictor(right_buffer, half);

    output_size = compress((int16_t *) output_buffer, half, &flags, dest);

    free(output_buffer);

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

        // right_buffer[i] = l - r;
        // left_buffer[i] = l - floor(0.5 * right_buffer[i]);
    }
}

static void predictor(int16_t *input_buffer, int n) {
    int i;
    int32_t del;
    uint32_t chanshift = PLAC_CHANSHIFT;
    int16_t prev;

    prev = input_buffer[0];

    for (i = 1; i < n; i++) {
        del = input_buffer[i] - prev;
        prev = input_buffer[i];
        input_buffer[i] = (del << chanshift) >> chanshift;
    }
}

static uint16_t compress(int16_t *output_buffer, int n, uint8_t *flags, FILE *dest) {
    int output_size, data_size, numwritten;
    uint16_t e_flags, b_flags, end_size;

    e_flags = 0;
    b_flags = 0;
    end_size = n;

    if (PLAC_BUFSIZ != end_size) {
        *flags |= PLAC_EOF_FLAG;
    }

    if (!(*flags & PLAC_EOF_FLAG)) {
        for (int i = 0; PLAC_COMPN > i; i++) {
            int offset;
            data_size = PLAC_COMPSIZ;
            offset = i * data_size;

            if (is_empty_buffer(&output_buffer[offset], data_size)) {
                *flags |= PLAC_EMPTY_FLAG;
                e_flags |= (1 << i);
            } else if (is_8bit_buffer_w(&output_buffer[offset], data_size)) {
                *flags |= PLAC_8BIT_FLAG;
                b_flags |= (1 << i);
            }
        }
    }

    /* Write flags */
    if (NULL != dest) {
        fwrite(flags, sizeof (uint8_t), 1, dest);
    }

    output_size = 1;

    if (*flags & PLAC_EOF_FLAG) {
        if (NULL != dest) {
            fwrite(&end_size, sizeof (uint16_t), 1, dest);
            numwritten = fwrite(&output_buffer[0], sizeof (int16_t), end_size * 2, dest);
        } else {
            numwritten = end_size * 2;
        }

        output_size += sizeof (uint16_t);
        output_size += numwritten * sizeof (int16_t);

        return output_size;
    }

    if (*flags & PLAC_EMPTY_FLAG) {
        if (NULL != dest) {
            fwrite(&e_flags, sizeof (uint16_t), 1, dest);
        }

        output_size += 2;
    }

    if (*flags & PLAC_8BIT_FLAG) {
        if (NULL != dest) {
            fwrite(&b_flags, sizeof (uint16_t), 1, dest);
        }

        output_size += 2;
    }

    for (int i = 0; PLAC_COMPN > i; i++) {
        int offset;
        int bps = sizeof (int16_t);
        data_size = PLAC_COMPSIZ;
        offset = i * data_size;

        if (e_flags & (1 << i)) {
            data_size = 0;
        } else if (b_flags & (1 << i)) {
            conv16to8(&output_buffer[offset], data_size);
            bps = sizeof (uint8_t);
        }

        if (NULL != dest) {
            numwritten = fwrite(&output_buffer[offset], bps, data_size, dest);
        } else {
            numwritten = data_size;
        }

        output_size += numwritten * bps;
    }

    return output_size;
}



static void conv16to8(int16_t *input_buffer, int count) {
    uint8_t *output_buffer;
    int i;

    output_buffer = (uint8_t *) & input_buffer[0];

    /* Convert 16 bits to 8 bits */
    for (i = 0; i < count; i++) {
        output_buffer[i] = (uint8_t) input_buffer[i];
    }
}
