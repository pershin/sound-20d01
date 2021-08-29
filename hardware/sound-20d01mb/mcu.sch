EESchema Schematic File Version 4
LIBS:sound-20d01mb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title "Sound-20D01MB"
Date "2021-07-01"
Rev "0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L sound-20d01_Library:STM32F446RCTx U?
U 1 1 60E3A9D6
P 5300 3650
F 0 "U?" H 5300 3700 50  0000 C CNN
F 1 "STM32F446RCTx" H 5300 3600 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 5300 2150 50  0001 C CNN
F 3 "https://www.st.com/resource/en/datasheet/stm32f446rc.pdf" H 5300 2050 50  0001 C CNN
	1    5300 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 60E4F6E1
P 2150 3900
F 0 "Y?" H 2150 4168 50  0000 C CNN
F 1 "8MHz" H 2150 4077 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_HC49-SD" H 2150 3900 50  0001 C CNN
F 3 "~" H 2150 3900 50  0001 C CNN
	1    2150 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E4F76A
P 1900 4150
F 0 "C?" H 2015 4196 50  0000 L CNN
F 1 "22pF" H 2015 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1938 4000 50  0001 C CNN
F 3 "~" H 1900 4150 50  0001 C CNN
	1    1900 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E4F7B1
P 2400 4150
F 0 "C?" H 2515 4196 50  0000 L CNN
F 1 "22pF" H 2515 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2438 4000 50  0001 C CNN
F 3 "~" H 2400 4150 50  0001 C CNN
	1    2400 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E4F84A
P 2150 4500
F 0 "#PWR?" H 2150 4250 50  0001 C CNN
F 1 "GNDD" H 2154 4345 50  0000 C CNN
F 2 "" H 2150 4500 50  0001 C CNN
F 3 "" H 2150 4500 50  0001 C CNN
	1    2150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4300 1900 4400
Wire Wire Line
	1900 4400 2150 4400
Wire Wire Line
	2150 4400 2150 4500
Wire Wire Line
	2400 4300 2400 4400
Wire Wire Line
	2400 4400 2150 4400
Connection ~ 2150 4400
Wire Wire Line
	1900 4000 1900 3900
Wire Wire Line
	1900 3900 2000 3900
$Comp
L Device:R R?
U 1 1 60E4F913
P 2400 3650
F 0 "R?" H 2470 3696 50  0000 L CNN
F 1 "390R" H 2470 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 2330 3650 50  0001 C CNN
F 3 "~" H 2400 3650 50  0001 C CNN
	1    2400 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3900 2400 3900
Wire Wire Line
	2400 3900 2400 3800
Wire Wire Line
	2400 3900 2400 4000
Connection ~ 2400 3900
Wire Wire Line
	2400 3500 2400 3400
Wire Wire Line
	2400 3400 4150 3400
Wire Wire Line
	4150 3300 1900 3300
Wire Wire Line
	1900 3300 1900 3900
Connection ~ 1900 3900
$Comp
L Device:C C?
U 1 1 60DFE031
P 5850 5550
F 0 "C?" H 5965 5596 50  0000 L CNN
F 1 "4.7uF" H 5965 5505 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5888 5400 50  0001 C CNN
F 3 "~" H 5850 5550 50  0001 C CNN
	1    5850 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60DFE1A0
P 5850 5800
F 0 "#PWR?" H 5850 5550 50  0001 C CNN
F 1 "GNDD" H 5854 5645 50  0000 C CNN
F 2 "" H 5850 5800 50  0001 C CNN
F 3 "" H 5850 5800 50  0001 C CNN
	1    5850 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 5700 5850 5800
$Comp
L Power_Protection:USBLC6-2SC6 U?
U 1 1 60E02D08
P 9050 3400
F 0 "U?" H 9450 3900 50  0000 C CNN
F 1 "USBLC6-2SC6" H 9450 3800 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 8300 3800 50  0001 C CNN
F 3 "http://www2.st.com/resource/en/datasheet/CD00050750.pdf" H 9250 3750 50  0001 C CNN
	1    9050 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E410D2
P 7150 2450
F 0 "C?" H 7265 2496 50  0000 L CNN
F 1 "0.1uF" H 7265 2405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7188 2300 50  0001 C CNN
F 3 "~" H 7150 2450 50  0001 C CNN
	1    7150 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E410D8
