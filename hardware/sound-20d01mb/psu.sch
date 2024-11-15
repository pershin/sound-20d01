EESchema Schematic File Version 4
LIBS:sound-20d01mb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
L Regulator_Linear:AZ1117-3.3 U8
U 1 1 60DF628F
P 5650 4450
F 0 "U8" H 5650 4692 50  0000 C CNN
F 1 "ADP3338AKCZ-3.3RL7" H 5650 4601 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 5650 4700 50  0001 C CIN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/adp3338.pdf" H 5650 4450 50  0001 C CNN
	1    5650 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E015B2
P 6350 4700
AR Path="/60DE2DF4/60E015B2" Ref="C?"  Part="1" 
AR Path="/60DE2DF1/60E015B2" Ref="C?"  Part="1" 
AR Path="/61033008/60E015B2" Ref="C51"  Part="1" 
F 0 "C51" H 6465 4746 50  0000 L CNN
F 1 "2.2uF" H 6465 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6388 4550 50  0001 C CNN
F 3 "~" H 6350 4700 50  0001 C CNN
	1    6350 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E01602
P 4950 4700
AR Path="/60DE2DF4/60E01602" Ref="C?"  Part="1" 
AR Path="/60DE2DF1/60E01602" Ref="C?"  Part="1" 
AR Path="/61033008/60E01602" Ref="C50"  Part="1" 
F 0 "C50" H 5065 4746 50  0000 L CNN
F 1 "2.2uF" H 5065 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4988 4550 50  0001 C CNN
F 3 "~" H 4950 4700 50  0001 C CNN
	1    4950 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0107
U 1 1 60E01644
P 5650 5050
F 0 "#PWR0107" H 5650 4800 50  0001 C CNN
F 1 "GNDA" H 5655 4877 50  0000 C CNN
F 2 "" H 5650 5050 50  0001 C CNN
F 3 "" H 5650 5050 50  0001 C CNN
	1    5650 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4750 5650 4950
$Comp
L power:+3.3VA #PWR0104
U 1 1 60E017A8
P 6350 4350
F 0 "#PWR0104" H 6350 4200 50  0001 C CNN
F 1 "+3.3VA" H 6365 4523 50  0000 C CNN
F 2 "" H 6350 4350 50  0001 C CNN
F 3 "" H 6350 4350 50  0001 C CNN
	1    6350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4850 6350 4950
Wire Wire Line
	5650 4950 5650 5050
Connection ~ 5650 4950
Wire Wire Line
	4950 4950 4950 4850
Wire Wire Line
	4950 4450 4950 4550
Text Notes 6250 4050 0    50   ~ 0
Analog power supply (DAC)
$Comp
L Regulator_Linear:AZ1117-3.3 U7
U 1 1 60E0E9BB
P 5650 2800
F 0 "U7" H 5650 3042 50  0000 C CNN
F 1 "ADP3338AKCZ-3.3RL7" H 5650 2951 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 5650 3050 50  0001 C CIN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/adp3338.pdf" H 5650 2800 50  0001 C CNN
	1    5650 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E0E9C1
P 6350 3050
AR Path="/60DE2DF4/60E0E9C1" Ref="C?"  Part="1" 
AR Path="/60DE2DF1/60E0E9C1" Ref="C?"  Part="1" 
AR Path="/61033008/60E0E9C1" Ref="C47"  Part="1" 
F 0 "C47" H 6465 3096 50  0000 L CNN
F 1 "2.2uF" H 6465 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 6388 2900 50  0001 C CNN
F 3 "~" H 6350 3050 50  0001 C CNN
	1    6350 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E0E9C7
P 4950 3050
AR Path="/60DE2DF4/60E0E9C7" Ref="C?"  Part="1" 
AR Path="/60DE2DF1/60E0E9C7" Ref="C?"  Part="1" 
AR Path="/61033008/60E0E9C7" Ref="C46"  Part="1" 
F 0 "C46" H 5065 3096 50  0000 L CNN
F 1 "2.2uF" H 5065 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4988 2900 50  0001 C CNN
F 3 "~" H 4950 3050 50  0001 C CNN
	1    4950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3100 5650 3300
Wire Wire Line
	6850 2800 6850 2700
Wire Wire Line
	6350 2800 6350 2900
Wire Wire Line
	6350 3200 6350 3300
Wire Wire Line
	5650 3300 5650 3400
Connection ~ 5650 3300
Wire Wire Line
	4950 3300 4950 3200
