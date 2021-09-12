EESchema Schematic File Version 4
LIBS:sound-20d01mb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
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
L sound-20d01_Library:TPA3122D2 U?
U 1 1 60DE3B7A
P 5150 3600
F 0 "U?" H 5150 4317 50  0000 C CNN
F 1 "TPA3122D2" H 5150 4226 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 5150 3000 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/tpa3122d2.pdf" H 5150 2900 50  0001 C CNN
	1    5150 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 60DF8A1B
P 6850 2950
F 0 "L?" V 7040 2950 50  0000 C CNN
F 1 "22uH" V 6949 2950 50  0000 C CNN
F 2 "Inductor_SMD:L_Bourns_SRR1260" H 6850 2950 50  0001 C CNN
F 3 "~" H 6850 2950 50  0001 C CNN
	1    6850 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 60DF8A9B
P 6350 3350
F 0 "C?" V 6602 3350 50  0000 C CNN
F 1 "0.22uF" V 6511 3350 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6388 3200 50  0001 C CNN
F 3 "~" H 6350 3350 50  0001 C CNN
	1    6350 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 60DF8C16
P 7100 3200
F 0 "R?" H 7170 3246 50  0000 L CNN
F 1 "4.7K" H 7170 3155 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7030 3200 50  0001 C CNN
F 3 "~" H 7100 3200 50  0001 C CNN
	1    7100 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60DF8C7B
P 7600 3200
F 0 "C?" H 7715 3246 50  0000 L CNN
F 1 "0.68uF" H 7715 3155 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W4.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 7638 3050 50  0001 C CNN
F 3 "~" H 7600 3200 50  0001 C CNN
	1    7600 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 60DF8CEC
P 8300 2950
F 0 "C?" V 8555 2950 50  0000 C CNN
F 1 "4700uF" V 8464 2950 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 8338 2800 50  0001 C CNN
F 3 "~" H 8300 2950 50  0001 C CNN
	1    8300 2950
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 60DF8FE5
P 6850 3700
F 0 "#PWR?" H 6850 3450 50  0001 C CNN
F 1 "GNDA" H 6855 3527 50  0000 C CNN
F 2 "" H 6850 3700 50  0001 C CNN
F 3 "" H 6850 3700 50  0001 C CNN
	1    6850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2950 7100 2950
Wire Wire Line
	7100 2950 7100 3050
Connection ~ 7100 2950
Wire Wire Line
	7100 2950 7600 2950
Wire Wire Line
	7600 2950 7600 3050
Connection ~ 7600 2950
Wire Wire Line
	7600 2950 8150 2950
Wire Wire Line
	7600 3350 7600 3450
Wire Wire Line
	7600 3450 7100 3450
Wire Wire Line
	6850 3600 6850 3700
Wire Wire Line
	7100 3350 7100 3450
Wire Wire Line
	6100 3250 6100 2950
Wire Wire Line
	6100 2950 6600 2950
Wire Wire Line
	6500 3350 6600 3350
Wire Wire Line
	6600 3350 6600 2950
Connection ~ 6600 2950
Wire Wire Line
	6600 2950 6700 2950
$Comp
L Device:L L?
U 1 1 60E046DB
P 6850 4250
F 0 "L?" V 7040 4250 50  0000 C CNN
F 1 "22uH" V 6949 4250 50  0000 C CNN
F 2 "Inductor_SMD:L_Bourns_SRR1260" H 6850 4250 50  0001 C CNN
F 3 "~" H 6850 4250 50  0001 C CNN
	1    6850 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 60E046E1
P 6350 3850
F 0 "C?" V 6602 3850 50  0000 C CNN
F 1 "0.22uF" V 6511 3850 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6388 3700 50  0001 C CNN
F 3 "~" H 6350 3850 50  0001 C CNN
	1    6350 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 60E046E7
P 7100 4000
F 0 "R?" H 7170 4046 50  0000 L CNN
F 1 "4.7K" H 7170 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7030 4000 50  0001 C CNN
F 3 "~" H 7100 4000 50  0001 C CNN
	1    7100 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E046ED
