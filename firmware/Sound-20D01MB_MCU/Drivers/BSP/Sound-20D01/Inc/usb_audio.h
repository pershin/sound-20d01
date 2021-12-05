/*
 * usb_audio.h
 *
 *  Created on: Dec 4, 2021
 *      Author: Sergey Pershin
 */

#ifndef BSP_SOUND_20D01_INC_USB_AUDIO_H_
#define BSP_SOUND_20D01_INC_USB_AUDIO_H_

#include "usbd_audio.h"

#define AUDIO_CONTROL_VOLUME 0x02

/* USB AUDIO CLASS REQUESTS BREQUEST TYPES */
#define AUDIO_REQ_GET_MIN    0x82
#define AUDIO_REQ_GET_MAX    0x83
#define AUDIO_REQ_GET_RES    0x84

/* Volume */
#define VOLUME_MIN           0x8001 // -127.9961 dB
#define VOLUME_MAX           0x7FFF //  127.9961 dB
#define VOLUME_RES           0x0001 //  1/256 dB
#define VOLUME_CUR           0X8000 // -Infinity dB

uint8_t USB_AUDIO_EP0_RxReady(USBD_HandleTypeDef *pdev);
uint8_t AUDIO_REQ(USBD_HandleTypeDef *pdev, USBD_SetupReqTypedef *req);

#endif /* BSP_SOUND_20D01_INC_USB_AUDIO_H_ */