Wire Wire Line
	4950 2800 4950 2900
$Comp
L power:+3.3V #PWR095
U 1 1 60E0F338
P 6850 2700
F 0 "#PWR095" H 6850 2550 50  0001 C CNN
F 1 "+3.3V" H 6865 2873 50  0000 C CNN
F 2 "" H 6850 2700 50  0001 C CNN
F 3 "" H 6850 2700 50  0001 C CNN
	1    6850 2700
	1    0    0    -1  
$EndComp
Text Notes 6750 2400 0    50   ~ 0
Digital power supply
$Comp
L power:GNDD #PWR0100
U 1 1 60E17887
P 5650 3400
F 0 "#PWR0100" H 5650 3150 50  0001 C CNN
F 1 "GNDD" H 5654 3245 50  0000 C CNN
F 2 "" H 5650 3400 50  0001 C CNN
F 3 "" H 5650 3400 50  0001 C CNN
	1    5650 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR094
U 1 1 60E9D889
P 3450 2700
F 0 "#PWR094" H 3450 2550 50  0001 C CNN
F 1 "+5V" H 3465 2873 50  0000 C CNN
F 2 "" H 3450 2700 50  0001 C CNN
F 3 "" H 3450 2700 50  0001 C CNN
	1    3450 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C44
U 1 1 60EB6668
P 3450 3050
F 0 "C44" H 3568 3096 50  0000 L CNN
F 1 "47uF" H 3568 3005 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x5.4" H 3488 2900 50  0001 C CNN
F 3 "~" H 3450 3050 50  0001 C CNN
	1    3450 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR099
U 1 1 60EB678E
P 3450 3300
F 0 "#PWR099" H 3450 3050 50  0001 C CNN
F 1 "GNDD" H 3454 3145 50  0000 C CNN
F 2 "" H 3450 3300 50  0001 C CNN
F 3 "" H 3450 3300 50  0001 C CNN
	1    3450 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3200 3450 3300
$Comp
L Device:CP C45
U 1 1 60EC8F14
P 4450 3050
F 0 "C45" H 4568 3096 50  0000 L CNN
F 1 "10uF" H 4568 3005 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 4488 2900 50  0001 C CNN
F 3 "~" H 4450 3050 50  0001 C CNN
	1    4450 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2900 4450 2800
Wire Wire Line
	4450 2800 4950 2800
Wire Wire Line
	4450 3200 4450 3300
Wire Wire Line
	4450 3300 4950 3300
Wire Wire Line
	6350 2800 6850 2800
$Comp
L Device:CP C48
U 1 1 60ECC361
P 6850 3050
F 0 "C48" H 6968 3096 50  0000 L CNN
F 1 "10uF" H 6968 3005 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 6888 2900 50  0001 C CNN
F 3 "~" H 6850 3050 50  0001 C CNN
	1    6850 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2900 6850 2800
Connection ~ 6850 2800
Wire Wire Line
	6850 3200 6850 3300
Wire Wire Line
	6850 3300 6350 3300
Text Notes 5200 2450 0    50   ~ 0
Place U7 as close\nto the MCU as possible.
$Comp
L Device:CP C49
U 1 1 613DBAC3
P 4450 4700
F 0 "C49" H 4568 4746 50  0000 L CNN
F 1 "10uF" H 4568 4655 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 4488 4550 50  0001 C CNN
F 3 "~" H 4450 4700 50  0001 C CNN
	1    4450 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4450 4450 4550
Wire Wire Line
	4450 4850 4450 4950
Wire Wire Line
	4450 4950 4950 4950
Text Notes 5200 4100 0    50   ~ 0
Place U8 as close\nto the DAC as possible.
$Comp
L Device:LED D4
U 1 1 61475539
P 7350 3450
F 0 "D4" V 7388 3333 50  0000 R CNN
F 1 "D_PWR_LED" V 7297 3333 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7350 3450 50  0001 C CNN
F 3 "~" H 7350 3450 50  0001 C CNN
	1    7350 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7350 3300 7350 3200
Wire Wire Line
	7350 2900 7350 2800
$Comp
L Device:R R25
U 1 1 61476045
P 7350 3050
F 0 "R25" H 7420 3096 50  0000 L CNN
F 1 "680R" H 7420 3005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 7280 3050 50  0001 C CNN
F 3 "~" H 7350 3050 50  0001 C CNN
	1    7350 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0103
