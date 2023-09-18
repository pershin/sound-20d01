/*
 * fs.h
 *
 *  Created on: Sep 16, 2023
 *      Author: Sergey
 */

#ifndef BSP_SOUND_20D01_INC_FS_H_
#define BSP_SOUND_20D01_INC_FS_H_

#include <stdint.h>

typedef struct {
	uint32_t FirstSector;
	uint32_t LastSector;
	uint32_t Size;        /* The size of the file in bytes */
	uint16_t Offset;
	uint8_t Seconds;      /* BCD format */
	uint8_t Minutes;      /* BCD format */
	uint32_t Date;
	uint16_t Time;
	uint16_t Format;
	char Hash[32];        /* MD5 hash */
	char Title[256];
	uint8_t Reserved[200];
} FS_TRACK_structure; /* 512 bytes */

#endif /* BSP_SOUND_20D01_INC_FS_H_ */
