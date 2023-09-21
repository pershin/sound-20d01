/*
 * audio.c
 *
 *  Created on: Sep 12, 2021
 *      Author: Sergey Pershin
 */

#include "main.h"
#include "audio.h"

#ifdef DEBUG
#include <stdio.h>
#endif

#define PCM5142_ADDRESS 0x98

#define AUDIODATA_SIZE 2 /* 16-bits audio data size */
#define DMA_MAX_SZE    0xFFFF
#define DMA_MAX(x)     (((x) <= DMA_MAX_SZE)? (x):DMA_MAX_SZE)

/* Page 0 */
#define PCM5142_PCTL 60 /* Digital Volume Control */
#define PCM5142_VOLL 61 /* Left Digital Volume */
#define PCM5142_VOLR 62 /* Right Digital Volume */

extern I2C_HandleTypeDef hi2c1;
extern SAI_HandleTypeDef hsai_BlockB1;
extern I2C_HandleTypeDef hi2c1;

void PCM5142_Init(void);
void PCM5142_SetPageSelectRegister(uint8_t page);

uint8_t BSP_AUDIO_OUT_Play(uint8_t *pbuf, uint32_t size) {
	HAL_SAI_Transmit_DMA(&hsai_BlockB1, (uint8_t*) pbuf,
			DMA_MAX(size / AUDIODATA_SIZE));
	return 0;
}

void BSP_AUDIO_OUT_ChangeBuffer(uint8_t *pbuf, uint32_t size) {
	HAL_SAI_Transmit_DMA(&hsai_BlockB1, (uint8_t*) pbuf, size);
}

void BSP_AUDIO_Init(uint32_t AudioFreq, uint32_t Volume, uint32_t options) {
	PCM5142_Init();
	HAL_GPIO_WritePin(I2S_OSC_EN_GPIO_Port, I2S_OSC_EN_Pin, GPIO_PIN_SET);
	BSP_AUDIO_OUT_SetVolume(Volume);
	BSP_AUDIO_OUT_Mute(1);
	BSP_AUDIO_OUT_Shutdown(0);
	BSP_AUDIO_OUT_Mute(0);

#ifdef DEBUG
	printf("BSP_AUDIO_Init :: AudioFreq: %lu, Volume: %lu, options: %lu\n",
			AudioFreq, Volume, options);
#endif
}

void PCM5142_Init(void) {
	uint8_t data[2];

	PCM5142_SetPageSelectRegister(0);

	data[0] = PCM5142_PCTL;
	data[1] = (1 << 0); /* Right channel volume follows left channel setting */
	HAL_I2C_Master_Transmit(&hi2c1, PCM5142_ADDRESS, data, 2, HAL_MAX_DELAY);
}

void PCM5142_SetPageSelectRegister(uint8_t page) {
	uint8_t data[2];

	data[0] = 0; /* Page select register */
	data[1] = page;
	HAL_I2C_Master_Transmit(&hi2c1, PCM5142_ADDRESS, data, 2, HAL_MAX_DELAY);

#ifdef DEBUG
	printf("Page select register: %d\n", page);
#endif
}

