/*
 * usb_audio.c
 *
 *  Created on: Dec 4, 2021
 *      Author: Sergey Pershin
 */

#include "usb_audio.h"

#define AUDIO_SAMPLE_FREQ(frq)         (uint8_t)(frq), (uint8_t)((frq >> 8)), (uint8_t)((frq >> 16))

#define AUDIO_PACKET_SZE(frq)          (uint8_t)(((frq * 2U * 2U)/1000U) & 0xFFU), \
                                       (uint8_t)((((frq * 2U * 2U)/1000U) >> 8) & 0xFFU)
/* USB AUDIO device Configuration Descriptor */
__ALIGN_BEGIN static uint8_t USBD_AUDIO_CfgDesc[USB_AUDIO_CONFIG_DESC_SIZ] __ALIGN_END
= {
/* Configuration 1 */
0x09, /* bLength */
USB_DESC_TYPE_CONFIGURATION, /* bDescriptorType */
LOBYTE(USB_AUDIO_CONFIG_DESC_SIZ), /* wTotalLength  109 bytes*/
HIBYTE(USB_AUDIO_CONFIG_DESC_SIZ), 0x02, /* bNumInterfaces */
0x01, /* bConfigurationValue */
0x00, /* iConfiguration */
#if (USBD_SELF_POWERED == 1U)
		0xC0, /* bmAttributes: Bus Powered according to user configuration */
#else
		0x80, /* bmAttributes: Bus Powered according to user configuration */
#endif
		USBD_MAX_POWER, /* bMaxPower = 100 mA */
		/* 09 byte*/

		/* USB Speaker Standard interface descriptor */
		AUDIO_INTERFACE_DESC_SIZE, /* bLength */
		USB_DESC_TYPE_INTERFACE, /* bDescriptorType */
		0x00, /* bInterfaceNumber */
		0x00, /* bAlternateSetting */
		0x00, /* bNumEndpoints */
		USB_DEVICE_CLASS_AUDIO, /* bInterfaceClass */
		AUDIO_SUBCLASS_AUDIOCONTROL, /* bInterfaceSubClass */
		AUDIO_PROTOCOL_UNDEFINED, /* bInterfaceProtocol */
		0x00, /* iInterface */
		/* 09 byte*/

		/* USB Speaker Class-specific AC Interface Descriptor */
		AUDIO_INTERFACE_DESC_SIZE, /* bLength */
		AUDIO_INTERFACE_DESCRIPTOR_TYPE, /* bDescriptorType */
		AUDIO_CONTROL_HEADER, /* bDescriptorSubtype */
		0x00, /* 1.00 *//* bcdADC */
		0x01, 0x27, /* wTotalLength = 39*/
		0x00, 0x01, /* bInCollection */
		0x01, /* baInterfaceNr */
		/* 09 byte*/

		/* USB Speaker Input Terminal Descriptor */
		AUDIO_INPUT_TERMINAL_DESC_SIZE, /* bLength */
		AUDIO_INTERFACE_DESCRIPTOR_TYPE, /* bDescriptorType */
		AUDIO_CONTROL_INPUT_TERMINAL, /* bDescriptorSubtype */
		0x01, /* bTerminalID */
		0x01, /* wTerminalType AUDIO_TERMINAL_USB_STREAMING   0x0101 */
		0x01, 0x00, /* bAssocTerminal */
		0x01, /* bNrChannels */
		0x00, /* wChannelConfig 0x0000  Mono */
		0x00, 0x00, /* iChannelNames */
		0x00, /* iTerminal */
		/* 12 byte*/

		/* USB Speaker Audio Feature Unit Descriptor */
		0x09, /* bLength */
		AUDIO_INTERFACE_DESCRIPTOR_TYPE, /* bDescriptorType */
		AUDIO_CONTROL_FEATURE_UNIT, /* bDescriptorSubtype */
		AUDIO_OUT_STREAMING_CTRL, /* bUnitID */
		0x01, /* bSourceID */
		0x01, /* bControlSize */
		AUDIO_CONTROL_MUTE | /* bmaControls(0) */
		AUDIO_CONTROL_VOLUME, 0, /* bmaControls(1) */
		0x00, /* iTerminal */
		/* 09 byte*/

		/*USB Speaker Output Terminal Descriptor */
		0x09, /* bLength */
		AUDIO_INTERFACE_DESCRIPTOR_TYPE, /* bDescriptorType */
		AUDIO_CONTROL_OUTPUT_TERMINAL, /* bDescriptorSubtype */
		0x03, /* bTerminalID */
		0x01, /* wTerminalType  0x0301*/
		0x03, 0x00, /* bAssocTerminal */
		0x02, /* bSourceID */
		0x00, /* iTerminal */
		/* 09 byte*/

		/* USB Speaker Standard AS Interface Descriptor - Audio Streaming Zero Bandwidth */
		/* Interface 1, Alternate Setting 0                                             */
		AUDIO_INTERFACE_DESC_SIZE, /* bLength */
		USB_DESC_TYPE_INTERFACE, /* bDescriptorType */
		0x01, /* bInterfaceNumber */
		0x00, /* bAlternateSetting */
		0x00, /* bNumEndpoints */
		USB_DEVICE_CLASS_AUDIO, /* bInterfaceClass */
		AUDIO_SUBCLASS_AUDIOSTREAMING, /* bInterfaceSubClass */
		AUDIO_PROTOCOL_UNDEFINED, /* bInterfaceProtocol */
		0x00, /* iInterface */
		/* 09 byte*/

		/* USB Speaker Standard AS Interface Descriptor - Audio Streaming Operational */
		/* Interface 1, Alternate Setting 1                                           */
		AUDIO_INTERFACE_DESC_SIZE, /* bLength */
		USB_DESC_TYPE_INTERFACE, /* bDescriptorType */
		0x01, /* bInterfaceNumber */
		0x01, /* bAlternateSetting */
		0x01, /* bNumEndpoints */
		USB_DEVICE_CLASS_AUDIO, /* bInterfaceClass */
		AUDIO_SUBCLASS_AUDIOSTREAMING, /* bInterfaceSubClass */
		AUDIO_PROTOCOL_UNDEFINED, /* bInterfaceProtocol */
		0x00, /* iInterface */
		/* 09 byte*/

		/* USB Speaker Audio Streaming Interface Descriptor */
		AUDIO_STREAMING_INTERFACE_DESC_SIZE, /* bLength */
		AUDIO_INTERFACE_DESCRIPTOR_TYPE, /* bDescriptorType */
		AUDIO_STREAMING_GENERAL, /* bDescriptorSubtype */
		0x01, /* bTerminalLink */
		0x01, /* bDelay */
		0x01, /* wFormatTag AUDIO_FORMAT_PCM  0x0001 */
		0x00,
		/* 07 byte*/

		/* USB Speaker Audio Type III Format Interface Descriptor */
		0x0B, /* bLength */
		AUDIO_INTERFACE_DESCRIPTOR_TYPE, /* bDescriptorType */
		AUDIO_STREAMING_FORMAT_TYPE, /* bDescriptorSubtype */
		AUDIO_FORMAT_TYPE_I, /* bFormatType */
		0x02, /* bNrChannels */
		0x02, /* bSubFrameSize :  2 Bytes per frame (16bits) */
		16, /* bBitResolution (16-bits per sample) */
		0x01, /* bSamFreqType only one frequency supported */
		AUDIO_SAMPLE_FREQ(USBD_AUDIO_FREQ), /* Audio sampling frequency coded on 3 bytes */
		/* 11 byte*/

		/* Endpoint 1 - Standard Descriptor */
		AUDIO_STANDARD_ENDPOINT_DESC_SIZE, /* bLength */
		USB_DESC_TYPE_ENDPOINT, /* bDescriptorType */
		AUDIO_OUT_EP, /* bEndpointAddress 1 out endpoint */
		USBD_EP_TYPE_ISOC, /* bmAttributes */
		AUDIO_PACKET_SZE(USBD_AUDIO_FREQ), /* wMaxPacketSize in Bytes (Freq(Samples)*2(Stereo)*2(HalfWord)) */
		AUDIO_FS_BINTERVAL, /* bInterval */
		0x00, /* bRefresh */
		0x00, /* bSynchAddress */
		/* 09 byte*/

		/* Endpoint - Audio Streaming Descriptor*/
		AUDIO_STREAMING_ENDPOINT_DESC_SIZE, /* bLength */
		AUDIO_ENDPOINT_DESCRIPTOR_TYPE, /* bDescriptorType */
		AUDIO_ENDPOINT_GENERAL, /* bDescriptor */
		0x00, /* bmAttributes */
		0x00, /* bLockDelayUnits */
		0x00, /* wLockDelay */
		0x00,
/* 07 byte*/
};

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

