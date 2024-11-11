/*
 * playlist.h
 *
 *  Created on: Nov 13, 2023
 *      Author: Sergey
 */

#ifndef BSP_SOUND_20D01_INC_PLAYLIST_H_
#define BSP_SOUND_20D01_INC_PLAYLIST_H_

void playlist_init(uint16_t n);
uint16_t playlist_prev(void);
uint16_t playlist_next(void);

#endif /* BSP_SOUND_20D01_INC_PLAYLIST_H_ */
