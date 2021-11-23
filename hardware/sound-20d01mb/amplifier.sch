EESchema Schematic File Version 4
LIBS:sound-20d01mb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
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
L Device:L L1
U 1 1 60DF8A1B
P 6850 2950
F 0 "L1" V 7040 2950 50  0000 C CNN
F 1 "22uH" V 6949 2950 50  0000 C CNN
F 2 "Inductor_SMD:L_Bourns_SRR1260" H 6850 2950 50  0001 C CNN
F 3 "~" H 6850 2950 50  0001 C CNN
	1    6850 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C35
U 1 1 60DF8A9B
P 6350 3350
F 0 "C35" V 6602 3350 50  0000 C CNN
F 1 "0.22uF" V 6511 3350 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6388 3200 50  0001 C CNN
F 3 "~" H 6350 3350 50  0001 C CNN
	1    6350 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R15
U 1 1 60DF8C16
P 7100 3200
F 0 "R15" H 7170 3246 50  0000 L CNN
F 1 "4.7K" H 7170 3155 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7030 3200 50  0001 C CNN
F 3 "~" H 7100 3200 50  0001 C CNN
	1    7100 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C34
U 1 1 60DF8C7B
P 7600 3200
F 0 "C34" H 7715 3246 50  0000 L CNN
F 1 "0.68uF" H 7715 3155 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W4.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 7638 3050 50  0001 C CNN
F 3 "~" H 7600 3200 50  0001 C CNN
	1    7600 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C32
U 1 1 60DF8CEC
P 8250 2950
F 0 "C32" V 8505 2950 50  0000 C CNN
F 1 "4700uF" V 8414 2950 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 8288 2800 50  0001 C CNN
F 3 "~" H 8250 2950 50  0001 C CNN
	1    8250 2950
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDA #PWR077
U 1 1 60DF8FE5
P 6850 3700
F 0 "#PWR077" H 6850 3450 50  0001 C CNN
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
L Device:L L2
U 1 1 60E046DB
P 6850 4250
F 0 "L2" V 7040 4250 50  0000 C CNN
F 1 "22uH" V 6949 4250 50  0000 C CNN
F 2 "Inductor_SMD:L_Bourns_SRR1260" H 6850 4250 50  0001 C CNN
F 3 "~" H 6850 4250 50  0001 C CNN
	1    6850 4250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C36
U 1 1 60E046E1
P 6350 3850
F 0 "C36" V 6602 3850 50  0000 C CNN
F 1 "0.22uF" V 6511 3850 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6388 3700 50  0001 C CNN
F 3 "~" H 6350 3850 50  0001 C CNN
	1    6350 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R16
U 1 1 60E046E7
P 7100 4000
F 0 "R16" H 7170 4046 50  0000 L CNN
F 1 "4.7K" H 7170 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7030 4000 50  0001 C CNN
F 3 "~" H 7100 4000 50  0001 C CNN
	1    7100 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C38
U 1 1 60E046ED
P 7600 4000
F 0 "C38" H 7715 4046 50  0000 L CNN
F 1 "0.68uF" H 7715 3955 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W4.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 7638 3850 50  0001 C CNN
F 3 "~" H 7600 4000 50  0001 C CNN
	1    7600 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C39
U 1 1 60E046F3
P 8250 4250
F 0 "C39" V 8505 4250 50  0000 C CNN
F 1 "4700uF" V 8414 4250 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 8288 4100 50  0001 C CNN
F 3 "~" H 8250 4250 50  0001 C CNN
	1    8250 4250
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
L power:GNDA #PWR080
U 1 1 60E18B79
P 5150 4550
F 0 "#PWR080" H 5150 4300 50  0001 C CNN
F 1 "GNDA" H 5155 4377 50  0000 C CNN
F 2 "" H 5150 4550 50  0001 C CNN
F 3 "" H 5150 4550 50  0001 C CNN
	1    5150 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4050 5750 4050
Wire Wire Line
	5650 3150 5750 3150
Wire Wire Line
	5750 3150 5750 4050
$Comp
L Device:C C30
U 1 1 60E1A10C
P 6350 2100
F 0 "C30" H 6465 2146 50  0000 L CNN
F 1 "0.1uF" H 6465 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6388 1950 50  0001 C CNN
F 3 "~" H 6350 2100 50  0001 C CNN
	1    6350 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1950 6850 1850
Wire Wire Line
	6850 1850 6350 1850
