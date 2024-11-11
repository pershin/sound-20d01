/*
 * playlist.c
 *
 *  Created on: Nov 13, 2023
 *      Author: Sergey
 */

#include <stdlib.h>
#include <stm32f4xx_hal.h>

static uint8_t playlist_shuffle_mode_enabled = 1;
static uint16_t *playlist;
static uint16_t playlist_position;
static uint16_t playlist_length;

static void playlist_shuffle(void);

void playlist_init(uint16_t n) {
	uint16_t i;

	playlist_position = n - 1;
	playlist_length = n;
	playlist = malloc(n * sizeof(uint16_t));

	for (i = 0; i < n; i++) {
		playlist[i] = i + 1;
	}
}

uint16_t playlist_prev(void) {
	if (0 == playlist_position) {
		playlist_position = playlist_length - 1;
	} else {
		playlist_position--;
	}

	return playlist[playlist_position];
}

uint16_t playlist_next(void) {
	playlist_position++;

	if (playlist_position == playlist_length) {
		playlist_position = 0;

		if (1 == playlist_shuffle_mode_enabled) {
			playlist_shuffle();
		}
	}

	return playlist[playlist_position];
}

static void playlist_shuffle(void) {
	uint32_t tmp;
	uint16_t i, n;

	srand(HAL_GetTick());

	n = playlist_length;

	for (n--; n >= 1; n--) {
		tmp = rand();
		i = tmp % (n + 1);
		tmp = playlist[i];
		playlist[i] = playlist[n];
		playlist[n] = tmp;
	}
}