U 1 1 614762B1
P 7350 3700
F 0 "#PWR0103" H 7350 3450 50  0001 C CNN
F 1 "GNDD" H 7354 3545 50  0000 C CNN
F 2 "" H 7350 3700 50  0001 C CNN
F 3 "" H 7350 3700 50  0001 C CNN
	1    7350 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3600 7350 3700
Wire Wire Line
	5950 2800 6350 2800
Connection ~ 6350 2800
Wire Wire Line
	5650 3300 6350 3300
Connection ~ 6350 3300
Wire Wire Line
	6350 4350 6350 4450
Wire Wire Line
	5950 4450 6350 4450
Connection ~ 6350 4450
Wire Wire Line
	6350 4450 6350 4550
Wire Wire Line
	6350 4950 5650 4950
Wire Wire Line
	4950 2800 5350 2800
Connection ~ 4950 2800
Wire Wire Line
	4950 3300 5650 3300
Connection ~ 4950 3300
Wire Wire Line
	4950 4450 5350 4450
Wire Wire Line
	5650 4950 4950 4950
Connection ~ 4950 4450
Connection ~ 4950 4950
$Comp
L Device:D_Schottky D3
U 1 1 615390F1
P 3050 2800
F 0 "D3" H 3050 2584 50  0000 C CNN
F 1 "CRS04" H 3050 2675 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 3050 2800 50  0001 C CNN
F 3 "~" H 3050 2800 50  0001 C CNN
	1    3050 2800
	-1   0    0    1   
$EndComp
Text Notes 7250 3500 2    50   ~ 0
Green LED
$Comp
L power:VBUS #PWR097
U 1 1 6156F801
P 2100 2800
F 0 "#PWR097" H 2100 2650 50  0001 C CNN
F 1 "VBUS" V 2115 2927 50  0000 L CNN
F 2 "" H 2100 2800 50  0001 C CNN
F 3 "" H 2100 2800 50  0001 C CNN
	1    2100 2800
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 6157C2E8
P 2500 2800
F 0 "F1" V 2697 2800 50  0000 C CNN
F 1 "MF-MSMF050-2" V 2606 2800 50  0000 C CNN
F 2 "Fuse:Fuse_1812_4532Metric_Pad1.30x3.40mm_HandSolder" V 2430 2800 50  0001 C CNN
F 3 "~" H 2500 2800 50  0001 C CNN
	1    2500 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 2800 3200 2800
Wire Wire Line
	3450 2700 3450 2800
Connection ~ 3450 2800
Wire Wire Line
	3450 2800 3450 2900
Wire Wire Line
	2900 2800 2650 2800
Wire Wire Line
	2350 2800 2100 2800
Wire Wire Line
	3450 2800 3950 2800
Connection ~ 4450 2800
Wire Wire Line
	3950 2800 3950 4450
Connection ~ 3950 2800
Wire Wire Line
	3950 2800 4450 2800
$Comp
L Device:Net-Tie_2 NT1
U 1 1 61596519
P 5650 5600
F 0 "NT1" H 5650 5778 50  0000 C CNN
F 1 "Net-Tie_2" H 5650 5687 50  0000 C CNN
F 2 "NetTie:NetTie-2_SMD_Pad2.0mm" H 5650 5600 50  0001 C CNN
F 3 "~" H 5650 5600 50  0001 C CNN
	1    5650 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5600 5450 5700
$Comp
L power:GNDD #PWR0110
U 1 1 61598760
P 5450 5700
F 0 "#PWR0110" H 5450 5450 50  0001 C CNN
F 1 "GNDD" H 5454 5545 50  0000 C CNN
F 2 "" H 5450 5700 50  0001 C CNN
F 3 "" H 5450 5700 50  0001 C CNN
	1    5450 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 5600 5450 5600
Wire Wire Line
	5750 5600 5850 5600
Wire Wire Line
	6850 2800 7350 2800
$Comp
L power:GNDA #PWR0111
U 1 1 6159AA1F
P 5850 5700
F 0 "#PWR0111" H 5850 5450 50  0001 C CNN
F 1 "GNDA" H 5855 5527 50  0000 C CNN
F 2 "" H 5850 5700 50  0001 C CNN
F 3 "" H 5850 5700 50  0001 C CNN
	1    5850 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 5600 5850 5700
Wire Wire Line
	4450 4450 4950 4450
Wire Wire Line
	3950 4450 4450 4450
