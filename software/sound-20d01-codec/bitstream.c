#include <stdio.h>
#include <stdint.h>
#include "bitstream.h"

void bitstream_init(BitStream *br, uint8_t *buffer) {
    br->bitbuf = 0;
    br->bitcount = 0;
    br->buffer = buffer;
    br->pos = 0;
}

uint32_t bitstream_read(BitStream *br, int bits) {
    int c;
    uint32_t val;

    while (br->bitcount < bits) {
        c = br->buffer[br->pos++];
        br->bitbuf |= ((uint32_t) c) << br->bitcount;
        br->bitcount += 8;
    }

    val = br->bitbuf & ((1U << bits) - 1);
    br->bitbuf >>= bits;
    br->bitcount -= bits;

    return val;
}

void bitstream_write(BitStream *bw, uint32_t value, int bits) {
    bw->bitbuf |= (value << bw->bitcount);
    bw->bitcount += bits;

    while (bw->bitcount >= 8) {
        bw->buffer[bw->pos++] = bw->bitbuf & 0xFF;
        bw->bitbuf >>= 8;
        bw->bitcount -= 8;
    }
}

void bitstream_flush(BitStream *bw) {
    while (bw->bitcount > 0) {
        bw->buffer[bw->pos++] = bw->bitbuf & 0xFF;
        bw->bitbuf >>= 8;
        bw->bitcount -= 8;
    }
}
