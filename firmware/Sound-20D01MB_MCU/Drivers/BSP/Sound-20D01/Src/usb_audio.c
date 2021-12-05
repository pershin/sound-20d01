/*
 * usb_audio.c
 *
 *  Created on: Dec 4, 2021
 *      Author: Sergey Pershin
 */

#include "usb_audio.h"

uint8_t USB_AUDIO_EP0_RxReady(USBD_HandleTypeDef *pdev) {
	USBD_AUDIO_HandleTypeDef *haudio;
	haudio = (USBD_AUDIO_HandleTypeDef*) pdev->pClassData;

	if (haudio == NULL) {
		return (uint8_t) USBD_FAIL;
	}

	if (haudio->control.cmd == AUDIO_REQ_SET_CUR) {
		/* In this driver, to simplify code, only SET_CUR request is managed */

		if (haudio->control.unit == AUDIO_OUT_STREAMING_CTRL) {
			((USBD_AUDIO_ItfTypeDef*) pdev->pUserData)->MuteCtl(
					haudio->control.data[0]);
			haudio->control.cmd = 0U;
			haudio->control.len = 0U;
		}
	}

	if (AUDIO_CONTROL_VOLUME == haudio->control.cmd) {
		int vol = 0;
		int *v_usb = (int*) &(haudio->control.data);
		int vol_usb = *v_usb;

		vol = vol_usb / 256 * 2 + 1 - 255;
		vol /= -1;

		((USBD_AUDIO_ItfTypeDef*) pdev->pUserData)->VolumeCtl(vol);
		haudio->control.cmd = 0U;
		haudio->control.len = 0U;
	}

	return (uint8_t) USBD_OK;
}

void AUDIO_REQ_MUTE(USBD_HandleTypeDef *pdev, USBD_SetupReqTypedef *req) {
	USBD_AUDIO_HandleTypeDef *haudio;

	haudio = (USBD_AUDIO_HandleTypeDef*) pdev->pClassData;

	if (haudio == NULL) {
		return;
	}

	switch (req->bRequest) {
	case AUDIO_REQ_GET_CUR:
		(void) USBD_memset(haudio->control.data, 0, 64U);

		/* Send the current mute state */
		(void) USBD_CtlSendData(pdev, haudio->control.data, req->wLength);
		break;

	case AUDIO_REQ_SET_CUR:
		if (req->wLength != 0U) {
			/* Prepare the reception of the buffer over EP0 */
			(void) USBD_CtlPrepareRx(pdev, haudio->control.data, req->wLength);

			haudio->control.cmd = AUDIO_REQ_SET_CUR; /* Set the request value */
			haudio->control.len = (uint8_t) req->wLength; /* Set the request data length */
			haudio->control.unit = HIBYTE(req->wIndex); /* Set the request target unit */
		}
		break;

	}
}

void AUDIO_REQ_VOLUME(USBD_HandleTypeDef *pdev, USBD_SetupReqTypedef *req) {
	USBD_AUDIO_HandleTypeDef *haudio;
	uint16_t *buf = NULL;
	uint16_t CurVolume, MaxVolume, MinVolume, ResVolume;

	CurVolume = VOLUME_CUR;
	MinVolume = VOLUME_MIN;
	MaxVolume = VOLUME_MAX;
	ResVolume = VOLUME_RES;

	haudio = (USBD_AUDIO_HandleTypeDef*) pdev->pClassData;

	if (haudio == NULL) {
		return;
	}

	switch (req->bRequest) {
	case AUDIO_REQ_GET_CUR:
		buf = (uint16_t*) &(CurVolume);
		break;
	case AUDIO_REQ_GET_MIN:
		buf = (uint16_t*) &(MinVolume);
		break;
	case AUDIO_REQ_GET_MAX:
		buf = (uint16_t*) &(MaxVolume);
		break;
	case AUDIO_REQ_GET_RES:
		buf = (uint16_t*) &(ResVolume);
		break;
	case AUDIO_REQ_SET_CUR:
		if (req->wLength != 0U) {
			/* Prepare the reception of the buffer over EP0 */
			(void) USBD_CtlPrepareRx(pdev, haudio->control.data, req->wLength);

			haudio->control.cmd = AUDIO_CONTROL_VOLUME; /* Set the request value */
			haudio->control.len = (uint8_t) req->wLength; /* Set the request data length */
			haudio->control.unit = HIBYTE(req->wIndex); /* Set the request target unit */
		}

		return;

		break;
	}

	USBD_CtlSendData(pdev, (uint8_t*) buf, 2);
}

/**
 * @brief  AUDIO_REQ
 *         Handles the Control requests.
 * @param  pdev: instance
 * @param  req: setup class request
 * @retval status
 */
uint8_t AUDIO_REQ(USBD_HandleTypeDef *pdev, USBD_SetupReqTypedef *req) {
	uint8_t control_selector;

	control_selector = HIBYTE(req->wValue);

	switch (control_selector) {
	case AUDIO_CONTROL_MUTE:
		AUDIO_REQ_MUTE(pdev, req);
		break;

	case AUDIO_CONTROL_VOLUME:
		AUDIO_REQ_VOLUME(pdev, req);
		break;
	}

	return USBD_OK;
}