Wire Wire Line
	6350 1850 6350 1950
Wire Wire Line
	6350 2250 6350 2350
Wire Wire Line
	6350 2350 6600 2350
Wire Wire Line
	6850 2350 6850 2250
$Comp
L power:GNDA #PWR076
U 1 1 60E1C910
P 6600 2450
F 0 "#PWR076" H 6600 2200 50  0001 C CNN
F 1 "GNDA" H 6605 2277 50  0000 C CNN
F 2 "" H 6600 2450 50  0001 C CNN
F 3 "" H 6600 2450 50  0001 C CNN
	1    6600 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2350 6600 2450
Connection ~ 6600 2350
Wire Wire Line
	6600 2350 6850 2350
Wire Wire Line
	5650 3450 5850 3450
Wire Wire Line
	5850 3450 5850 1850
Wire Wire Line
	6350 1850 5850 1850
Connection ~ 6350 1850
Wire Wire Line
	5650 3550 5850 3550
Wire Wire Line
	5850 3550 5850 3450
$Comp
L power:VCC #PWR074
U 1 1 60E226AA
P 6850 1750
F 0 "#PWR074" H 6850 1600 50  0001 C CNN
F 1 "VCC" H 6867 1923 50  0000 C CNN
F 2 "" H 6850 1750 50  0001 C CNN
F 3 "" H 6850 1750 50  0001 C CNN
	1    6850 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 1850 6850 1750
Connection ~ 6850 1850
Wire Wire Line
	5650 3250 6100 3250
Wire Wire Line
	5650 3950 6100 3950
Wire Wire Line
	5650 3350 6200 3350
Wire Wire Line
	5650 3850 6200 3850
$Comp
L Device:C C28
U 1 1 60E33670
P 4900 2100
F 0 "C28" H 5015 2146 50  0000 L CNN
F 1 "0.1uF" H 5015 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4938 1950 50  0001 C CNN
F 3 "~" H 4900 2100 50  0001 C CNN
	1    4900 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1950 5400 1850
Wire Wire Line
	5400 1850 4900 1850
Wire Wire Line
	4900 1850 4900 1950
Wire Wire Line
	4900 2250 4900 2350
Wire Wire Line
	4900 2350 5150 2350
Wire Wire Line
	5400 2350 5400 2250
$Comp
L power:GNDA #PWR075
U 1 1 60E3367C
P 5150 2450
F 0 "#PWR075" H 5150 2200 50  0001 C CNN
F 1 "GNDA" H 5155 2277 50  0000 C CNN
F 2 "" H 5150 2450 50  0001 C CNN
F 3 "" H 5150 2450 50  0001 C CNN
	1    5150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 2350 5150 2450
Connection ~ 5150 2350
Wire Wire Line
	5150 2350 5400 2350
Wire Wire Line
	4900 1850 4400 1850
Connection ~ 4900 1850
$Comp
L power:VCC #PWR073
U 1 1 60E33687
P 5400 1750
F 0 "#PWR073" H 5400 1600 50  0001 C CNN
F 1 "VCC" H 5417 1923 50  0000 C CNN
F 2 "" H 5400 1750 50  0001 C CNN
F 3 "" H 5400 1750 50  0001 C CNN
	1    5400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 1850 5400 1750
Connection ~ 5400 1850
$Comp
L Device:CP C29
U 1 1 60E34B94
P 5400 2100
F 0 "C29" H 5518 2146 50  0000 L CNN
F 1 "470uF" H 5518 2055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D12.5mm_P5.00mm" H 5438 1950 50  0001 C CNN
F 3 "~" H 5400 2100 50  0001 C CNN
	1    5400 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3050 4400 1850
$Comp
L Device:C C42
U 1 1 60E37B47
P 4900 5400
F 0 "C42" H 5015 5446 50  0000 L CNN
F 1 "0.1uF" H 5015 5355 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4938 5250 50  0001 C CNN
F 3 "~" H 4900 5400 50  0001 C CNN
	1    4900 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5250 5400 5150
Wire Wire Line
	5400 5150 4900 5150
Wire Wire Line
	4900 5150 4900 5250
Wire Wire Line
	4900 5550 4900 5650
Wire Wire Line
	4900 5650 5150 5650
Wire Wire Line
	5400 5650 5400 5550
