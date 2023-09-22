/*
 * fs.c
 *
 *  Created on: Sep 16, 2023
 *      Author: Sergey
 */

#include "fs.h"
#include "stm32f4xx_hal.h"

extern SD_HandleTypeDef hsd;

uint8_t buffer[BLOCKSIZE];
uint16_t number_of_tracks;
uint32_t current_sector;
uint32_t last_sector;
uint16_t last_sector_size;

uint16_t fs_init(void) {
	FS_structure *fs = (FS_structure*) buffer;

	HAL_SD_Init(&hsd);
	HAL_SD_ConfigWideBusOperation(&hsd, SDIO_BUS_WIDE_4B);
	HAL_SD_GetCardState(&hsd);

	number_of_tracks = 0;
	current_sector = 0;

	if (HAL_OK == HAL_SD_ReadBlocks(&hsd, (uint8_t*) buffer, current_sector, 1,
	SDMMC_DATATIMEOUT)) {
		number_of_tracks = fs->NumberOfTracks;
	}

	return number_of_tracks;
}

uint8_t fs_open(uint16_t track_number) {
	FS_TRACK_structure *track = (FS_TRACK_structure*) buffer;

	if (track_number > number_of_tracks) {
		return FS_ERROR;
	}

	current_sector = track_number;

	if (HAL_OK != HAL_SD_ReadBlocks(&hsd, (uint8_t*) buffer, current_sector, 1,
	SDMMC_DATATIMEOUT)) {
		return FS_ERROR;
	}

	current_sector = track->FirstSector;
	last_sector = track->LastSector;
	last_sector_size = track->LastSectorSize;

	return FS_OK;
}

uint16_t fs_read(uint8_t *buffer) {
	uint16_t numread;

	if (current_sector > last_sector) {
		return 0;
	}

	if (current_sector == last_sector) {
		numread = last_sector_size;
	} else {
		numread = BLOCKSIZE;
	}

	if (HAL_OK
			!= HAL_SD_ReadBlocks(&hsd, (uint8_t*) buffer, current_sector++, 1,
			SDMMC_DATATIMEOUT)) {
		numread = 0;
	}

	return numread;
}