/**
 * @brief  USBD_AUDIO_GetCfgDesc
 *         return configuration descriptor
 * @param  speed : current device speed
 * @param  length : pointer data length
 * @retval pointer to descriptor buffer
 */
uint8_t* USB_AUDIO_GetCfgDesc(uint16_t *length) {
	*length = (uint16_t) sizeof(USBD_AUDIO_CfgDesc);

	return USBD_AUDIO_CfgDesc;
}

/**
 * @brief  USBD_AUDIO_Setup
 *         Handle the AUDIO specific requests
 * @param  pdev: instance
 * @param  req: usb requests
 * @retval status
 */
uint8_t USB_AUDIO_Setup(USBD_HandleTypeDef *pdev, USBD_SetupReqTypedef *req) {
	USBD_AUDIO_HandleTypeDef *haudio;
	uint16_t len;
	uint8_t *pbuf;
	uint16_t status_info = 0U;
	USBD_StatusTypeDef ret = USBD_OK;

	haudio = (USBD_AUDIO_HandleTypeDef*) pdev->pClassData;

	if (haudio == NULL) {
		return (uint8_t) USBD_FAIL;
	}

	switch (req->bmRequest & USB_REQ_TYPE_MASK) {
	case USB_REQ_TYPE_CLASS:
		switch (req->bRequest) {
		case AUDIO_REQ_GET_CUR:
		case AUDIO_REQ_GET_MIN:
		case AUDIO_REQ_GET_MAX:
		case AUDIO_REQ_GET_RES:
		case AUDIO_REQ_SET_CUR:
			ret = AUDIO_REQ(pdev, req);
			break;

		default:
			USBD_CtlError(pdev, req);
			ret = USBD_FAIL;
			break;
		}
		break;

	case USB_REQ_TYPE_STANDARD:
		switch (req->bRequest) {
		case USB_REQ_GET_STATUS:
			if (pdev->dev_state == USBD_STATE_CONFIGURED) {
				(void) USBD_CtlSendData(pdev, (uint8_t*) &status_info, 2U);
			} else {
				USBD_CtlError(pdev, req);
				ret = USBD_FAIL;
			}
			break;

		case USB_REQ_GET_DESCRIPTOR:
			if ((req->wValue >> 8) == AUDIO_DESCRIPTOR_TYPE) {
				pbuf = USBD_AUDIO_CfgDesc + 18;
				len = MIN(USB_AUDIO_DESC_SIZ, req->wLength);

				(void) USBD_CtlSendData(pdev, pbuf, len);
			}
			break;

		case USB_REQ_GET_INTERFACE:
			if (pdev->dev_state == USBD_STATE_CONFIGURED) {
				(void) USBD_CtlSendData(pdev, (uint8_t*) &haudio->alt_setting,
						1U);
			} else {
				USBD_CtlError(pdev, req);
				ret = USBD_FAIL;
			}
			break;

		case USB_REQ_SET_INTERFACE:
			if (pdev->dev_state == USBD_STATE_CONFIGURED) {
				if ((uint8_t) (req->wValue) <= USBD_MAX_NUM_INTERFACES) {
					haudio->alt_setting = (uint8_t) (req->wValue);
				} else {
					/* Call the error management function (command will be NAKed */
					USBD_CtlError(pdev, req);
					ret = USBD_FAIL;
				}
			} else {
				USBD_CtlError(pdev, req);
				ret = USBD_FAIL;
			}
			break;

		case USB_REQ_CLEAR_FEATURE:
			break;

		default:
			USBD_CtlError(pdev, req);
			ret = USBD_FAIL;
			break;
		}
		break;
	default:
		USBD_CtlError(pdev, req);
		ret = USBD_FAIL;
		break;
	}

	return (uint8_t) ret;
}