const uint8_t vol_tbl[101] = {
	255, /* 0% Negative infinite (Mute) */
	254, /* 1% Negative maximum */
	253, /* 2% -102.5 dB */
	249, /* 3 */
	247, /* 4 */
	245, /* 5 */
	243, /* 6 */
	241, /* 7 */
	239, /* 8 */
	237, /* 9 */
	235, /* 10 */
	233, /* 11 */
	231, /* 12 */
	229, /* 13 */
	227, /* 14 */
	225, /* 15 */
	223, /* 16 */
	221, /* 17 */
	219, /* 18 */
	217, /* 19 */
	215, /* 20 */
	213, /* 21 */
	211, /* 22 */
	209, /* 23 */
	207, /* 24 */
	205, /* 25 */
	203, /* 26 */
	201, /* 27 */
	199, /* 28 */
	197, /* 29 */
	195, /* 30 */
	193, /* 31 */
	191, /* 32 */
	189, /* 33 */
	187, /* 34 */
	185, /* 35 */
	183, /* 36 */
	181, /* 37 */
	179, /* 38 */
	177, /* 39 */
	175, /* 40 */
	173, /* 41 */
	171, /* 42 */
	169, /* 43 */
	167, /* 44 */
	165, /* 45 */
	163, /* 46 */
	161, /* 47 */
	159, /* 48 */
	157, /* 49 */
	155, /* 50 */
	153, /* 51 */
	151, /* 52 */
	149, /* 53 */
	147, /* 54 */
	145, /* 55 */
	143, /* 56 */
	141, /* 57 */
	139, /* 58 */
	137, /* 59 */
	135, /* 60 */
	133, /* 61 */
	131, /* 62 */
	129, /* 63 */
	127, /* 64 */
	125, /* 65 */
	123, /* 66 */
	121, /* 67 */
	119, /* 68 */
	117, /* 69 */
	115, /* 70 */
	113, /* 71 */
	111, /* 72 */
	109, /* 73 */
	107, /* 74 */
	105, /* 75 */
	103, /* 76 */
	101, /* 77 */
	99, /* 78 */
	97, /* 79 */
	95, /* 80 */
	93, /* 81 */
	91, /* 82 */
	89, /* 83 */
	87, /* 84 */
	85, /* 85 */
	83, /* 86 */
	81, /* 87 */
	79, /* 88 */
	77, /* 89 */
	75, /* 90 */
	73, /* 91 */
	71, /* 92 */
	69, /* 93 */
	67, /* 94 */
	65, /* 95 */
	63, /* 96 */
	61, /* 97 */
	59, /* 98 */
	57, /* 99 */
	48, /* 100% No attenuation */
};

void BSP_AUDIO_OUT_SetVolume(uint8_t vol) {
	uint8_t data[2];

	data[1] = vol;
	data[0] = PCM5142_VOLL;
	HAL_I2C_Master_Transmit(&hi2c1, PCM5142_ADDRESS, data, 2, HAL_MAX_DELAY);
	//data[0] = PCM5142_VOLR;
	//HAL_I2C_Master_Transmit(&hi2c1, PCM5142_ADDRESS, data, 2, HAL_MAX_DELAY);
/*
#ifdef DEBUG
	printf("Set volume: %d\n", vol);
#endif
*/
}

void BSP_Player_SetVolume(uint8_t vol) {
	uint8_t data[2];

	if (0 == vol) {
		BSP_AUDIO_OUT_Mute(1);
	} else {
		BSP_AUDIO_OUT_Mute(0);
	}

	data[1] = vol_tbl[vol];
	data[0] = PCM5142_VOLL;
	HAL_I2C_Master_Transmit(&hi2c1, PCM5142_ADDRESS, data, 2, HAL_MAX_DELAY);
}

void BSP_AUDIO_OUT_Shutdown(uint8_t cmd) {
	if (1 == cmd) {
		HAL_GPIO_WritePin(SHUTDOWN_GPIO_Port, SHUTDOWN_Pin, GPIO_PIN_RESET);
	} else {
		HAL_GPIO_WritePin(SHUTDOWN_GPIO_Port, SHUTDOWN_Pin, GPIO_PIN_SET);
	}
}

void BSP_AUDIO_OUT_Mute(uint8_t cmd) {
	if (1 == cmd) {
		HAL_GPIO_WritePin(MUTE_GPIO_Port, MUTE_Pin, GPIO_PIN_SET);
	} else {
		HAL_GPIO_WritePin(MUTE_GPIO_Port, MUTE_Pin, GPIO_PIN_RESET);
	}

#ifdef DEBUG
	printf("Mute: %d\n", cmd);
#endif
}

