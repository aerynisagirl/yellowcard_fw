/*************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit  *
 * --------------------------------------------------------------------- *
 *  Display.h - Contains all things related to the LCD display           *
 *************************************************************************/

#ifndef __DISPLAY_H__
#define __DISPLAY_H__

//Import any libraries used by this file
#include <xc.h>                     //Include the main header file for the XC32 compiler, provides register definitions
#include <string.h>                 //Include the default string library which has some handy memory and string manipulation functions
#include "StringUtils.h"            //Include the string utilities header for the data to string conversion functions
#include "drv/SSD1803A/SSD1803A.h"  //Include the driver for the SSD1803A LCD controller chipset



//String constant flash memory allocation
extern const uint8_t __attribute__ ((space(prog), section(".display_strings"))) displayString_measurements[];
extern const uint8_t __attribute__ ((space(prog), section(".display_strings"))) displayString_blankLine[];


//Display Functions
extern void displayMeasurements(float *temperature,  //Display Measurements Function, puts the provided measurement data onto the LCD display
                                float *humidity,
                                float *pressure);


#endif






//END OF FILE