P 7150 2800
F 0 "#PWR?" H 7150 2550 50  0001 C CNN
F 1 "GNDD" H 7154 2645 50  0000 C CNN
F 2 "" H 7150 2800 50  0001 C CNN
F 3 "" H 7150 2800 50  0001 C CNN
	1    7150 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60E410DE
P 7150 2100
F 0 "#PWR?" H 7150 1950 50  0001 C CNN
F 1 "+3.3V" H 7165 2273 50  0000 C CNN
F 2 "" H 7150 2100 50  0001 C CNN
F 3 "" H 7150 2100 50  0001 C CNN
	1    7150 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E410E6
P 5250 6000
F 0 "C?" H 5365 6046 50  0000 L CNN
F 1 "0.1uF" H 5365 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5288 5850 50  0001 C CNN
F 3 "~" H 5250 6000 50  0001 C CNN
	1    5250 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E410EC
P 5250 6350
F 0 "#PWR?" H 5250 6100 50  0001 C CNN
F 1 "GNDD" H 5254 6195 50  0000 C CNN
F 2 "" H 5250 6350 50  0001 C CNN
F 3 "" H 5250 6350 50  0001 C CNN
	1    5250 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60E410F2
P 5250 5650
F 0 "#PWR?" H 5250 5500 50  0001 C CNN
F 1 "+3.3V" H 5265 5823 50  0000 C CNN
F 2 "" H 5250 5650 50  0001 C CNN
F 3 "" H 5250 5650 50  0001 C CNN
	1    5250 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60E0CD4B
P 9800 3300
AR Path="/60DE2DF1/60E0CD4B" Ref="R?"  Part="1" 
AR Path="/60DE2DEE/60E0CD4B" Ref="R?"  Part="1" 
F 0 "R?" V 10007 3300 50  0000 C CNN
F 1 "22R" V 9916 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 9730 3300 50  0001 C CNN
F 3 "~" H 9800 3300 50  0001 C CNN
	1    9800 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 60E0D024
P 8300 3300
AR Path="/60DE2DF1/60E0D024" Ref="R?"  Part="1" 
AR Path="/60DE2DEE/60E0D024" Ref="R?"  Part="1" 
F 0 "R?" V 8507 3300 50  0000 C CNN
F 1 "22R" V 8416 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 8230 3300 50  0001 C CNN
F 3 "~" H 8300 3300 50  0001 C CNN
	1    8300 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E0D139
P 9050 4000
F 0 "#PWR?" H 9050 3750 50  0001 C CNN
F 1 "GNDD" H 9054 3845 50  0000 C CNN
F 2 "" H 9050 4000 50  0001 C CNN
F 3 "" H 9050 4000 50  0001 C CNN
	1    9050 4000
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 60E0DEA4
P 8550 2300
F 0 "#PWR?" H 8550 2150 50  0001 C CNN
F 1 "VBUS" H 8565 2473 50  0000 C CNN
F 2 "" H 8550 2300 50  0001 C CNN
F 3 "" H 8550 2300 50  0001 C CNN
	1    8550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3300 8450 3300
Wire Wire Line
	9550 3300 9650 3300
Wire Wire Line
	9050 3900 9050 4000
Text HLabel 9650 3500 2    50   Input ~ 0
USB_D+
Wire Wire Line
	9550 3500 9650 3500
Text HLabel 8450 3500 0    50   Input ~ 0
USB_D-
Wire Wire Line
	8550 3500 8450 3500
Wire Wire Line
	6450 3300 8150 3300
Wire Wire Line
	6450 3200 8050 3200
Wire Wire Line
	10050 3300 9950 3300
$Comp
L Device:C C?
U 1 1 60E162CF
P 8550 2650
F 0 "C?" H 8665 2696 50  0000 L CNN
F 1 "0.1uF" H 8665 2605 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 8588 2500 50  0001 C CNN
F 3 "~" H 8550 2650 50  0001 C CNN
	1    8550 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E162D5
P 8550 2900
F 0 "#PWR?" H 8550 2650 50  0001 C CNN
F 1 "GNDD" H 8554 2745 50  0000 C CNN
F 2 "" H 8550 2900 50  0001 C CNN
F 3 "" H 8550 2900 50  0001 C CNN
	1    8550 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 2800 8550 2900
Wire Wire Line
	8550 2300 8550 2400
