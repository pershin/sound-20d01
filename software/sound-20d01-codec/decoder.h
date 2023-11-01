/* 
 * File:   decoder.h
 * Author: Sergey
 *
 * Created on October 29, 2023, 11:36 PM
 */

#ifndef DECODER_H
#define DECODER_H

int decoder_decode(FILE *, int16_t *);
int decoder_init(void);
void decoder_deinit(void);

#endif /* DECODER_H */