$Comp
L power:GNDA #PWR084
U 1 1 60E37B53
P 5150 5750
F 0 "#PWR084" H 5150 5500 50  0001 C CNN
F 1 "GNDA" H 5155 5577 50  0000 C CNN
F 2 "" H 5150 5750 50  0001 C CNN
F 3 "" H 5150 5750 50  0001 C CNN
	1    5150 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5650 5150 5750
Connection ~ 5150 5650
Wire Wire Line
	5150 5650 5400 5650
Wire Wire Line
	4900 5150 4400 5150
Connection ~ 4900 5150
$Comp
L power:VCC #PWR081
U 1 1 60E37B5E
P 5400 5050
F 0 "#PWR081" H 5400 4900 50  0001 C CNN
F 1 "VCC" H 5417 5223 50  0000 C CNN
F 2 "" H 5400 5050 50  0001 C CNN
F 3 "" H 5400 5050 50  0001 C CNN
	1    5400 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5150 5400 5050
Connection ~ 5400 5150
$Comp
L Device:CP C43
U 1 1 60E37B66
P 5400 5400
F 0 "C43" H 5518 5446 50  0000 L CNN
F 1 "470uF" H 5518 5355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D12.5mm_P5.00mm" H 5438 5250 50  0001 C CNN
F 3 "~" H 5400 5400 50  0001 C CNN
	1    5400 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C41
U 1 1 60E4E927
P 3900 4300
F 0 "C41" H 4015 4346 50  0000 L CNN
F 1 "1uF" H 4015 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3938 4150 50  0001 C CNN
F 3 "~" H 3900 4300 50  0001 C CNN
	1    3900 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C40
U 1 1 60E4EBF1
P 3400 4300
F 0 "C40" H 3515 4346 50  0000 L CNN
F 1 "2.2uF" H 3515 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3438 4150 50  0001 C CNN
F 3 "~" H 3400 4300 50  0001 C CNN
	1    3400 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4450 3900 4550
$Comp
L power:GNDA #PWR078
U 1 1 60E58FE7
P 3400 4550
F 0 "#PWR078" H 3400 4300 50  0001 C CNN
F 1 "GNDA" H 3405 4377 50  0000 C CNN
F 2 "" H 3400 4550 50  0001 C CNN
F 3 "" H 3400 4550 50  0001 C CNN
	1    3400 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4450 3400 4550
Wire Wire Line
	3900 4050 3900 4150
Wire Wire Line
	3400 3650 3400 4150
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
L Device:C C33
U 1 1 60E76A1B
P 3050 3050
F 0 "C33" V 3302 3050 50  0000 C CNN
F 1 "2.2uF" V 3211 3050 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3088 2900 50  0001 C CNN
F 3 "~" H 3050 3050 50  0001 C CNN
	1    3050 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C37
U 1 1 60E79504
P 3050 3950
F 0 "C37" V 3302 3950 50  0000 C CNN
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
Text HLabel 8500 2950 2    50   Output ~ 0
LOUT
Text HLabel 8500 4250 2    50   Output ~ 0
ROUT
Wire Wire Line
	8400 2950 8500 2950
Wire Wire Line
	8400 4250 8500 4250
$Comp
L Switch:SW_DIP_x02 SW1
U 1 1 60E21294
P 7900 5650
F 0 "SW1" H 7900 6017 50  0000 C CNN
F 1 "SW_DIP_x02" H 7900 5926 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx02_Slide_9.78x7.26mm_W7.62mm_P2.54mm" H 7900 5650 50  0001 C CNN
F 3 "" H 7900 5650 50  0001 C CNN
	1    7900 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR085
U 1 1 60E2143D
P 8300 5750
F 0 "#PWR085" H 8300 5500 50  0001 C CNN
F 1 "GNDA" H 8305 5577 50  0000 C CNN
F 2 "" H 8300 5750 50  0001 C CNN
F 3 "" H 8300 5750 50  0001 C CNN
	1    8300 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 5650 8300 5650
Wire Wire Line
	8300 5650 8300 5750
Wire Wire Line
	8200 5550 8300 5550
Wire Wire Line
	8300 5550 8300 5650
Connection ~ 8300 5650
$Comp
L Device:R R17
U 1 1 60E3F5FC
P 6600 5300
F 0 "R17" H 6670 5346 50  0000 L CNN
F 1 "10K" H 6670 5255 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6530 5300 50  0001 C CNN
F 3 "~" H 6600 5300 50  0001 C CNN
	1    6600 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 60E56A6D