Wire Wire Line
	8550 2400 9050 2400
Wire Wire Line
	9050 2400 9050 2900
Connection ~ 8550 2400
Wire Wire Line
	8550 2400 8550 2500
Wire Wire Line
	8050 3200 8050 2000
Wire Wire Line
	8050 2000 10050 2000
Wire Wire Line
	10050 2000 10050 3300
Text Label 6550 3200 0    50   ~ 0
USB_OTG_FS_DP
Text Label 6550 3300 0    50   ~ 0
USB_OTG_FS_DM
Text Label 4050 3300 2    50   ~ 0
RCC_OSC_IN
Text Label 4050 3400 2    50   ~ 0
RCC_OSC_OUT
Text Label 5850 4900 3    50   ~ 0
VCAP_1
Text HLabel 2900 3500 0    50   Input ~ 0
NRST
Wire Wire Line
	3000 3500 2900 3500
$Comp
L Device:C C?
U 1 1 60E1EA7B
P 3000 3750
F 0 "C?" H 3115 3796 50  0000 L CNN
F 1 "0.1uF" H 3115 3705 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3038 3600 50  0001 C CNN
F 3 "~" H 3000 3750 50  0001 C CNN
	1    3000 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E1EA81
P 3000 4000
F 0 "#PWR?" H 3000 3750 50  0001 C CNN
F 1 "GNDD" H 3004 3845 50  0000 C CNN
F 2 "" H 3000 4000 50  0001 C CNN
F 3 "" H 3000 4000 50  0001 C CNN
	1    3000 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3500 3000 3600
Wire Wire Line
	3000 3900 3000 4000
Wire Wire Line
	4150 3500 3000 3500
Connection ~ 3000 3500
$Comp
L Device:R R?
U 1 1 60E2B6B7
P 5450 1250
F 0 "R?" H 5520 1296 50  0000 L CNN
F 1 "10K" H 5520 1205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5380 1250 50  0001 C CNN
F 3 "~" H 5450 1250 50  0001 C CNN
	1    5450 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E2C5EF
P 5450 1500
F 0 "#PWR?" H 5450 1250 50  0001 C CNN
F 1 "GNDD" H 5454 1345 50  0000 C CNN
F 2 "" H 5450 1500 50  0001 C CNN
F 3 "" H 5450 1500 50  0001 C CNN
	1    5450 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1400 5450 1500
Text HLabel 5450 900  1    50   Input ~ 0
BOOT0
Wire Wire Line
	5450 900  5450 1000
Wire Wire Line
	4950 1000 5450 1000
Connection ~ 5450 1000
Wire Wire Line
	5450 1000 5450 1100
Wire Wire Line
	4950 2500 4950 1000
Text HLabel 6550 3100 2    50   BiDi ~ 0
SWDIO
Wire Wire Line
	6450 3100 6550 3100
Text HLabel 6050 2400 1    50   Input ~ 0
SWCLK
Wire Wire Line
	6050 2500 6050 2400
$Comp
L Device:C C?
U 1 1 60E4B181
P 3250 4850
F 0 "C?" H 3365 4896 50  0000 L CNN
F 1 "0.1uF" H 3365 4805 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3288 4700 50  0001 C CNN
F 3 "~" H 3250 4850 50  0001 C CNN
	1    3250 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E4B187
P 3000 5200
F 0 "#PWR?" H 3000 4950 50  0001 C CNN
F 1 "GNDD" H 3004 5045 50  0000 C CNN
F 2 "" H 3000 5200 50  0001 C CNN
F 3 "" H 3000 5200 50  0001 C CNN
	1    3000 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60E4B18D
P 2750 4500
F 0 "#PWR?" H 2750 4350 50  0001 C CNN
F 1 "+3.3V" H 2765 4673 50  0000 C CNN
F 2 "" H 2750 4500 50  0001 C CNN
F 3 "" H 2750 4500 50  0001 C CNN
	1    2750 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4600 3250 4700
Wire Wire Line
	3250 5000 3250 5100
$Comp
L Device:C C?
U 1 1 60E4BD5E
P 2750 4850
F 0 "C?" H 2865 4896 50  0000 L CNN
F 1 "1uF" H 2865 4805 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2788 4700 50  0001 C CNN
F 3 "~" H 2750 4850 50  0001 C CNN
	1    2750 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4600 2750 4700
