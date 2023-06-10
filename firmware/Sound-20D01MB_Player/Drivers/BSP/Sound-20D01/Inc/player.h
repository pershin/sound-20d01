/**
  ******************************************************************************
  * @file    player-001mb.h
  * @author  Sergey Pershin
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __PLAYER_001MB_H
#define __PLAYER_001MB_H

#ifdef __cplusplus
 extern "C" {
#endif

/** @addtogroup BSP
  * @{
  */

/** @defgroup STM32F0XX_NUCLEO STM32F0XX-NUCLEO
  * @{
  */

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"
#include "main.h"

/**
  * @}
  */

/** @defgroup STM32F0XX_NUCLEO_Exported_Constants Exported Constants
  * @{
  */

/**
* @brief	Define for STM32F0XX_NUCLEO board
  */
#if !defined (USE_STM32F0XX_NUCLEO)
 #define USE_STM32F0XX_NUCLEO
#endif

/**
  * @}
  */

/** @defgroup STM32F0XX_NUCLEO_BUS BUS Constants
  * @{
  */
/*###################### SPI2 ###################################*/
#define NUCLEO_SPIx                                 SPI1

#define NUCLEO_SPIx_SCK_AF                          GPIO_AF0_SPI1
#define NUCLEO_SPIx_SCK_GPIO_PORT                   GPIOA
#define NUCLEO_SPIx_SCK_PIN                         GPIO_PIN_5

#define NUCLEO_SPIx_MISO_MOSI_AF                    GPIO_AF0_SPI1
#define NUCLEO_SPIx_MISO_MOSI_GPIO_PORT             GPIOA
#define NUCLEO_SPIx_MISO_PIN                        GPIO_PIN_6
#define NUCLEO_SPIx_MOSI_PIN                        GPIO_PIN_7
/* Maximum Timeout values for flags waiting loops. These timeouts are not based
   on accurate values, they just guarantee that the application will not remain
   stuck if the SPI communication is corrupted.
   You may modify these timeout values depending on CPU frequency and application
   conditions (interrupts routines ...). */
#define NUCLEO_SPIx_TIMEOUT_MAX                   1000

/**
  * @brief  SD Control Lines management
  */
#define SD_CS_LOW()       HAL_GPIO_WritePin(SD_CS_GPIO_Port, SD_CS_Pin, GPIO_PIN_RESET)
#define SD_CS_HIGH()      HAL_GPIO_WritePin(SD_CS_GPIO_Port, SD_CS_Pin, GPIO_PIN_SET)

#ifdef __cplusplus
}
#endif

#endif /* __PLAYER_001MB_H */


/************************ (C) COPYRIGHT Sergey Pershin *****END OF FILE****/

