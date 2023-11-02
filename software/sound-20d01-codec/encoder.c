#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include "encoder.h"
#include "plac.h"

static void group_by_channel(int16_t *, int);
static void interchannel_decorrelation(int16_t *, int);
static int is_empty_buffer(int16_t *, int);
static int is_int8_buffer(int16_t *, int);
static void int16_to_int8(int16_t *, int);

int encoder_encode(int16_t *input, FILE *dest, int count) {
    int numwritten, write_size, output_size, half;
    int16_t *left_buffer, *right_buffer;
    uint8_t flags;
    uint16_t end;

    flags = 0;
    half = count / 2;
    output_size = 0;

    if (is_empty_buffer(input, count)) {
        flags |= PLAC_EMPTY_FLAG;
    }

    group_by_channel(input, count);
    interchannel_decorrelation(input, count);

    left_buffer = &input[0];
    right_buffer = &input[half];

    end = half;

    if (PLAC_BUFSIZ * 2 != count) {
        flags |= PLAC_EOF_FLAG;
    }

    if (is_int8_buffer(left_buffer, half)) {
        flags |= PLAC_X8_FLAG;
    }

    if (is_int8_buffer(right_buffer, half)) {
        flags |= PLAC_Y8_FLAG;
    }

    /* Write flags */
    output_size = fwrite(&flags, sizeof (uint8_t), 1, dest);

    if (flags & PLAC_EOF_FLAG) {
        numwritten = fwrite(&end, sizeof (uint16_t), 1, dest);
        output_size += numwritten * sizeof (uint16_t);
    }

    if (flags & PLAC_EMPTY_FLAG) {
        return output_size;
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

static int is_empty_buffer(int16_t *input_buffer, int n) {
    int result, i;

    result = 1;

    for (i = 0; n > i; i++) {
        if (0 != input_buffer[i]) {
            result = 0;
        }
    }

    return result;
}

static int is_int8_buffer(int16_t *input_buffer, int n) {
    int result, i;

    result = 1;

    for (i = 0; n > i; i++) {
        if (127 < input_buffer[i]) {
            result = 0;
            break;
        }

        if (-128 > input_buffer[i]) {
            result = 0;
            break;
        }
    }

    return result;
}

static void int16_to_int8(int16_t *input_buffer, int count) {
    int8_t *tmp_buffer;
    int i;

    tmp_buffer = (int8_t *) & input_buffer[0];

    for (i = 0; i < count; i++) {
        tmp_buffer[i] = (int8_t) input_buffer[i];
    }
}
