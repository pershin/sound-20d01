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

#define AUDIODATA_SIZE 2 /* 16-bits audio data size */
#define DMA_MAX_SZE    0xFFFF
#define DMA_MAX(x)     (((x) <= DMA_MAX_SZE)? (x):DMA_MAX_SZE)

#define PCM5142_ADDRESS 0x98

/* Page 0 */
#define PCM5142_VOLL 61 /* Left Digital Volume */
#define PCM5142_VOLR 62 /* Right Digital Volume */

extern SAI_HandleTypeDef hsai_BlockB1;
extern I2C_HandleTypeDef hi2c1;

void TransferComplete_CallBack_FS(void);
void HalfTransfer_CallBack_FS(void);
void Error_CallBack_FS(void);

void HAL_SAI_TxCpltCallback(SAI_HandleTypeDef *hsai) {
	UNUSED(hsai);
	TransferComplete_CallBack_FS();
}

void HAL_SAI_TxHalfCpltCallback(SAI_HandleTypeDef *hsai) {
	UNUSED(hsai);
	HalfTransfer_CallBack_FS();
}

void BSP_AUDIO_Init(uint32_t AudioFreq, uint32_t Volume, uint32_t options) {
	HAL_GPIO_WritePin(I2S_OSC_EN_GPIO_Port, I2S_OSC_EN_Pin, GPIO_PIN_SET);
	BSP_AUDIO_OUT_SetVolume(100);
	BSP_AUDIO_OUT_Mute(1);
	BSP_AUDIO_OUT_Shutdown(0);
	BSP_AUDIO_OUT_Mute(0);

#ifdef DEBUG
	printf("BSP_AUDIO_Init :: AudioFreq: %lu, Volume: %lu, options: %lu\n",
			AudioFreq, Volume, options);
#endif
}

uint8_t BSP_AUDIO_OUT_Play(uint8_t *pbuf, uint32_t size) {
	HAL_SAI_Transmit_DMA(&hsai_BlockB1, (uint8_t*) pbuf,
			DMA_MAX(size / AUDIODATA_SIZE));
	return 0;
}

void BSP_AUDIO_OUT_ChangeBuffer(uint8_t *pbuf, uint32_t size) {
	HAL_SAI_Transmit_DMA(&hsai_BlockB1, (uint8_t*) pbuf, size);
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

void BSP_AUDIO_OUT_SetVolume(uint8_t vol) {
	uint8_t data[2];

	PCM5142_SetPageSelectRegister(0);

	data[1] = vol;
	data[0] = PCM5142_VOLL;
	HAL_I2C_Master_Transmit(&hi2c1, PCM5142_ADDRESS, data, 2, HAL_MAX_DELAY);
	data[0] = PCM5142_VOLR;
	HAL_I2C_Master_Transmit(&hi2c1, PCM5142_ADDRESS, data, 2, HAL_MAX_DELAY);

#ifdef DEBUG
	printf("Set volume: %d\n", vol);
#endif
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

