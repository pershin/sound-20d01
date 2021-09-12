/*
 * audio.c
 *
 *  Created on: Sep 12, 2021
 *      Author: Sergey Pershin
 */

#include "main.h"

#define AUDIODATA_SIZE 2 /* 16-bits audio data size */
#define DMA_MAX_SZE    0xFFFF
#define DMA_MAX(x)     (((x) <= DMA_MAX_SZE)? (x):DMA_MAX_SZE)

extern SAI_HandleTypeDef hsai_BlockB1;

void TransferComplete_CallBack_FS(void);
void HalfTransfer_CallBack_FS(void);
void Error_CallBack_FS(void);

void HAL_SAI_TxCpltCallback(SAI_HandleTypeDef *hsai) {
	TransferComplete_CallBack_FS();
}

void HAL_SAI_TxHalfCpltCallback(SAI_HandleTypeDef *hsai) {
	HalfTransfer_CallBack_FS();
}

uint8_t BSP_AUDIO_OUT_Play(uint8_t *pbuf, uint32_t size) {
	HAL_SAI_Transmit_DMA(&hsai_BlockB1, (uint8_t*) pbuf,
			DMA_MAX(size / AUDIODATA_SIZE));
	return 0;
}

void BSP_AUDIO_OUT_ChangeBuffer(uint8_t *pbuf, uint32_t size) {
	HAL_SAI_Transmit_DMA(&hsai_BlockB1, (uint8_t*) pbuf, size);
}

