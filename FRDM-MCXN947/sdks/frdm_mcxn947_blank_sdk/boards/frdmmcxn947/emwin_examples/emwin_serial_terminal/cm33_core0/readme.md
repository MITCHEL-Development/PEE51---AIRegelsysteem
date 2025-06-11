Overview
========
The serial_terminal demo shows how to use emWin library to render text. Connect using serial terminal application to debug console and type text.
Please note that this example does not make use of receive buffer thus this example cannot handle larger amout of text pasted to the terminal at a time.

SDK version
===========
- Version: 25.03.00

Toolchain supported
===================
- Keil MDK  5.41
- IAR embedded Workbench  9.60.3
- GCC ARM Embedded  13.2.1
- MCUXpresso  24.12.00

Hardware requirements
=====================
- Type-C USB cable
- FRDM-MCXN947 board
- Personal Computer
- TFT Proto 5" CAPACITIVE board HW REV 1.01 by Mikroelektronika.

Board settings
==============
Attach the LCD shield to the FRDM board.

Prepare the Demo
================
1.  Connect a type-c USB cable between the PC host and the MCU-Link USB port (J17) on the board
2.  Build the project.
3.  Download the program to the target board.
4.  Reset the SoC and run the project.

Running the demo
================
If this example runs correctly, the sample GUI is displayed.
