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
	uint8_t MBR_jmpBoot[3]; /* Instruction to Jump to Bootstrap Code */
	uint8_t FSName[8];
	uint8_t Version;
        uint16_t Reserved1;
	uint16_t NumberOfTracks;
	uint32_t TotalCountOfSectors;
	uint32_t NextFreeSector;
	uint8_t Reserved[512 - 3 - 8 - 1 -2- 2 - 4 - 4 - 2];
        uint16_t MBR_Signature_word; /* Must not be 0xAA55 */
} FS_structure; /* 512 bytes */;

typedef struct {
	uint32_t FirstSector;
	uint32_t LastSector;
	uint32_t Size; /* The size of the file in bytes */
	uint16_t Offset;
        uint16_t Type;
	uint8_t Seconds; /* BCD format */
	uint8_t Minutes; /* BCD format */
	uint64_t Created; /* File creation time, in seconds since the epoch. */
	unsigned char Hash[16]; /* MD5 hash */
	char Title[256];
	uint8_t Reserved[208];
} FS_TRACK_structure; /* 512 bytes */

uint8_t fs_open(uint16_t track_number);
uint16_t fs_read(uint8_t *buffer);

#endif /* BSP_SOUND_20D01_INC_FS_H_ */
