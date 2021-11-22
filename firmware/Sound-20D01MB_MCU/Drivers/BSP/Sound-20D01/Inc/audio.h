/*
 * audio.h
 *
 *  Created on: Sep 12, 2021
 *      Author: Sergey Pershin
 */

#ifndef BSP_SOUND_20D01_INC_AUDIO_H_
#define BSP_SOUND_20D01_INC_AUDIO_H_

void BSP_AUDIO_Init();
uint8_t BSP_AUDIO_OUT_Play(uint8_t *pbuf, uint32_t size);
void BSP_AUDIO_OUT_ChangeBuffer(uint8_t *pbuf, uint32_t size);
void BSP_AUDIO_OUT_SetVolume(uint8_t vol);
void BSP_AUDIO_OUT_Shutdown(uint8_t cmd);
void BSP_AUDIO_OUT_Mute(uint8_t cmd);

#endif /* BSP_SOUND_20D01_INC_AUDIO_H_ */