P 7600 4000
F 0 "C?" H 7715 4046 50  0000 L CNN
F 1 "0.68uF" H 7715 3955 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W4.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 7638 3850 50  0001 C CNN
F 3 "~" H 7600 4000 50  0001 C CNN
	1    7600 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 60E046F3
P 8300 4250
F 0 "C?" V 8555 4250 50  0000 C CNN
F 1 "4700uF" V 8464 4250 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 8338 4100 50  0001 C CNN
F 3 "~" H 8300 4250 50  0001 C CNN
	1    8300 4250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7000 4250 7100 4250
Wire Wire Line
	7100 3750 7100 3850
Connection ~ 7100 4250
Wire Wire Line
	7100 4250 7600 4250
Wire Wire Line
	7600 3750 7600 3850
Connection ~ 7600 4250
Wire Wire Line
	7600 4250 8150 4250
Wire Wire Line
	7600 4150 7600 4250
Wire Wire Line
	7100 4150 7100 4250
Wire Wire Line
	6100 4250 6100 3950
Wire Wire Line
	6500 3850 6600 3850
Wire Wire Line
	6600 4250 6600 3850
Wire Wire Line
	6100 4250 6600 4250
Connection ~ 6600 4250
Wire Wire Line
	6600 4250 6700 4250
Wire Wire Line
	7600 3750 7100 3750
Wire Wire Line
	7100 3450 7100 3600
Connection ~ 7100 3450
Connection ~ 7100 3750
Wire Wire Line
	7100 3600 6850 3600
Connection ~ 7100 3600
Wire Wire Line
	7100 3600 7100 3750
$Comp
L power:GNDA #PWR?
U 1 1 60E18B79
P 5150 4350
F 0 "#PWR?" H 5150 4100 50  0001 C CNN
F 1 "GNDA" H 5155 4177 50  0000 C CNN
F 2 "" H 5150 4350 50  0001 C CNN
F 3 "" H 5150 4350 50  0001 C CNN
	1    5150 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4050 5750 4050
Wire Wire Line
	5650 3150 5750 3150
Wire Wire Line
	5750 3150 5750 4050
$Comp
L Device:C C?
U 1 1 60E1A10C
P 6350 2200
F 0 "C?" H 6465 2246 50  0000 L CNN
F 1 "0.1uF" H 6465 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6388 2050 50  0001 C CNN
F 3 "~" H 6350 2200 50  0001 C CNN
	1    6350 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2050 6850 1950
Wire Wire Line
	6850 1950 6350 1950
Wire Wire Line
	6350 1950 6350 2050
Wire Wire Line
	6350 2350 6350 2450
Wire Wire Line
	6350 2450 6600 2450
Wire Wire Line
	6850 2450 6850 2350
$Comp
L power:GNDA #PWR?
U 1 1 60E1C910
P 6600 2550
F 0 "#PWR?" H 6600 2300 50  0001 C CNN
F 1 "GNDA" H 6605 2377 50  0000 C CNN
F 2 "" H 6600 2550 50  0001 C CNN
F 3 "" H 6600 2550 50  0001 C CNN
	1    6600 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2450 6600 2550
Connection ~ 6600 2450
Wire Wire Line
	6600 2450 6850 2450
Wire Wire Line
	5650 3450 5850 3450
Wire Wire Line
	5850 3450 5850 1950
Wire Wire Line
	6350 1950 5850 1950
Connection ~ 6350 1950
Wire Wire Line
	5650 3550 5850 3550
Wire Wire Line
	5850 3550 5850 3450
Connection ~ 5850 3450
$Comp
L power:VCC #PWR?
U 1 1 60E226AA
P 6850 1850
F 0 "#PWR?" H 6850 1700 50  0001 C CNN
F 1 "VCC" H 6867 2023 50  0000 C CNN
F 2 "" H 6850 1850 50  0001 C CNN
F 3 "" H 6850 1850 50  0001 C CNN
	1    6850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1950 6850 1850
