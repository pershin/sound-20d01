#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include "plac.h"

static void group_by_channel(int16_t *, int);
static void interchannel_decorrelation(int16_t *, int);
static void int16_to_int8(int16_t *, int);

int encoder_encode(int16_t *input, FILE *dest, int count) {
    int i, j, numwritten, write_size, output_size, half;
    int16_t min_x, max_x, min_y, max_y;
    int16_t *left_buffer, *right_buffer;
    uint8_t flags;
    uint16_t end;

    flags = 0;
    max_x = 0;
    min_y = 0;
    max_y = 0;
    half = count / 2;
    output_size = 0;

    group_by_channel(input, count);
    interchannel_decorrelation(input, count);

    left_buffer = &input[0];
    right_buffer = &input[half];

    for (i = 0, j = 0; count > i; i += 2, j++) {
        /* Fist interation */
        if (0 == i) {
            min_x = max_x = left_buffer[j];
            min_y = max_y = right_buffer[j];
        }

        if (min_x > left_buffer[j]) {
            min_x = left_buffer[j];
        }

        if (max_x < left_buffer[j]) {
            max_x = left_buffer[j];
        }

        if (min_y > right_buffer[j]) {
            min_y = right_buffer[j];
        }

        if (max_y < right_buffer[j]) {
            max_y = right_buffer[j];
        }
    }

    end = j;

    if (PLAC_BUFSIZ * 2 != count) {
        flags |= PLAC_EOF_FLAG;
    }

    if (128 > max_x && -128 < min_x) {
        flags |= PLAC_X8_FLAG;
    }

    if (128 > max_y && -128 < min_y) {
        flags |= PLAC_Y8_FLAG;
    }

    /* Write flags */
    output_size = fwrite(&flags, sizeof (uint8_t), 1, dest);

    if (flags & PLAC_EOF_FLAG) {
        numwritten = fwrite(&end, sizeof (uint16_t), 1, dest);
        output_size += numwritten * sizeof (uint16_t);
    }

    if (flags & PLAC_X8_FLAG) {
        write_size = sizeof (int8_t);
        int16_to_int8(left_buffer, end);
    } else {
        write_size = sizeof (int16_t);
    }

    numwritten = fwrite(left_buffer, write_size, end, dest);
    output_size += numwritten * write_size;

    if (flags & PLAC_Y8_FLAG) {
        write_size = sizeof (int8_t);
        int16_to_int8(right_buffer, end);
    } else {
        write_size = sizeof (int16_t);
    }

    numwritten = fwrite(right_buffer, write_size, end, dest);
    output_size += numwritten * write_size;

    return output_size;
}

static void group_by_channel(int16_t *input_buffer, int count) {
    int i, j, half;
    int16_t *tmp, *left_buffer, *right_buffer, *left_tmp, *right_tmp;

    tmp = malloc(count * sizeof (int16_t));
    if (NULL == tmp) {
        fprintf(stderr, "Insufficient memory available\n");
        return;
    }

    half = count / sizeof (int16_t);
    left_buffer = &input_buffer[0];
    right_buffer = &input_buffer[half];
    left_tmp = &tmp[0];
    right_tmp = &tmp[half];

    for (i = 0, j = 0; count > i; i += 2, j++) {
        left_tmp[j] = input_buffer[i];
        right_tmp[j] = input_buffer[i + 1];
    }

    for (i = 0; half > i; i++) {
        left_buffer[i] = left_tmp[i];
        right_buffer[i] = right_tmp[i];
    }

    free(tmp);
}

static void interchannel_decorrelation(int16_t *input_buffer, int count) {
    int i, half;
    int16_t l, r;
    int16_t *left_buffer, *right_buffer;

    half = count / sizeof (int16_t);
    left_buffer = &input_buffer[0];
    right_buffer = &input_buffer[half];

    for (i = 0; half > i; i++) {
        l = left_buffer[i];
        r = right_buffer[i];

        /* Interchannel Decorrelation */
        right_buffer[i] = l - r;
        left_buffer[i] = l - floor(0.5 * right_buffer[i]);
    }
}

static void int16_to_int8(int16_t *input_buffer, int count) {
    int8_t *tmp_buffer;
    int i;

    tmp_buffer = (int8_t *) & input_buffer[0];

    for (i = 0; i < count; i++) {
        tmp_buffer[i] = (int8_t) input_buffer[i];
    }
}
