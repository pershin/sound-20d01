#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include "plac.h"

static int16_t *tmp_buffer;

static int plac_read_8(int16_t *buffer_out, int count, FILE *src);

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
    int i, j, numread, count;
    int16_t l, r, end;
    uint8_t flags;
    int16_t *left_buffer, *right_buffer;

    left_buffer = &tmp_buffer[0];
    right_buffer = &tmp_buffer[PLAC_BUFSIZ];

    numread = fread(&flags, sizeof (uint8_t), 1, src);
    if (0 == numread) {
        return 0;
    }

    count = PLAC_BUFSIZ;

    if (flags & PLAC_EOF_FLAG) {
        numread = fread(&end, sizeof (uint16_t), 1, src);
        if (0 == numread) {
            fprintf(stderr, "decode error (1)\n");
            return 0;
        }

        count = end;
    }

    numread = 0;

    if (flags & PLAC_X8_FLAG) {
        numread += plac_read_8(left_buffer, count, src);
    } else {
        numread += fread(left_buffer, sizeof (int16_t), count, src);
    }

    if (flags & PLAC_Y8_FLAG) {
        numread += plac_read_8(right_buffer, count, src);
    } else {
        numread += fread(right_buffer, sizeof (int16_t), count, src);
    }

    if (count != numread / 2) {
        fprintf(stderr, "decode error (2)\n");
        return 0;
    }

    for (i = 0, j = 0; numread / 2 > i; i++, j += 2) {
        l = left_buffer[i];
        r = right_buffer[i];

        /* Interchannel Decorrelation */
        output_buffer[j] = l + floor(0.5 * r);
        output_buffer[j + 1] = output_buffer[j] - r;
    }

    return numread;
}

static int plac_read_8(int16_t *buffer_out, int count, FILE *src) {
    int8_t *tmp;
    int i, numread;

    tmp = malloc(count * sizeof (int8_t));
    if (NULL == tmp) {
        fprintf(stderr, "Insufficient memory available\n");
        return 0;
    }

    numread = fread(tmp, sizeof (int8_t), count, src);
    if (0 == numread) {
        return 0;
    }

    for (i = 0; i < numread; i++) {
        buffer_out[i] = (int16_t) tmp[i];
    }

    free(tmp);

    return numread;
}