Connection ~ 4450 4450
$Comp
L Regulator_Linear:L7805 U9
U 1 1 619AB518
P 8550 4450
F 0 "U9" H 8550 4692 50  0000 C CNN
F 1 "L7805ABD2T-TR" H 8550 4601 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-2" H 8575 4300 50  0001 L CIN
F 3 "https://www.st.com/resource/en/datasheet/l78.pdf" H 8550 4400 50  0001 C CNN
	1    8550 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C53
U 1 1 619AB62A
P 7850 4700
F 0 "C53" H 7965 4746 50  0000 L CNN
F 1 "0.33uF" H 7965 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 7888 4550 50  0001 C CNN
F 3 "~" H 7850 4700 50  0001 C CNN
	1    7850 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C54
U 1 1 619AB6DE
P 9250 4700
F 0 "C54" H 9365 4746 50  0000 L CNN
F 1 "0.1uF" H 9365 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9288 4550 50  0001 C CNN
F 3 "~" H 9250 4700 50  0001 C CNN
	1    9250 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C55
U 1 1 619AB778
P 9750 4700
F 0 "C55" H 9868 4746 50  0000 L CNN
F 1 "10uF" H 9868 4655 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 9788 4550 50  0001 C CNN
F 3 "~" H 9750 4700 50  0001 C CNN
	1    9750 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C52
U 1 1 619AB88D
P 7350 4700
F 0 "C52" H 7468 4746 50  0000 L CNN
F 1 "47uF" H 7468 4655 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x7.7" H 7388 4550 50  0001 C CNN
F 3 "~" H 7350 4700 50  0001 C CNN
	1    7350 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR0108
U 1 1 619AB987
P 8550 5050
F 0 "#PWR0108" H 8550 4800 50  0001 C CNN
F 1 "GNDA" H 8555 4877 50  0000 C CNN
F 2 "" H 8550 5050 50  0001 C CNN
F 3 "" H 8550 5050 50  0001 C CNN
	1    8550 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4450 9250 4450
Wire Wire Line
	7350 4450 7850 4450
Wire Wire Line
	7850 4550 7850 4450
Connection ~ 7850 4450
Wire Wire Line
	7850 4450 8250 4450
Wire Wire Line
	9250 4550 9250 4450
Connection ~ 9250 4450
Wire Wire Line
	9250 4450 9750 4450
Wire Wire Line
	7850 4850 7850 4950
Wire Wire Line
	7850 4950 8550 4950
Wire Wire Line
	9250 4950 9250 4850
Wire Wire Line
	8550 4750 8550 4950
Connection ~ 8550 4950
Wire Wire Line
	8550 4950 9250 4950
Wire Wire Line
	8550 4950 8550 5050
Wire Wire Line
	7350 4550 7350 4450
Wire Wire Line
	9750 4550 9750 4450
Wire Wire Line
	9750 4850 9750 4950
Wire Wire Line
	9750 4950 9250 4950
Connection ~ 9250 4950
Wire Wire Line
	7850 4950 7350 4950
Wire Wire Line
	7350 4950 7350 4850
Connection ~ 7850 4950
$Comp
L power:+5VA #PWR?
U 1 1 619CBAE2
P 9750 4350
AR Path="/60DE2DF4/619CBAE2" Ref="#PWR?"  Part="1" 
AR Path="/61033008/619CBAE2" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 9750 4200 50  0001 C CNN
F 1 "+5VA" H 9765 4523 50  0000 C CNN
F 2 "" H 9750 4350 50  0001 C CNN
F 3 "" H 9750 4350 50  0001 C CNN
	1    9750 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 4450 9750 4350
Connection ~ 9750 4450
$Comp
L power:VCC #PWR?
U 1 1 619CEE4C
P 7350 4350
AR Path="/619CEE4C" Ref="#PWR?"  Part="1" 
AR Path="/61033008/619CEE4C" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 7350 4200 50  0001 C CNN
F 1 "VCC" H 7367 4523 50  0000 C CNN
F 2 "" H 7350 4350 50  0001 C CNN
F 3 "" H 7350 4350 50  0001 C CNN
	1    7350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4450 7350 4350
Connection ~ 7350 4450
$Comp
L Device:LED D5
U 1 1 619D82C7
P 10250 5100
F 0 "D5" V 10288 4983 50  0000 R CNN
F 1 "A_PWR_LED" V 10197 4983 50  0000 R CNN
F 2 "LED_SMD:LED_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 10250 5100 50  0001 C CNN
F 3 "~" H 10250 5100 50  0001 C CNN
	1    10250 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10250 4950 10250 4850
