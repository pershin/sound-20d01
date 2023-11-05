#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <memory.h>
#include <math.h>
#include "plac.h"

static int16_t *tmp_buffer;

static int decompress(FILE *, int16_t *, int, uint8_t);
static void predictor(int16_t *, int);
static void conv8to16(int16_t *, int);

int decoder_init(void) {
    tmp_buffer = malloc(PLAC_BUFSIZ * PLAC_NUM_CHANNELS * sizeof (int16_t));
    if (NULL == tmp_buffer) {
        fprintf(stderr, "Insufficient memory available\n");
        return 1;
    }

    return 0;
}

void decoder_deinit(void) {
    free(tmp_buffer);
}

int decoder_decode(FILE *src, int16_t *output_buffer) {
    int i, j, numread;
    int16_t l, r;
    uint8_t flags;
    int16_t *left_buffer, *right_buffer;
    uint16_t size;
    uint32_t mixres;

    left_buffer = &tmp_buffer[0];
    right_buffer = &tmp_buffer[PLAC_BUFSIZ];

    numread = fread(&flags, sizeof (uint8_t), 1, src);
    if (0 == numread) {
        return 0;
    }

    size = PLAC_BUFSIZ;

    if (flags & PLAC_EOF_FLAG) {
        numread = fread(&size, sizeof (uint16_t), 1, src);
        if (0 == numread) {
            return 0;
        }
    }

    decompress(src, tmp_buffer, size, flags);

    predictor(left_buffer, size);
    predictor(right_buffer, size);

    mixres = (flags & 0x70) >> 4;

    for (i = 0, j = 0; size > i; i++, j += 2) {
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

        // output_buffer[j] = l + floor(0.5 * r);
        // output_buffer[j + 1] = output_buffer[j] - r;
    }

    return size * 2;
}

static int decompress(FILE *src, int16_t *output_buffer, int size, uint8_t flags) {
    uint16_t e_flags, b_flags;
    int data_size;

    e_flags = b_flags = 0;

    if (flags & PLAC_EMPTY_FLAG) {
        fread(&e_flags, sizeof (uint16_t), 1, src);
    }

    if (flags & PLAC_8BIT_FLAG) {
        fread(&b_flags, sizeof (uint16_t), 1, src);
    }

    for (int i = 0; PLAC_COMPN > i; i++) {
        data_size = PLAC_COMPSIZ;
        int offset = i * data_size;
        int16_t *read_buffer = (int16_t *) & output_buffer[offset];

        if (e_flags & (1 << i)) {
            memset(read_buffer, 0, data_size * sizeof (int16_t));
        } else if (b_flags & (1 << i)) {
            fread(read_buffer, sizeof (int8_t), data_size, src);
            conv8to16(read_buffer, data_size);
        } else {
            fread(read_buffer, sizeof (int16_t), data_size, src);
        }
    }

    return size;
}

static void predictor(int16_t *input_buffer, int n) {
    int i;
    int32_t del;
    uint32_t chanshift = PLAC_CHANSHIFT;
    int16_t prev;

    prev = input_buffer[0];

    for (i = 1; i < n; i++) {
        del = input_buffer[i] + prev;
        prev = (del << chanshift) >> chanshift;
        input_buffer[i] = prev;
    }
}

static void conv8to16(int16_t *output_buffer, int count) {
    int i;
    int8_t *input_buffer;

    input_buffer = (int8_t *) & output_buffer[0];

    /* Convert 8 bits to 16 bits */
    for (i = 0; i < count; i++) {
        int k = count - i - 1;
        output_buffer[k] = input_buffer[k];
    }
}