Connection ~ 6850 1950
Wire Wire Line
	5650 3250 6100 3250
Wire Wire Line
	5650 3950 6100 3950
Wire Wire Line
	5650 3350 6200 3350
Wire Wire Line
	5650 3850 6200 3850
$Comp
L Device:C C?
U 1 1 60E33670
P 4900 2200
F 0 "C?" H 5015 2246 50  0000 L CNN
F 1 "0.1uF" H 5015 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4938 2050 50  0001 C CNN
F 3 "~" H 4900 2200 50  0001 C CNN
	1    4900 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2050 5400 1950
Wire Wire Line
	5400 1950 4900 1950
Wire Wire Line
	4900 1950 4900 2050
Wire Wire Line
	4900 2350 4900 2450
Wire Wire Line
	4900 2450 5150 2450
Wire Wire Line
	5400 2450 5400 2350
$Comp
L power:GNDA #PWR?
U 1 1 60E3367C
P 5150 2550
F 0 "#PWR?" H 5150 2300 50  0001 C CNN
F 1 "GNDA" H 5155 2377 50  0000 C CNN
F 2 "" H 5150 2550 50  0001 C CNN
F 3 "" H 5150 2550 50  0001 C CNN
	1    5150 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 2450 5150 2550
Connection ~ 5150 2450
Wire Wire Line
	5150 2450 5400 2450
Wire Wire Line
	4900 1950 4400 1950
Connection ~ 4900 1950
$Comp
L power:VCC #PWR?
U 1 1 60E33687
P 5400 1850
F 0 "#PWR?" H 5400 1700 50  0001 C CNN
F 1 "VCC" H 5417 2023 50  0000 C CNN
F 2 "" H 5400 1850 50  0001 C CNN
F 3 "" H 5400 1850 50  0001 C CNN
	1    5400 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1950 5400 1850
Connection ~ 5400 1950
$Comp
L Device:CP C?
U 1 1 60E34B94
P 5400 2200
F 0 "C?" H 5518 2246 50  0000 L CNN
F 1 "470uF" H 5518 2155 50  0000 L CNN
F 2 "" H 5438 2050 50  0001 C CNN
F 3 "~" H 5400 2200 50  0001 C CNN
	1    5400 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3150 4550 3150
Wire Wire Line
	4400 3150 4400 1950
$Comp
L Device:C C?
U 1 1 60E37B47
P 4900 5000
F 0 "C?" H 5015 5046 50  0000 L CNN
F 1 "0.1uF" H 5015 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4938 4850 50  0001 C CNN
F 3 "~" H 4900 5000 50  0001 C CNN
	1    4900 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4850 5400 4750
Wire Wire Line
	5400 4750 4900 4750
Wire Wire Line
	4900 4750 4900 4850
Wire Wire Line
	4900 5150 4900 5250
Wire Wire Line
	4900 5250 5150 5250
Wire Wire Line
	5400 5250 5400 5150
$Comp
L power:GNDA #PWR?
U 1 1 60E37B53
P 5150 5350
F 0 "#PWR?" H 5150 5100 50  0001 C CNN
F 1 "GNDA" H 5155 5177 50  0000 C CNN
F 2 "" H 5150 5350 50  0001 C CNN
F 3 "" H 5150 5350 50  0001 C CNN
	1    5150 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5250 5150 5350
Connection ~ 5150 5250
Wire Wire Line
	5150 5250 5400 5250
Wire Wire Line
	4900 4750 4400 4750
Connection ~ 4900 4750
$Comp
L power:VCC #PWR?
U 1 1 60E37B5E
P 5400 4650
F 0 "#PWR?" H 5400 4500 50  0001 C CNN
F 1 "VCC" H 5417 4823 50  0000 C CNN
F 2 "" H 5400 4650 50  0001 C CNN
F 3 "" H 5400 4650 50  0001 C CNN
	1    5400 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4750 5400 4650
