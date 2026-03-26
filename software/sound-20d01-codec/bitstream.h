/*
 * File:   bitstream.h
 * Author: Sergey
 *
 * Created on March 26, 2026, 6:07 PM
 */

#ifndef BITSTREAM_H
#define BITSTREAM_H

typedef struct {
    uint32_t bitbuf;
    int bitcount;
    uint8_t *buffer;
    size_t pos;
} BitStream;

void bitstream_init(BitStream *, uint8_t *);

uint32_t bitstream_read(BitStream *, int);

void bitstream_write(BitStream *, uint32_t, int);

void bitstream_flush(BitStream *);

#endif /* BITSTREAM_H */