Wire Wire Line
	3250 5100 3000 5100
Wire Wire Line
	2750 5100 2750 5000
Wire Wire Line
	3000 5100 3000 5200
Connection ~ 3000 5100
Wire Wire Line
	3000 5100 2750 5100
Wire Wire Line
	2750 4600 2750 4500
Wire Wire Line
	4150 4100 3250 4100
Wire Wire Line
	3250 4100 3250 4600
Connection ~ 3250 4600
Connection ~ 2750 4600
Wire Wire Line
	2750 4600 3250 4600
Wire Wire Line
	5250 5850 5250 5750
Wire Wire Line
	5250 6150 5250 6250
Wire Wire Line
	5250 5750 4750 5750
Wire Wire Line
	4750 5750 4750 4800
Connection ~ 5250 5750
Wire Wire Line
	5250 5750 5250 5650
Wire Wire Line
	5250 6250 4650 6250
Wire Wire Line
	4650 6250 4650 4800
Wire Wire Line
	5250 6250 5250 6350
Connection ~ 5250 6250
Wire Wire Line
	7150 2300 7150 2200
Wire Wire Line
	7150 2600 7150 2700
Wire Wire Line
	6450 2900 6550 2900
Wire Wire Line
	6550 2900 6550 2200
Wire Wire Line
	6550 2200 7150 2200
Connection ~ 7150 2200
Wire Wire Line
	7150 2200 7150 2100
Wire Wire Line
	6450 3000 6650 3000
Wire Wire Line
	6650 3000 6650 2700
Wire Wire Line
	6650 2700 7150 2700
Connection ~ 7150 2700
Wire Wire Line
	7150 2700 7150 2800
$Comp
L power:GNDD #PWR?
U 1 1 60EB0F57
P 3500 4200
F 0 "#PWR?" H 3500 3950 50  0001 C CNN
F 1 "GNDD" H 3504 4045 50  0000 C CNN
F 2 "" H 3500 4200 50  0001 C CNN
F 3 "" H 3500 4200 50  0001 C CNN
	1    3500 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4000 3500 4000
Wire Wire Line
	3500 4000 3500 4200
$Comp
L Device:C C?
U 1 1 60EB8FC3
P 6550 5150
F 0 "C?" H 6665 5196 50  0000 L CNN
F 1 "0.1uF" H 6665 5105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6588 5000 50  0001 C CNN
F 3 "~" H 6550 5150 50  0001 C CNN
	1    6550 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60EB8FC9
P 6550 5500
F 0 "#PWR?" H 6550 5250 50  0001 C CNN
F 1 "GNDD" H 6554 5345 50  0000 C CNN
F 2 "" H 6550 5500 50  0001 C CNN
F 3 "" H 6550 5500 50  0001 C CNN
	1    6550 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60EB8FCF
P 6550 4800
F 0 "#PWR?" H 6550 4650 50  0001 C CNN
F 1 "+3.3V" H 6565 4973 50  0000 C CNN
F 2 "" H 6550 4800 50  0001 C CNN
F 3 "" H 6550 4800 50  0001 C CNN
	1    6550 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4800 6050 4900
Wire Wire Line
	5950 4800 5950 5400
$Comp
L Device:C C?
U 1 1 60EBF9D5
P 3200 2450
F 0 "C?" H 3315 2496 50  0000 L CNN
F 1 "0.1uF" H 3315 2405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3238 2300 50  0001 C CNN
F 3 "~" H 3200 2450 50  0001 C CNN
	1    3200 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60EBF9DB
P 3200 2800
F 0 "#PWR?" H 3200 2550 50  0001 C CNN
F 1 "GNDD" H 3204 2645 50  0000 C CNN
F 2 "" H 3200 2800 50  0001 C CNN
F 3 "" H 3200 2800 50  0001 C CNN
	1    3200 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60EBF9E1
P 3200 2100
F 0 "#PWR?" H 3200 1950 50  0001 C CNN
F 1 "+3.3V" H 3215 2273 50  0000 C CNN
F 2 "" H 3200 2100 50  0001 C CNN
F 3 "" H 3200 2100 50  0001 C CNN
	1    3200 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2100 3200 2200
Connection ~ 3200 2200
Wire Wire Line
	3200 2200 3200 2300
Wire Wire Line
	4550 2500 4550 2200
Wire Wire Line
	4550 2200 3200 2200