Connection ~ 5400 4750
$Comp
L Device:CP C?
U 1 1 60E37B66
P 5400 5000
F 0 "C?" H 5518 5046 50  0000 L CNN
F 1 "470uF" H 5518 4955 50  0000 L CNN
F 2 "" H 5438 4850 50  0001 C CNN
F 3 "~" H 5400 5000 50  0001 C CNN
	1    5400 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4050 4650 4050
$Comp
L Device:C C?
U 1 1 60E4E927
P 3900 4200
F 0 "C?" H 4015 4246 50  0000 L CNN
F 1 "1uF" H 4015 4155 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3938 4050 50  0001 C CNN
F 3 "~" H 3900 4200 50  0001 C CNN
	1    3900 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E4EBF1
P 3400 4200
F 0 "C?" H 3515 4246 50  0000 L CNN
F 1 "2.2uF" H 3515 4155 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3438 4050 50  0001 C CNN
F 3 "~" H 3400 4200 50  0001 C CNN
	1    3400 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 60E56F71
P 3900 4450
F 0 "#PWR?" H 3900 4200 50  0001 C CNN
F 1 "GNDA" H 3905 4277 50  0000 C CNN
F 2 "" H 3900 4450 50  0001 C CNN
F 3 "" H 3900 4450 50  0001 C CNN
	1    3900 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4350 3900 4450
$Comp
L power:GNDA #PWR?
U 1 1 60E58FE7
P 3400 4450
F 0 "#PWR?" H 3400 4200 50  0001 C CNN
F 1 "GNDA" H 3405 4277 50  0000 C CNN
F 2 "" H 3400 4450 50  0001 C CNN
F 3 "" H 3400 4450 50  0001 C CNN
	1    3400 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4350 3400 4450
Wire Wire Line
	4650 3950 3900 3950
Wire Wire Line
	3900 3950 3900 4050
Wire Wire Line
	3400 3650 3400 4050
Wire Wire Line
	4650 3650 3400 3650
Wire Wire Line
	4650 3750 4550 3750
Wire Wire Line
	4550 3750 4550 3850
Wire Wire Line
	4650 3850 4550 3850
Connection ~ 4550 3850
$Comp
L Device:C C?
U 1 1 60E76A1B
P 3050 3050
F 0 "C?" V 3302 3050 50  0000 C CNN
F 1 "2.2uF" V 3211 3050 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3088 2900 50  0001 C CNN
F 3 "~" H 3050 3050 50  0001 C CNN
	1    3050 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 60E79504
P 3050 3950
F 0 "C?" V 3302 3950 50  0000 C CNN
F 1 "2.2uF" V 3211 3950 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3088 3800 50  0001 C CNN
F 3 "~" H 3050 3950 50  0001 C CNN
	1    3050 3950
	0    -1   -1   0   
$EndComp
Text HLabel 2800 3050 0    50   Input ~ 0
LIN
Text HLabel 2800 3950 0    50   Input ~ 0
RIN
Text HLabel 8550 2950 2    50   Output ~ 0
LOUT
Text HLabel 8550 4250 2    50   Output ~ 0
ROUT
Wire Wire Line
	8450 2950 8550 2950
Wire Wire Line
	8450 4250 8550 4250
$Comp
L Switch:SW_DIP_x02 SW?
U 1 1 60E21294
P 7900 5250
F 0 "SW?" H 7900 5617 50  0000 C CNN
F 1 "SW_DIP_x02" H 7900 5526 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx02_Slide_9.78x7.26mm_W7.62mm_P2.54mm" H 7900 5250 50  0001 C CNN
F 3 "" H 7900 5250 50  0001 C CNN
	1    7900 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 60E2143D
P 8300 5350
F 0 "#PWR?" H 8300 5100 50  0001 C CNN
F 1 "GNDA" H 8305 5177 50  0000 C CNN
F 2 "" H 8300 5350 50  0001 C CNN
F 3 "" H 8300 5350 50  0001 C CNN
	1    8300 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 5250 8300 5250
Wire Wire Line
	8300 5250 8300 5350
Wire Wire Line
	8200 5150 8300 5150
