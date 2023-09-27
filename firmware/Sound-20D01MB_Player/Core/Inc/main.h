/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2023 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define I2S_OSC_EN_Pin GPIO_PIN_2
#define I2S_OSC_EN_GPIO_Port GPIOC
#define DISP_LATCH_Pin GPIO_PIN_0
#define DISP_LATCH_GPIO_Port GPIOA
#define DISP_EN_Pin GPIO_PIN_1
#define DISP_EN_GPIO_Port GPIOA
#define PREV_Pin GPIO_PIN_2
#define PREV_GPIO_Port GPIOA
#define PREV_EXTI_IRQn EXTI2_IRQn
#define NEXT_Pin GPIO_PIN_3
#define NEXT_GPIO_Port GPIOA
#define NEXT_EXTI_IRQn EXTI3_IRQn
#define VOL_D_Pin GPIO_PIN_5
#define VOL_D_GPIO_Port GPIOA
#define VOL_D_EXTI_IRQn EXTI9_5_IRQn
#define VOL_U_Pin GPIO_PIN_6
#define VOL_U_GPIO_Port GPIOA
#define VOL_U_EXTI_IRQn EXTI9_5_IRQn
#define SHUTDOWN_Pin GPIO_PIN_4
#define SHUTDOWN_GPIO_Port GPIOC
#define MUTE_Pin GPIO_PIN_5
#define MUTE_GPIO_Port GPIOC
#define SD_DETECT_Pin GPIO_PIN_8
#define SD_DETECT_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
