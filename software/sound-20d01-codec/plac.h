/*
 * File:   plac.h
 * Author: Sergey
 *
 * Created on October 30, 2023, 10:04 PM
 */

#ifndef PLAC_H
#define PLAC_H

#define PLAC_BUFSIZ           512 * 4
#define PLAC_NUM_CHANNELS     2
#define PLAC_BYTES_PER_SAMPLE sizeof (int16_t)
#define PLAC_SAMPLE_RATE      48000

/* Flags */
#define PLAC_X8_FLAG (1 << 0)
#define PLAC_Y8_FLAG (1 << 1)
#define PLAC_EOF_FLAG (1 << 2)

typedef struct {
    uint32_t FormatID; /* "PLAC" */
} PLAC_header;

#endif /* PLAC_H */