P 7100 5300
F 0 "R18" H 7170 5346 50  0000 L CNN
F 1 "10K" H 7170 5255 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7030 5300 50  0001 C CNN
F 3 "~" H 7100 5300 50  0001 C CNN
	1    7100 5300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR082
U 1 1 60E7D456
P 6600 5050
F 0 "#PWR082" H 6600 4900 50  0001 C CNN
F 1 "VCC" H 6617 5223 50  0000 C CNN
F 2 "" H 6600 5050 50  0001 C CNN
F 3 "" H 6600 5050 50  0001 C CNN
	1    6600 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5150 6600 5050
$Comp
L power:VCC #PWR083
U 1 1 60E84FC2
P 7100 5050
F 0 "#PWR083" H 7100 4900 50  0001 C CNN
F 1 "VCC" H 7117 5223 50  0000 C CNN
F 2 "" H 7100 5050 50  0001 C CNN
F 3 "" H 7100 5050 50  0001 C CNN
	1    7100 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 5150 7100 5050
Wire Wire Line
	7600 5550 6600 5550
Wire Wire Line
	6600 5550 6600 5450
Wire Wire Line
	7600 5650 7100 5650
Wire Wire Line
	7100 5650 7100 5450
Wire Notes Line
	7500 5150 8500 5150
Wire Notes Line
	8500 5150 8500 6050
Wire Notes Line
	8500 6050 7500 6050
Wire Notes Line
	7500 6050 7500 5150
Text Notes 7500 5100 0    50   ~ 0
Gain Settings (Optional)
Wire Wire Line
	5650 3650 5850 3650
Wire Wire Line
	5650 3750 5850 3750
Wire Wire Line
	6600 5550 6100 5550
Connection ~ 6600 5550
Wire Wire Line
	7100 5650 6100 5650
Connection ~ 7100 5650
Text GLabel 6100 5550 0    50   Output ~ 0
GAIN0
Text GLabel 5850 3650 2    50   Input ~ 0
GAIN0
Text GLabel 6100 5650 0    50   Output ~ 0
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
	5150 4450 5150 4550
Wire Wire Line
	5750 4050 5750 4150
$Comp
L Device:C C31
U 1 1 613EF0A5
P 6850 2100
F 0 "C31" H 6965 2146 50  0000 L CNN
F 1 "10uF" H 6965 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 6888 1950 50  0001 C CNN
F 3 "~" H 6850 2100 50  0001 C CNN
	1    6850 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3350 4550 3350
Connection ~ 5850 3450
Wire Wire Line
	5650 3050 5750 3050
Wire Wire Line
	5750 3050 5750 3150
Connection ~ 5750 3150
Wire Wire Line
	5650 4150 5750 4150
Connection ~ 5750 4150
Wire Wire Line
	4650 3050 4400 3050
Connection ~ 4400 3050
Wire Wire Line
	4400 3250 4650 3250
Wire Wire Line
	4650 4150 4400 4150
Wire Wire Line
	4550 4450 5150 4450
Wire Wire Line
	4550 3850 4550 4450
Wire Wire Line
	5750 4450 5150 4450
Wire Wire Line
	5750 4150 5750 4450
Connection ~ 5150 4450
Connection ~ 4400 4150
Wire Wire Line
	4400 5150 4400 4150
$Comp
L power:GNDA #PWR079
U 1 1 60E56F71
P 3900 4550
F 0 "#PWR079" H 3900 4300 50  0001 C CNN
F 1 "GNDA" H 3905 4377 50  0000 C CNN
F 2 "" H 3900 4550 50  0001 C CNN
F 3 "" H 3900 4550 50  0001 C CNN
	1    3900 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 2950 8100 2950
Connection ~ 7600 2950
Wire Wire Line
	7600 4250 8100 4250
Connection ~ 7600 4250
Wire Wire Line
	4650 3950 4400 3950
Wire Wire Line
	4400 3950 4400 4150
Wire Wire Line
	4650 4050 3900 4050
Wire Wire Line
	5150 4350 5150 4450
$Comp
L sound-20d01_Library:TPA3123D2 U4
U 1 1 61611A87
P 5150 3600
F 0 "U4" H 5150 4400 50  0000 C CNN
F 1 "TPA3123D2" H 5150 4300 50  0000 C CNN
F 2 "Package_SO:HTSSOP-24-1EP_4.4x7.8mm_P0.65mm_EP3.4x7.8mm_Mask2.4x4.68mm_ThermalVias" H 5150 2500 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/tpa3123d2.pdf" H 5150 2400 50  0001 C CNN
	1    5150 3600
	1    0    0    -1  
