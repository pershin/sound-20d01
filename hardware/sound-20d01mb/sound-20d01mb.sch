EESchema Schematic File Version 4
LIBS:sound-20d01mb-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
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
S 2450 1700 1200 2550
U 60DE2DEE
F0 "Microcontroller Unit" 50
F1 "mcu.sch" 50
F2 "USB_D+" I L 2450 1800 50 
F3 "USB_D-" I L 2450 1900 50 
F4 "NRST" I L 2450 3350 50 
F5 "BOOT0" I L 2450 4150 50 
F6 "SWDIO" B L 2450 3250 50 
F7 "SWCLK" I L 2450 3050 50 
F8 "SAI1_FS_B" O R 3650 1800 50 
F9 "SAI1_SD_B" O R 3650 1900 50 
F10 "SAI1_SCK_B" O R 3650 2000 50 
F11 "SAI1_MCLK_B" O R 3650 2100 50 
F12 "SWO" O L 2450 3450 50 
$EndSheet
$Sheet
S 3750 1700 1200 500 
U 60DE2DF1
F0 "DAC" 50
F1 "dac.sch" 50
F2 "DAC_WS" I L 3750 1800 50 
F3 "DAC_SD" I L 3750 1900 50 
F4 "DAC_CK" I L 3750 2000 50 
F5 "DAC_MCK" I L 3750 2100 50 
F6 "DAC_ROUT" O R 4950 1900 50 
F7 "DAC_LOUT" O R 4950 1800 50 
$EndSheet
$Sheet
S 5050 1700 1200 500 
U 60DE2DF4
F0 "Amplifier" 50
F1 "amplifier.sch" 50
F2 "LIN" I L 5050 1800 50 
F3 "RIN" I L 5050 1900 50 
F4 "LOUT" O R 6250 1800 50 
F5 "ROUT" O R 6250 2100 50 
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
P 1650 1800
F 0 "J?" H 1705 2267 50  0000 C CNN
F 1 "USB_B" H 1705 2176 50  0000 C CNN
F 2 "Connector_USB:USB_B_OST_USB-B1HSxx_Horizontal" H 1800 1750 50  0001 C CNN
F 3 " ~" H 1800 1750 50  0001 C CNN
	1    1650 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60E023A0
P 1650 2400
F 0 "#PWR?" H 1650 2150 50  0001 C CNN
F 1 "GNDD" H 1654 2245 50  0000 C CNN
F 2 "" H 1650 2400 50  0001 C CNN
F 3 "" H 1650 2400 50  0001 C CNN
	1    1650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 2200 1650 2300
Wire Wire Line
	1550 2200 1550 2300
Wire Wire Line
	1550 2300 1650 2300
Connection ~ 1650 2300
Wire Wire Line
	1650 2300 1650 2400
$Comp
L Connector_Generic:Conn_01x04 J?
U 1 1 60E0274E
P 6750 1900
F 0 "J?" H 6830 1892 50  0000 L CNN
F 1 "Conn_01x04" H 6830 1801 50  0000 L CNN
F 2 "sound-20d01mb:X977B04" H 6750 1900 50  0001 C CNN
F 3 "~" H 6750 1900 50  0001 C CNN
	1    6750 1900
	1    0    0    -1  
$EndComp
Text Notes 6700 1700 0    50   ~ 0
Minimum load impedance: 4 Ohms
$Comp
L power:GNDA #PWR?
U 1 1 60E0BD8E
P 6450 2200
F 0 "#PWR?" H 6450 1950 50  0001 C CNN
F 1 "GNDA" H 6455 2027 50  0000 C CNN
F 2 "" H 6450 2200 50  0001 C CNN
F 3 "" H 6450 2200 50  0001 C CNN
	1    6450 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2000 6450 2000
Wire Wire Line
	6450 2000 6450 2200
Wire Wire Line
	6550 1900 6450 1900
Wire Wire Line
	6450 1900 6450 2000
Connection ~ 6450 2000
Wire Wire Line
	6250 1800 6550 1800
Wire Wire Line
	6250 2100 6550 2100
Wire Wire Line
	4950 1800 5050 1800
Wire Wire Line
	4950 1900 5050 1900
$Sheet
S 2450 4500 1200 1250
U 61033008
F0 "Power Supply Unit" 50
F1 "psu.sch" 50
F2 "EXT_5V" I R 3650 4600 50 
$EndSheet
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 60E0FD2A
P 6750 3400
F 0 "J?" H 6830 3392 50  0000 L CNN
F 1 "Conn_01x02" H 6830 3301 50  0000 L CNN
F 2 "Connector_JST:JST_VH_B2P-VH_1x02_P3.96mm_Vertical" H 6750 3400 50  0001 C CNN
F 3 "~" H 6750 3400 50  0001 C CNN
	1    6750 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR?
U 1 1 60E0FF3C
P 6450 3600
F 0 "#PWR?" H 6450 3350 50  0001 C CNN
F 1 "GNDA" H 6455 3427 50  0000 C CNN
F 2 "" H 6450 3600 50  0001 C CNN
F 3 "" H 6450 3600 50  0001 C CNN
	1    6450 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3500 6450 3500
