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
P 4350 3150
F 0 "U?" H 4350 3392 50  0000 C CNN
F 1 "ADP3338AKCZ-3.3RL7" H 4350 3301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 4350 3400 50  0001 C CIN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/adp3338.pdf" H 4350 3150 50  0001 C CNN
	1    4350 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E015B2
P 5150 3400
AR Path="/60DE2DF4/60E015B2" Ref="C?"  Part="1" 
AR Path="/60DE2DF1/60E015B2" Ref="C?"  Part="1" 
AR Path="/61033008/60E015B2" Ref="C?"  Part="1" 
F 0 "C?" H 5265 3446 50  0000 L CNN
F 1 "2.2uF" H 5265 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5188 3250 50  0001 C CNN
F 3 "~" H 5150 3400 50  0001 C CNN
	1    5150 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E01602
P 3550 3400
AR Path="/60DE2DF4/60E01602" Ref="C?"  Part="1" 
AR Path="/60DE2DF1/60E01602" Ref="C?"  Part="1" 
AR Path="/61033008/60E01602" Ref="C?"  Part="1" 
F 0 "C?" H 3665 3446 50  0000 L CNN
F 1 "2.2uF" H 3665 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3588 3250 50  0001 C CNN
F 3 "~" H 3550 3400 50  0001 C CNN
	1    3550 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 60E01644
P 4350 3750
F 0 "#PWR?" H 4350 3500 50  0001 C CNN
F 1 "GNDA" H 4355 3577 50  0000 C CNN
F 2 "" H 4350 3750 50  0001 C CNN
F 3 "" H 4350 3750 50  0001 C CNN
	1    4350 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3450 4350 3650
$Comp
L power:+3.3VA #PWR?
U 1 1 60E017A8
P 5150 3050
F 0 "#PWR?" H 5150 2900 50  0001 C CNN
F 1 "+3.3VA" H 5165 3223 50  0000 C CNN
F 2 "" H 5150 3050 50  0001 C CNN
F 3 "" H 5150 3050 50  0001 C CNN
	1    5150 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3150 5150 3150
Wire Wire Line
	5150 3150 5150 3050
Wire Wire Line
	5150 3150 5150 3250
Connection ~ 5150 3150
Wire Wire Line
	5150 3550 5150 3650
Wire Wire Line
	5150 3650 4350 3650
Wire Wire Line
	4350 3650 4350 3750
Connection ~ 4350 3650
Wire Wire Line
	3550 3150 4050 3150
Wire Wire Line
	4350 3650 3550 3650
Wire Wire Line
	3550 3650 3550 3550
Wire Wire Line
	3550 3150 3550 3250
Text Notes 5050 2800 0    50   ~ 0
To DAC (PCM5102A)
$EndSCHEMATC
