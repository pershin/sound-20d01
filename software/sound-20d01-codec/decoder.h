/* 
 * File:   decoder.h
 * Author: Sergey
 *
 * Created on October 29, 2023, 11:36 PM
 */

#ifndef DECODER_H
#define DECODER_H

int decoder_decode(int16_t *, FILE *);
int decoder_init(void);
void decoder_deinit(void);

#endif /* DECODER_H */