Wire Wire Line
	6450 3500 6450 3600
$Comp
L power:VCC #PWR?
U 1 1 60E100F5
P 6450 3300
F 0 "#PWR?" H 6450 3150 50  0001 C CNN
F 1 "VCC" H 6467 3473 50  0000 C CNN
F 2 "" H 6450 3300 50  0001 C CNN
F 3 "" H 6450 3300 50  0001 C CNN
	1    6450 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3400 6450 3400
Wire Wire Line
	6450 3400 6450 3300
Text Notes 6700 3300 0    50   ~ 0
Supply voltage range: 12V to 30V (analog)
$Comp
L power:VBUS #PWR?
U 1 1 60E0D7F5
P 2050 1500
F 0 "#PWR?" H 2050 1350 50  0001 C CNN
F 1 "VBUS" H 2065 1673 50  0000 C CNN
F 2 "" H 2050 1500 50  0001 C CNN
F 3 "" H 2050 1500 50  0001 C CNN
	1    2050 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1600 2050 1600
Wire Wire Line
	2050 1600 2050 1500
Wire Wire Line
	1950 1800 2450 1800
Wire Wire Line
	1950 1900 2450 1900
Wire Wire Line
	3650 1800 3750 1800
Wire Wire Line
	3650 1900 3750 1900
Wire Wire Line
	3650 2000 3750 2000
Wire Wire Line
	3650 2100 3750 2100
$Comp
L Connector_Generic:Conn_01x06 J?
U 1 1 60E2D57C
P 1500 3150
F 0 "J?" H 1420 3567 50  0000 C CNN
F 1 "Conn_01x06" H 1420 3476 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1500 3150 50  0001 C CNN
F 3 "~" H 1500 3150 50  0001 C CNN
	1    1500 3150
	-1   0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Dual JP?
U 1 1 60E2D95F
P 1650 4150
F 0 "JP?" H 1650 4389 50  0000 C CNN
F 1 "Jumper_NC_Dual" H 1650 4298 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1650 4150 50  0001 C CNN
F 3 "~" H 1650 4150 50  0001 C CNN
	1    1650 4150
	1    0    0    -1  
$EndComp
NoConn ~ 1400 4150
Wire Wire Line
	1700 3050 2450 3050
$Comp
L power:+3.3V #PWR?
U 1 1 60E2E997
P 2050 2850
F 0 "#PWR?" H 2050 2700 50  0001 C CNN
F 1 "+3.3V" H 2065 3023 50  0000 C CNN
F 2 "" H 2050 2850 50  0001 C CNN
F 3 "" H 2050 2850 50  0001 C CNN
	1    2050 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2950 2050 2950
Wire Wire Line
	2050 2950 2050 2850
$Comp
L power:GNDD #PWR?
U 1 1 60E2EDAD
P 1800 3550
F 0 "#PWR?" H 1800 3300 50  0001 C CNN
F 1 "GNDD" H 1804 3395 50  0000 C CNN
F 2 "" H 1800 3550 50  0001 C CNN
F 3 "" H 1800 3550 50  0001 C CNN
	1    1800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3150 1800 3150
Wire Wire Line
	1800 3150 1800 3550
Wire Wire Line
	1700 3250 2450 3250
Wire Wire Line
	1700 3350 2450 3350
$Comp
L power:GNDD #PWR?
U 1 1 60E30724
P 1650 4350
F 0 "#PWR?" H 1650 4100 50  0001 C CNN
F 1 "GNDD" H 1654 4195 50  0000 C CNN
F 2 "" H 1650 4350 50  0001 C CNN
F 3 "" H 1650 4350 50  0001 C CNN
	1    1650 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 4250 1650 4350
Wire Wire Line
	1900 4150 2450 4150
Text Notes 1350 3200 2    50   ~ 0
Debug connector
Text Notes 1350 1800 2    50   ~ 0
USB 2.0
Wire Wire Line
	1700 3450 2450 3450
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 60EA1B68
P 4200 4600
F 0 "J?" H 4280 4592 50  0000 L CNN
F 1 "Conn_01x02" H 4280 4501 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B02B-XH-A_1x02_P2.50mm_Vertical" H 4200 4600 50  0001 C CNN
F 3 "~" H 4200 4600 50  0001 C CNN
	1    4200 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 60EA1BF4
P 3900 4800
F 0 "#PWR?" H 3900 4550 50  0001 C CNN
F 1 "GNDD" H 3904 4645 50  0000 C CNN
F 2 "" H 3900 4800 50  0001 C CNN
F 3 "" H 3900 4800 50  0001 C CNN
	1    3900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4700 3900 4700
Wire Wire Line
	3900 4700 3900 4800
Wire Wire Line
	4000 4600 3650 4600
Text Notes 4150 4500 0    50   ~ 0
External 5V Power supply (digital)
$EndSCHEMATC
