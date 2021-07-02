EESchema Schematic File Version 4
LIBS:sound-20d01mb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title "Sound-20D01MB"
Date "2021-07-01"
Rev "0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1850 1700 1200 1250
U 60DE2DEE
F0 "Microcontroller Unit" 50
F1 "mcu.sch" 50
$EndSheet
$Sheet
S 3150 1700 1200 1250
U 60DE2DF1
F0 "DAC" 50
F1 "dac.sch" 50
F2 "DAC_WS" I L 3150 1800 50 
F3 "DAC_SD" I L 3150 1900 50 
F4 "DAC_CK" I L 3150 2000 50 
F5 "DAC_MCK" I L 3150 2100 50 
F6 "DAC_ROUT" O R 4350 1900 50 
F7 "DAC_LOUT" O R 4350 1800 50 
$EndSheet
$Sheet
S 4450 1700 1200 1250
U 60DE2DF4
F0 "Amplifier" 50
F1 "amplifier.sch" 50
F2 "LIN" I L 4450 1800 50 
F3 "RIN" I L 4450 1900 50 
F4 "LOUT" O R 5650 1800 50 
F5 "ROUT" O R 5650 2100 50 
$EndSheet
$Comp
L Mechanical:MountingHole H?
U 1 1 60DF6F4D
P 8100 6350
F 0 "H?" H 8200 6396 50  0000 L CNN
F 1 "MountingHole" H 8200 6305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 8100 6350 50  0001 C CNN
F 3 "~" H 8100 6350 50  0001 C CNN
	1    8100 6350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H?
U 1 1 60DF9883
P 8900 6350
F 0 "H?" H 9000 6396 50  0000 L CNN
F 1 "MountingHole" H 9000 6305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 8900 6350 50  0001 C CNN
F 3 "~" H 8900 6350 50  0001 C CNN
	1    8900 6350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H?
U 1 1 60DF98C1
P 9700 6350
F 0 "H?" H 9800 6396 50  0000 L CNN
F 1 "MountingHole" H 9800 6305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 9700 6350 50  0001 C CNN
F 3 "~" H 9700 6350 50  0001 C CNN
	1    9700 6350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H?
U 1 1 60DF9924
P 10500 6350
F 0 "H?" H 10600 6396 50  0000 L CNN
F 1 "MountingHole" H 10600 6305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10500 6350 50  0001 C CNN
F 3 "~" H 10500 6350 50  0001 C CNN
	1    10500 6350
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B J?
U 1 1 60E01FED
P 1050 2000
F 0 "J?" H 1105 2467 50  0000 C CNN
F 1 "USB_B" H 1105 2376 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 1200 1950 50  0001 C CNN
F 3 " ~" H 1200 1950 50  0001 C CNN
	1    1050 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E023A0
P 1050 2600
F 0 "#PWR?" H 1050 2350 50  0001 C CNN
F 1 "GNDD" H 1054 2445 50  0000 C CNN
F 2 "" H 1050 2600 50  0001 C CNN
F 3 "" H 1050 2600 50  0001 C CNN
	1    1050 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 2400 1050 2500
Wire Wire Line
	950  2400 950  2500
Wire Wire Line
	950  2500 1050 2500
Connection ~ 1050 2500
Wire Wire Line
	1050 2500 1050 2600
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 60E0274E
P 6150 1900
F 0 "J?" H 6230 1892 50  0000 L CNN
F 1 "Conn_01x04" H 6230 1801 50  0000 L CNN
F 2 "" H 6150 1900 50  0001 C CNN
F 3 "~" H 6150 1900 50  0001 C CNN
	1    6150 1900
	1    0    0    -1  
$EndComp
Text Notes 6100 1700 0    50   ~ 0
Minimum load impedance: 4 Ohms
$Comp
L power:GNDA #PWR?
U 1 1 60E0BD8E
P 5850 2200
F 0 "#PWR?" H 5850 1950 50  0001 C CNN
F 1 "GNDA" H 5855 2027 50  0000 C CNN
F 2 "" H 5850 2200 50  0001 C CNN
F 3 "" H 5850 2200 50  0001 C CNN
	1    5850 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2000 5850 2000
Wire Wire Line
	5850 2000 5850 2200
Wire Wire Line
	5950 1900 5850 1900
Wire Wire Line
	5850 1900 5850 2000
Connection ~ 5850 2000
Wire Wire Line
	5650 1800 5950 1800
Wire Wire Line
	5650 2100 5950 2100
Wire Wire Line
	4350 1800 4450 1800
Wire Wire Line
	4350 1900 4450 1900
$Sheet
S 1850 3250 1200 1250
U 61033008
F0 "Power Supply Unit" 50
F1 "psu.sch" 50
$EndSheet
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 60E0FD2A
P 6150 3400
F 0 "J?" H 6230 3392 50  0000 L CNN
F 1 "Conn_01x02" H 6230 3301 50  0000 L CNN
F 2 "Connector_JST:JST_VH_B2P-VH_1x02_P3.96mm_Vertical" H 6150 3400 50  0001 C CNN
F 3 "~" H 6150 3400 50  0001 C CNN
	1    6150 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 60E0FF3C
P 5850 3600
F 0 "#PWR?" H 5850 3350 50  0001 C CNN
F 1 "GNDA" H 5855 3427 50  0000 C CNN
F 2 "" H 5850 3600 50  0001 C CNN
F 3 "" H 5850 3600 50  0001 C CNN
	1    5850 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3500 5850 3500
Wire Wire Line
	5850 3500 5850 3600
$Comp
L power:VCC #PWR?
U 1 1 60E100F5
P 5850 3300
F 0 "#PWR?" H 5850 3150 50  0001 C CNN
F 1 "VCC" H 5867 3473 50  0000 C CNN
F 2 "" H 5850 3300 50  0001 C CNN
F 3 "" H 5850 3300 50  0001 C CNN
	1    5850 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 3400 5850 3400
Wire Wire Line
	5850 3400 5850 3300
Text Notes 6100 3300 0    50   ~ 0
Supply voltage range: 12V to 30V
$EndSCHEMATC