Wire Wire Line
	8300 5150 8300 5250
Connection ~ 8300 5250
$Comp
L Device:R R?
U 1 1 60E3F5FC
P 6600 4900
F 0 "R?" H 6670 4946 50  0000 L CNN
F 1 "10K" H 6670 4855 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6530 4900 50  0001 C CNN
F 3 "~" H 6600 4900 50  0001 C CNN
	1    6600 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60E56A6D
P 7100 4900
F 0 "R?" H 7170 4946 50  0000 L CNN
F 1 "10K" H 7170 4855 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7030 4900 50  0001 C CNN
F 3 "~" H 7100 4900 50  0001 C CNN
	1    7100 4900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 60E7D456
P 6600 4650
F 0 "#PWR?" H 6600 4500 50  0001 C CNN
F 1 "VCC" H 6617 4823 50  0000 C CNN
F 2 "" H 6600 4650 50  0001 C CNN
F 3 "" H 6600 4650 50  0001 C CNN
	1    6600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4750 6600 4650
$Comp
L power:VCC #PWR?
U 1 1 60E84FC2
P 7100 4650
F 0 "#PWR?" H 7100 4500 50  0001 C CNN
F 1 "VCC" H 7117 4823 50  0000 C CNN
F 2 "" H 7100 4650 50  0001 C CNN
F 3 "" H 7100 4650 50  0001 C CNN
	1    7100 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 4750 7100 4650
Wire Wire Line
	7600 5150 6600 5150
Wire Wire Line
	6600 5150 6600 5050
Wire Wire Line
	7600 5250 7100 5250
Wire Wire Line
	7100 5250 7100 5050
Wire Notes Line
	7500 4750 8500 4750
Wire Notes Line
	8500 4750 8500 5650
Wire Notes Line
	8500 5650 7500 5650
Wire Notes Line
	7500 5650 7500 4750
Text Notes 7500 4700 0    50   ~ 0
Gain Settings (Optional)
Wire Wire Line
	5650 3650 5850 3650
Wire Wire Line
	5650 3750 5850 3750
Wire Wire Line
	6600 5150 6100 5150
Connection ~ 6600 5150
Wire Wire Line
	7100 5250 6100 5250
Connection ~ 7100 5250
Text GLabel 6100 5150 0    50   Output ~ 0
GAIN0
Text GLabel 5850 3650 2    50   Input ~ 0
GAIN0
Text GLabel 6100 5250 0    50   Output ~ 0
GAIN1
Text GLabel 5850 3750 2    50   Input ~ 0
GAIN1
Wire Wire Line
	2800 3050 2900 3050
Wire Wire Line
	3200 3050 3300 3050
Wire Wire Line
	3300 3050 3300 3450
Wire Wire Line
	3300 3450 4650 3450
Wire Wire Line
	2800 3950 2900 3950
Wire Wire Line
	3200 3950 3300 3950
Wire Wire Line
	3300 3950 3300 3550
Wire Wire Line
	3300 3550 4650 3550
Connection ~ 5750 4050
Wire Wire Line
	5750 4250 5150 4250
Wire Wire Line
	5150 4250 5150 4350
Wire Wire Line
	5750 4050 5750 4250
Wire Wire Line
	4550 4250 5150 4250
Wire Wire Line
	4550 3850 4550 4250
Connection ~ 5150 4250
Wire Wire Line
	4400 4750 4400 4050
$Comp
L Device:C C?
U 1 1 613EF0A5
P 6850 2200
F 0 "C?" H 6965 2246 50  0000 L CNN
F 1 "10uF" H 6965 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 6888 2050 50  0001 C CNN
F 3 "~" H 6850 2200 50  0001 C CNN
	1    6850 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3350 4550 3350
Wire Wire Line
	4550 3350 4550 3750
Connection ~ 4550 3750
Wire Wire Line
	4650 3250 4550 3250
Wire Wire Line
	4550 3250 4550 3150
Connection ~ 4550 3150
Wire Wire Line
	4550 3150 4400 3150
$EndSCHEMATC
