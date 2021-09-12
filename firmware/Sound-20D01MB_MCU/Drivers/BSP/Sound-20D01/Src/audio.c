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

extern SAI_HandleTypeDef hsai_BlockB1;
extern SPI_HandleTypeDef hspi1;

void TransferComplete_CallBack_FS(void);
void HalfTransfer_CallBack_FS(void);
void Error_CallBack_FS(void);

void HAL_SAI_TxCpltCallback(SAI_HandleTypeDef *hsai) {
	TransferComplete_CallBack_FS();
}

void HAL_SAI_TxHalfCpltCallback(SAI_HandleTypeDef *hsai) {
	HalfTransfer_CallBack_FS();
}

void AD1938_SPI_Write(uint8_t address, uint8_t data) {
	uint8_t spi1_data[3];

	spi1_data[0] = (0x04 << 1);
	spi1_data[1] = address;
	spi1_data[2] = data;

	HAL_GPIO_WritePin(AD1938_CLATCH_GPIO_Port, AD1938_CLATCH_Pin, GPIO_PIN_RESET);
	HAL_SPI_Transmit(&hspi1, (uint8_t*) &spi1_data, 3, 5000);
	HAL_GPIO_WritePin(AD1938_CLATCH_GPIO_Port, AD1938_CLATCH_Pin, GPIO_PIN_SET);
}

void BSP_AUDIO_OSC_Select(BSP_AUDIO_OSC sel) {
	switch (sel) {
	case BSP_AUDIO_OSC_44K1:
		HAL_GPIO_WritePin(OSC_SEL_GPIO_Port, OSC_SEL_Pin, GPIO_PIN_SET);
		break;
	case BSP_AUDIO_OSC_48K:
		HAL_GPIO_WritePin(OSC_SEL_GPIO_Port, OSC_SEL_Pin, GPIO_PIN_RESET);
		break;
	}
}

void BSP_AUDIO_Init() {
	BSP_AUDIO_OSC_Select(BSP_AUDIO_OSC_48K);
	BSP_AUDIO_OUT_SetVolume(50);

	/* PLL and Clock Control 0 */
	AD1938_SPI_Write(0x0, (1 << 7)); /* Enable: ADC and DAC active */
}

uint8_t BSP_AUDIO_OUT_Play(uint8_t *pbuf, uint32_t size) {
	HAL_SAI_Transmit_DMA(&hsai_BlockB1, (uint8_t*) pbuf,
			DMA_MAX(size / AUDIODATA_SIZE));
	return 0;
}

void BSP_AUDIO_OUT_ChangeBuffer(uint8_t *pbuf, uint32_t size) {
	HAL_SAI_Transmit_DMA(&hsai_BlockB1, (uint8_t*) pbuf, size);
}

void BSP_AUDIO_OUT_SetVolume(uint8_t vol) {
	AD1938_SPI_Write(0x6, vol); /* DAC L1 volume control */
	AD1938_SPI_Write(0x7, vol); /* DAC R1 volume control */

#ifdef DEBUG
	printf("SetVolume: %d\n", vol);
#endif
}

void BSP_AUDIO_OUT_Mute(uint8_t cmd) {

#ifdef DEBUG
	printf("Mute: %d\n", cmd);
#endif
}