Wire Wire Line
	3200 2600 3200 2700
Wire Wire Line
	3200 2700 3700 2700
Connection ~ 3200 2700
Wire Wire Line
	3200 2700 3200 2800
Wire Wire Line
	3700 2700 3700 2400
Wire Wire Line
	3700 2400 4650 2400
Wire Wire Line
	4650 2400 4650 2500
Wire Wire Line
	6550 4800 6550 4900
Wire Wire Line
	6050 4900 6550 4900
Connection ~ 6550 4900
Wire Wire Line
	6550 4900 6550 5000
Wire Wire Line
	5950 5400 6550 5400
Wire Wire Line
	6550 5300 6550 5400
Connection ~ 6550 5400
Wire Wire Line
	6550 5400 6550 5500
Wire Wire Line
	5850 4800 5850 5400
Text HLabel 4750 2400 1    50   Output ~ 0
SAI1_FS_B
Wire Wire Line
	4750 2500 4750 2400
Text HLabel 6550 3500 2    50   Output ~ 0
SAI1_SD_B
Wire Wire Line
	6450 3500 6550 3500
Text HLabel 6550 4400 2    50   Output ~ 0
SAI1_SCK_B
Wire Wire Line
	6450 4400 6550 4400
Text HLabel 4050 3600 0    50   Output ~ 0
SAI1_MCLK_B
Wire Wire Line
	4150 3600 4050 3600
Text HLabel 5450 2400 1    50   Output ~ 0
SWO
Wire Wire Line
	5450 2500 5450 2400
$Comp
L Device:Crystal Y?
U 1 1 60E3EBB3
P 1150 3900
F 0 "Y?" H 1150 4168 50  0000 C CNN
F 1 "32.768kHz" H 1150 4077 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_3215-2Pin_3.2x1.5mm" H 1150 3900 50  0001 C CNN
F 3 "~" H 1150 3900 50  0001 C CNN
	1    1150 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E3ED93
P 1150 4500
F 0 "#PWR?" H 1150 4250 50  0001 C CNN
F 1 "GNDD" H 1154 4345 50  0000 C CNN
F 2 "" H 1150 4500 50  0001 C CNN
F 3 "" H 1150 4500 50  0001 C CNN
	1    1150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  4300 900  4400
Wire Wire Line
	900  4400 1150 4400
Wire Wire Line
	1150 4400 1150 4500
Wire Wire Line
	1400 4300 1400 4400
Wire Wire Line
	1400 4400 1150 4400
Connection ~ 1150 4400
Wire Wire Line
	4150 3200 1400 3200
Wire Wire Line
	1400 3200 1400 3900
Wire Wire Line
	1400 3900 1300 3900
Wire Wire Line
	1400 3900 1400 4000
Connection ~ 1400 3900
Wire Wire Line
	4150 3100 900  3100
Wire Wire Line
	900  3100 900  3900
Wire Wire Line
	900  3900 1000 3900
Wire Wire Line
	900  3900 900  4000
Connection ~ 900  3900
Text Label 4050 3100 2    50   ~ 0
RCC_OSC32_IN
Text Label 4050 3200 2    50   ~ 0
RCC_OSC32_OUT
$Comp
L Device:C C?
U 1 1 60E6BE1E
P 900 4150
F 0 "C?" H 1015 4196 50  0000 L CNN
F 1 "C" H 1015 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 938 4000 50  0001 C CNN
F 3 "~" H 900 4150 50  0001 C CNN
	1    900  4150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E6F7A2
P 1400 4150
F 0 "C?" H 1515 4196 50  0000 L CNN
F 1 "C" H 1515 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1438 4000 50  0001 C CNN
F 3 "~" H 1400 4150 50  0001 C CNN
	1    1400 4150
	1    0    0    -1  
$EndComp
$Sheet
S 8550 4450 1000 1000
U 612AF97F
F0 "Oscillators" 50
F1 "oscillators.sch" 50
F2 "OSC_OUTPUT" O L 8550 4550 50 
F3 "OSC_SEL" I L 8550 4650 50 
$EndSheet
Wire Wire Line
	8550 4550 8050 4550
Wire Wire Line
	8050 4550 8050 3700
Wire Wire Line
	8050 3700 6450 3700
Text Label 6550 3700 0    50   ~ 0
I2S_CKIN
$EndSCHEMATC
