#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <memory.h>
#include <math.h>
#include "plac.h"
#include "dplib.h"

static int16_t *tmp_buffer;

static int decompress(FILE *, int16_t *, int, uint8_t);
static void predictor(int16_t *, int16_t *, int);
int plac_read_8(int16_t *buffer_out, int count, FILE *src);

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

    predictor(left_buffer, right_buffer, size);

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
    uint16_t conf_flags;
    int data_size;

    conf_flags = 0;

    if (flags & PLAC_8BIT_FLAG) {
        fread(&conf_flags, sizeof (uint16_t), 1, src);
    }

    for (int i = 0; PLAC_COMPN > i; i++) {
        data_size = PLAC_COMPSIZ;
        int offset = i * data_size;
        int16_t *read_buffer = (int16_t *) & output_buffer[offset];

        if (conf_flags & (1 << i)) {
            plac_read_8(read_buffer, data_size, src);
        } else {
            fread(read_buffer, sizeof (int16_t), data_size, src);
        }
    }

    return size;
}

static void predictor(int16_t *left_buffer, int16_t *right_buffer, int n) {
    int16_t *left_predictor = malloc(n * sizeof (int16_t));
    int16_t *right_predictor = malloc(n * sizeof (int16_t));

    int numactive = n;

    unpc_block(left_buffer, left_predictor, n, NULL, numactive, PLAC_BITS_PER_SAMPLE + 1, DENSHIFT_DEFAULT);
    unpc_block(right_buffer, right_predictor, n, NULL, numactive, PLAC_BITS_PER_SAMPLE + 1, DENSHIFT_DEFAULT);

    for (int i = 0; n > i; i++) {
        left_buffer[i] = left_predictor[i];
        right_buffer[i] = right_predictor[i];
    }

    free(left_predictor);
    free(right_predictor);
}

int plac_read_8(int16_t *buffer_out, int count, FILE *src) {
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
