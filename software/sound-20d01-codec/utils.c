#include "utils.h"

int is_8bit_buffer_w(int16_t *input_buffer, int n) {
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