Wire Wire Line
	10250 4550 10250 4450
$Comp
L Device:R R26
U 1 1 619D82CF
P 10250 4700
F 0 "R26" H 10320 4746 50  0000 L CNN
F 1 "1K" H 10320 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 10180 4700 50  0001 C CNN
F 3 "~" H 10250 4700 50  0001 C CNN
	1    10250 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 5250 10250 5350
Text Notes 10150 5150 2    50   ~ 0
Green LED
Wire Wire Line
	9750 4450 10250 4450
$Comp
L power:GNDA #PWR0109
U 1 1 619E1D00
P 10250 5350
F 0 "#PWR0109" H 10250 5100 50  0001 C CNN
F 1 "GNDA" H 10255 5177 50  0000 C CNN
F 2 "" H 10250 5350 50  0001 C CNN
F 3 "" H 10250 5350 50  0001 C CNN
	1    10250 5350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 61A0EA58
P 9250 3500
AR Path="/61A0EA58" Ref="#PWR?"  Part="1" 
AR Path="/61033008/61A0EA58" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 9250 3350 50  0001 C CNN
F 1 "VCC" H 9267 3673 50  0000 C CNN
F 2 "" H 9250 3500 50  0001 C CNN
F 3 "" H 9250 3500 50  0001 C CNN
	1    9250 3500
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG04
U 1 1 61A0EB7B
P 9750 3500
F 0 "#FLG04" H 9750 3575 50  0001 C CNN
F 1 "PWR_FLAG" H 9750 3674 50  0000 C CNN
F 2 "" H 9750 3500 50  0001 C CNN
F 3 "~" H 9750 3500 50  0001 C CNN
	1    9750 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 3600 9750 3600
Wire Wire Line
	9250 3500 9250 3600
Wire Wire Line
	9750 3500 9750 3600
$Comp
L power:GNDA #PWR0102
U 1 1 61A1482F
P 10250 3600
F 0 "#PWR0102" H 10250 3350 50  0001 C CNN
F 1 "GNDA" H 10255 3427 50  0000 C CNN
F 2 "" H 10250 3600 50  0001 C CNN
F 3 "" H 10250 3600 50  0001 C CNN
	1    10250 3600
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG05
U 1 1 61A14952
P 10250 3500
F 0 "#FLG05" H 10250 3575 50  0001 C CNN
F 1 "PWR_FLAG" H 10250 3674 50  0000 C CNN
F 2 "" H 10250 3500 50  0001 C CNN
F 3 "~" H 10250 3500 50  0001 C CNN
	1    10250 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 3500 10250 3600
$Comp
L power:+5V #PWR096
U 1 1 61A17AE4
P 9250 2700
F 0 "#PWR096" H 9250 2550 50  0001 C CNN
F 1 "+5V" H 9265 2873 50  0000 C CNN
F 2 "" H 9250 2700 50  0001 C CNN
F 3 "" H 9250 2700 50  0001 C CNN
	1    9250 2700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 61A17C33
P 9750 2700
F 0 "#FLG02" H 9750 2775 50  0001 C CNN
F 1 "PWR_FLAG" H 9750 2874 50  0000 C CNN
F 2 "" H 9750 2700 50  0001 C CNN
F 3 "~" H 9750 2700 50  0001 C CNN
	1    9750 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 2800 9750 2800
Wire Wire Line
	9250 2700 9250 2800
Wire Wire Line
	9750 2700 9750 2800
$Comp
L power:PWR_FLAG #FLG03
U 1 1 61AF5DF5
P 9750 3100
F 0 "#FLG03" H 9750 3175 50  0001 C CNN
F 1 "PWR_FLAG" H 9750 3274 50  0000 C CNN
F 2 "" H 9750 3100 50  0001 C CNN
F 3 "~" H 9750 3100 50  0001 C CNN
	1    9750 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR098
U 1 1 61AF5E60
P 9250 3100
F 0 "#PWR098" H 9250 2950 50  0001 C CNN
F 1 "+BATT" H 9265 3273 50  0000 C CNN
F 2 "" H 9250 3100 50  0001 C CNN
F 3 "" H 9250 3100 50  0001 C CNN
	1    9250 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 3200 9750 3200
Wire Wire Line
	9250 3100 9250 3200
Wire Wire Line
	9750 3100 9750 3200
$EndSCHEMATC