$EndComp
Text HLabel 1300 6300 0    50   Input ~ 0
~SHUTDOWN
Text HLabel 4200 6300 0    50   Input ~ 0
MUTE
$Comp
L Isolator:PC817 U6
U 1 1 619A1AC9
P 5000 6400
F 0 "U6" H 5000 6725 50  0000 C CNN
F 1 "PC817" H 5000 6634 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 4800 6200 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 5000 6400 50  0001 L CNN
	1    5000 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 619A1DC1
P 4450 6300
F 0 "R20" V 4657 6300 50  0000 C CNN
F 1 "1K" V 4566 6300 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4380 6300 50  0001 C CNN
F 3 "~" H 4450 6300 50  0001 C CNN
	1    4450 6300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 6300 4700 6300
Wire Wire Line
	4200 6300 4300 6300
$Comp
L power:GNDD #PWR089
U 1 1 619BAA1F
P 4600 6600
F 0 "#PWR089" H 4600 6350 50  0001 C CNN
F 1 "GNDD" H 4604 6445 50  0000 C CNN
F 2 "" H 4600 6600 50  0001 C CNN
F 3 "" H 4600 6600 50  0001 C CNN
	1    4600 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 6500 4600 6500
Wire Wire Line
	4600 6500 4600 6600
$Comp
L Device:LED D?
U 1 1 619C5780
P 5400 7150
AR Path="/61033008/619C5780" Ref="D?"  Part="1" 
AR Path="/60DE2DF4/619C5780" Ref="D2"  Part="1" 
F 0 "D2" V 5438 7033 50  0000 R CNN
F 1 "MUTE_LED" V 5347 7033 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5400 7150 50  0001 C CNN
F 3 "~" H 5400 7150 50  0001 C CNN
	1    5400 7150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5400 7000 5400 6900
Wire Wire Line
	5400 6600 5400 6500
$Comp
L Device:R R?
U 1 1 619C5789
P 5400 6750
AR Path="/61033008/619C5789" Ref="R?"  Part="1" 
AR Path="/60DE2DF4/619C5789" Ref="R23"  Part="1" 
F 0 "R23" H 5470 6796 50  0000 L CNN
F 1 "1K" H 5470 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 5330 6750 50  0001 C CNN
F 3 "~" H 5400 6750 50  0001 C CNN
	1    5400 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 7300 5400 7400
Text Notes 5300 7200 2    50   ~ 0
Orange LED
Wire Wire Line
	5300 6500 5400 6500
$Comp
L power:+5VA #PWR087
U 1 1 619E4AC7
P 5400 6200
F 0 "#PWR087" H 5400 6050 50  0001 C CNN
F 1 "+5VA" H 5415 6373 50  0000 C CNN
F 2 "" H 5400 6200 50  0001 C CNN
F 3 "" H 5400 6200 50  0001 C CNN
	1    5400 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 6300 5400 6300
Wire Wire Line
	5400 6300 5400 6200
$Comp
L power:GNDA #PWR093
U 1 1 619EA895
P 5400 7400
F 0 "#PWR093" H 5400 7150 50  0001 C CNN
F 1 "GNDA" H 5405 7227 50  0000 C CNN
F 2 "" H 5400 7400 50  0001 C CNN
F 3 "" H 5400 7400 50  0001 C CNN
	1    5400 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 619F18D7
P 6100 6750
F 0 "R24" H 6170 6796 50  0000 L CNN
F 1 "10K" H 6170 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 6030 6750 50  0001 C CNN
F 3 "~" H 6100 6750 50  0001 C CNN
	1    6100 6750
	1    0    0    -1  
$EndComp
Connection ~ 5400 6500
Wire Wire Line
	6100 6500 6100 6600
$Comp
L power:GNDA #PWR091
U 1 1 619FDBCC
P 6100 7000
F 0 "#PWR091" H 6100 6750 50  0001 C CNN
F 1 "GNDA" H 6105 6827 50  0000 C CNN
F 2 "" H 6100 7000 50  0001 C CNN
F 3 "" H 6100 7000 50  0001 C CNN
	1    6100 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 6900 6100 7000
Wire Wire Line
	5400 6500 6100 6500
Text GLabel 4550 3350 0    50   Input ~ 0
AMP_MUTE
Text GLabel 6200 6500 2    50   Output ~ 0
AMP_MUTE
Wire Wire Line
	6100 6500 6200 6500
