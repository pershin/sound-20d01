#include <stdio.h>
#include <stdint.h>

/* Get file size in bytes. */
long int filesize(FILE *stream) {
    long int offset, size;

    offset = ftell(stream);
    fseek(stream, 0, SEEK_END);
    size = ftell(stream);
    fseek(stream, offset, SEEK_SET);

    return size;
}

uint8_t bits_needed_signed(int16_t min_val, int16_t max_val) {
    int range = max_val - min_val;
    uint8_t bits = 0;

    while ((1 << bits) <= range) {
        bits++;
    }

    return bits ? bits : 1;
}
