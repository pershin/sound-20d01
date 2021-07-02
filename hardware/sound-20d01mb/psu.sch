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
L Regulator_Linear:AZ1117-3.3 U?
U 1 1 60DF628F
P 4450 4050
F 0 "U?" H 4450 4292 50  0000 C CNN
F 1 "ADP3338AKCZ-3.3RL7" H 4450 4201 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 4450 4300 50  0001 C CIN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/adp3338.pdf" H 4450 4050 50  0001 C CNN
	1    4450 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E015B2
P 5250 4300
AR Path="/60DE2DF4/60E015B2" Ref="C?"  Part="1" 
AR Path="/60DE2DF1/60E015B2" Ref="C?"  Part="1" 
AR Path="/61033008/60E015B2" Ref="C?"  Part="1" 
F 0 "C?" H 5365 4346 50  0000 L CNN
F 1 "2.2uF" H 5365 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5288 4150 50  0001 C CNN
F 3 "~" H 5250 4300 50  0001 C CNN
	1    5250 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E01602
P 3650 4300
AR Path="/60DE2DF4/60E01602" Ref="C?"  Part="1" 
AR Path="/60DE2DF1/60E01602" Ref="C?"  Part="1" 
AR Path="/61033008/60E01602" Ref="C?"  Part="1" 
F 0 "C?" H 3765 4346 50  0000 L CNN
F 1 "2.2uF" H 3765 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3688 4150 50  0001 C CNN
F 3 "~" H 3650 4300 50  0001 C CNN
	1    3650 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 60E01644
P 4450 4650
F 0 "#PWR?" H 4450 4400 50  0001 C CNN
F 1 "GNDA" H 4455 4477 50  0000 C CNN
F 2 "" H 4450 4650 50  0001 C CNN
F 3 "" H 4450 4650 50  0001 C CNN
	1    4450 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4350 4450 4550
$Comp
L power:+3.3VA #PWR?
U 1 1 60E017A8
P 5250 3950
F 0 "#PWR?" H 5250 3800 50  0001 C CNN
F 1 "+3.3VA" H 5265 4123 50  0000 C CNN
F 2 "" H 5250 3950 50  0001 C CNN
F 3 "" H 5250 3950 50  0001 C CNN
	1    5250 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4050 5250 4050
Wire Wire Line
	5250 4050 5250 3950
Wire Wire Line
	5250 4050 5250 4150
Connection ~ 5250 4050
Wire Wire Line
	5250 4450 5250 4550
Wire Wire Line
	5250 4550 4450 4550
Wire Wire Line
	4450 4550 4450 4650
Connection ~ 4450 4550
Wire Wire Line
	3650 4050 4150 4050
Wire Wire Line
	4450 4550 3650 4550
Wire Wire Line
	3650 4550 3650 4450
Wire Wire Line
	3650 4050 3650 4150
Text Notes 5150 3700 0    50   ~ 0
Analog power supply 3.3V (for PCM5102A)
$Comp
L Regulator_Linear:AZ1117-3.3 U?
U 1 1 60E0E9BB
P 4450 2450
F 0 "U?" H 4450 2692 50  0000 C CNN
F 1 "ADP3338AKCZ-3.3RL7" H 4450 2601 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 4450 2700 50  0001 C CIN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/adp3338.pdf" H 4450 2450 50  0001 C CNN
	1    4450 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E0E9C1
P 5250 2700
AR Path="/60DE2DF4/60E0E9C1" Ref="C?"  Part="1" 
AR Path="/60DE2DF1/60E0E9C1" Ref="C?"  Part="1" 
AR Path="/61033008/60E0E9C1" Ref="C?"  Part="1" 
F 0 "C?" H 5365 2746 50  0000 L CNN
F 1 "2.2uF" H 5365 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5288 2550 50  0001 C CNN
F 3 "~" H 5250 2700 50  0001 C CNN
	1    5250 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E0E9C7
P 3650 2700
AR Path="/60DE2DF4/60E0E9C7" Ref="C?"  Part="1" 
AR Path="/60DE2DF1/60E0E9C7" Ref="C?"  Part="1" 
AR Path="/61033008/60E0E9C7" Ref="C?"  Part="1" 
F 0 "C?" H 3765 2746 50  0000 L CNN
F 1 "2.2uF" H 3765 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3688 2550 50  0001 C CNN
F 3 "~" H 3650 2700 50  0001 C CNN
	1    3650 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 60E0E9CD
P 4450 3050
F 0 "#PWR?" H 4450 2800 50  0001 C CNN
F 1 "GNDA" H 4455 2877 50  0000 C CNN
F 2 "" H 4450 3050 50  0001 C CNN
F 3 "" H 4450 3050 50  0001 C CNN
	1    4450 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2750 4450 2950
Wire Wire Line
	4750 2450 5250 2450
Wire Wire Line
	5250 2450 5250 2350
Wire Wire Line
	5250 2450 5250 2550
Connection ~ 5250 2450
Wire Wire Line
	5250 2850 5250 2950
Wire Wire Line
	5250 2950 4450 2950
Wire Wire Line
	4450 2950 4450 3050
Connection ~ 4450 2950
Wire Wire Line
	3650 2450 4150 2450
Wire Wire Line
	4450 2950 3650 2950
Wire Wire Line
	3650 2950 3650 2850
Wire Wire Line
	3650 2450 3650 2550
$Comp
L power:+3.3V #PWR?
U 1 1 60E0F338
P 5250 2350
F 0 "#PWR?" H 5250 2200 50  0001 C CNN
F 1 "+3.3V" H 5265 2523 50  0000 C CNN
F 2 "" H 5250 2350 50  0001 C CNN
F 3 "" H 5250 2350 50  0001 C CNN
	1    5250 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60E0F3AB
P 3650 2350
F 0 "#PWR?" H 3650 2200 50  0001 C CNN
F 1 "+5V" H 3665 2523 50  0000 C CNN
F 2 "" H 3650 2350 50  0001 C CNN
F 3 "" H 3650 2350 50  0001 C CNN
	1    3650 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2350 3650 2450
Connection ~ 3650 2450
Text Notes 5150 2100 0    50   ~ 0
Digital power supply 3.3V
$EndSCHEMATC
