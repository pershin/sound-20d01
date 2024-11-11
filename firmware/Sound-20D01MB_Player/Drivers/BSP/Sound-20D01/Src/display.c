/*
 * display.c
 *
 *  Created on: Sep 27, 2023
 *      Author: Sergey
 */

#include "main.h"

extern SPI_HandleTypeDef hspi2;

const uint8_t digits[10] = { 0xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0,
		0xFE, 0xF6 };

void display_update(uint16_t track_number) {
	uint8_t a, b, c, d;
	uint8_t data[4];

	a = track_number / 1000;
	b = (track_number / 100) % 10;
	c = (track_number % 100) / 10;
	d = track_number % 10;

	data[3] = digits[a];
	data[2] = digits[b];
	data[1] = digits[c];
	data[0] = digits[d];

	if (1000 > track_number) {
		data[3] = 0;
	}

	if (100 > track_number) {
		data[2] = 0;
	}

	if (10 > track_number) {
		data[1] = 0;
	}

	if (0 == track_number) {
		data[0] = 0;
	}

	HAL_SPI_Transmit(&hspi2, data, 4, HAL_MAX_DELAY);
	HAL_GPIO_WritePin(DISP_LATCH_GPIO_Port, DISP_LATCH_Pin, GPIO_PIN_SET);
	HAL_GPIO_WritePin(DISP_LATCH_GPIO_Port, DISP_LATCH_Pin, GPIO_PIN_RESET);
}