Connection ~ 6100 6500
$Comp
L Isolator:PC817 U5
U 1 1 61A58182
P 2100 6400
F 0 "U5" H 2100 6725 50  0000 C CNN
F 1 "PC817" H 2100 6634 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 1900 6200 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 2100 6400 50  0001 L CNN
	1    2100 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 61A58188
P 1550 6300
F 0 "R19" V 1757 6300 50  0000 C CNN
F 1 "1K" V 1666 6300 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 1480 6300 50  0001 C CNN
F 3 "~" H 1550 6300 50  0001 C CNN
	1    1550 6300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1700 6300 1800 6300
Wire Wire Line
	1300 6300 1400 6300
$Comp
L power:GNDD #PWR088
U 1 1 61A58190
P 1700 6600
F 0 "#PWR088" H 1700 6350 50  0001 C CNN
F 1 "GNDD" H 1704 6445 50  0000 C CNN
F 2 "" H 1700 6600 50  0001 C CNN
F 3 "" H 1700 6600 50  0001 C CNN
	1    1700 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 6500 1700 6500
Wire Wire Line
	1700 6500 1700 6600
$Comp
L Device:LED D?
U 1 1 61A58198
P 2500 7150
AR Path="/61033008/61A58198" Ref="D?"  Part="1" 
AR Path="/60DE2DF4/61A58198" Ref="D1"  Part="1" 
F 0 "D1" V 2538 7033 50  0000 R CNN
F 1 "AMP_LED" V 2447 7033 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2500 7150 50  0001 C CNN
F 3 "~" H 2500 7150 50  0001 C CNN
	1    2500 7150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2500 7000 2500 6900
Wire Wire Line
	2500 6600 2500 6500
$Comp
L Device:R R?
U 1 1 61A581A0
P 2500 6750
AR Path="/61033008/61A581A0" Ref="R?"  Part="1" 
AR Path="/60DE2DF4/61A581A0" Ref="R21"  Part="1" 
F 0 "R21" H 2570 6796 50  0000 L CNN
F 1 "1K" H 2570 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 2430 6750 50  0001 C CNN
F 3 "~" H 2500 6750 50  0001 C CNN
	1    2500 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 7300 2500 7400
Text Notes 2400 7200 2    50   ~ 0
Green LED
Wire Wire Line
	2400 6500 2500 6500
$Comp
L power:+5VA #PWR086
U 1 1 61A581A9
P 2500 6200
F 0 "#PWR086" H 2500 6050 50  0001 C CNN
F 1 "+5VA" H 2515 6373 50  0000 C CNN
F 2 "" H 2500 6200 50  0001 C CNN
F 3 "" H 2500 6200 50  0001 C CNN
	1    2500 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6300 2500 6300
Wire Wire Line
	2500 6300 2500 6200
$Comp
L power:GNDA #PWR092
U 1 1 61A581B1
P 2500 7400
F 0 "#PWR092" H 2500 7150 50  0001 C CNN
F 1 "GNDA" H 2505 7227 50  0000 C CNN
F 2 "" H 2500 7400 50  0001 C CNN
F 3 "" H 2500 7400 50  0001 C CNN
	1    2500 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R22
U 1 1 61A581B7
P 3200 6750
F 0 "R22" H 3270 6796 50  0000 L CNN
F 1 "10K" H 3270 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 3130 6750 50  0001 C CNN
F 3 "~" H 3200 6750 50  0001 C CNN
	1    3200 6750
	1    0    0    -1  
$EndComp
Connection ~ 2500 6500
Wire Wire Line
	3200 6500 3200 6600
$Comp
L power:GNDA #PWR090
U 1 1 61A581BF
P 3200 7000
F 0 "#PWR090" H 3200 6750 50  0001 C CNN
F 1 "GNDA" H 3205 6827 50  0000 C CNN
F 2 "" H 3200 7000 50  0001 C CNN
F 3 "" H 3200 7000 50  0001 C CNN
	1    3200 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 6900 3200 7000
Wire Wire Line
	2500 6500 3200 6500
Text GLabel 3300 6500 2    50   Output ~ 0
~AMP_SD
Wire Wire Line
	3200 6500 3300 6500
Connection ~ 3200 6500
Text GLabel 4300 3150 0    50   Input ~ 0
~AMP_SD
Wire Wire Line
	4400 3050 4400 3250
Wire Wire Line
	4650 3150 4300 3150
$EndSCHEMATC
