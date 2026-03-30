/*************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit  *
 * --------------------------------------------------------------------- *
 *  SSD1803A.h - Driver for the SSD1803A LCD display chipset             *
 *************************************************************************/

#ifndef __SSD1803A_H__
#define	__SSD1803A_H__

//Import any libraries used by this file
#include <xc.h>      //Include the main header file for the XC32 compiler, provides register definitions
#include "../HAL.h"  //Include the HAL header which contains the I2C interface through which the display is attached to

//Define any constants specific to this device
#ifndef SSD1803A_I2C_ADDR
#define SSD1803A_I2C_ADDR    0x3C  //Sets the I2C address of the device
#endif

////Define the bit-masks used by the drivers status register
//#ifndef SSD1803A_STATUS_MASKS
//#define SSD1803A_STATUS_MASKS
//
//#define SSD1803A_BITMASK_IS    0x000
//
//
//#endif



//                UD2 | UD1 |  ~  | DH` | BE | DH | REV

//4 Lines          0     0     0     0    0    0     0
//3 Lines B        0     0     0     0    0    1     0
//3 Lines M        0     1     0     0    0    1     0
//2 Lines          1     0     0     0    0    1     0
//3 Lines T        1     1     0     0    0    1     0

//    UD2 | UD1 | BS1 | DH` | BE | BS0 | REV | DH | RE | IS





//Define any enum types used within this file
typedef enum
{
    DISPLAY_OFF = 0x08, DISPLAY_ON_NO_CURSOR = 0x0C, DISPLAY_ON_WITH_CURSOR = 0x0E, DISPLAY_ON_BLINKING_CURSOR = 0x0F
} SSD1803A_displayMode_t;

typedef enum
{
    LINES_4 = 0x1C, LINES_3_TOP = 0x11, LINES_3_MIDDLE = 0x15, LINES_2 = 0x19, LINES_3_BOTTOM = 0x1D
} SSD1803A_lineCount_t;

typedef enum
{
    VIEW_TOP = 0x05, VIEW_BOTTOM = 0x06
} SSD1803A_orientation_t;

typedef enum
{
    BIAS_5TH, BIAS_4TH, BIAS_7TH, BIAS_6TH
} SSD1803A_vBias_t;

typedef enum
{
    RE_0_IS_0, RE_0_IS_1, RE_1_IS_0, RE_1_IS_1
} SSD1803A_registers_t;

typedef enum
{
    IR0 = 0x68, IR1 = 0x69, IR2 = 0x6A, IR3 = 0x6B, IR4 = 0x6C, IR5 = 0x6D, IR6 = 0x6E, IR7 = 0x6F
} SSD1803A_regulatorGain_t;


//Define any variables that are external to this
extern const uint8_t SSD1803A_Init[];  //Stores the default configuration bytes to send to the LCD controller

extern uint32_t statusRegister_SSD1803A;  //Driver Status Register, used to track and hold specific static settings that are applied to the chipset when executing the function set instruction
//    UD2 | UD1 | BS1 | DH` | BE | BS0 | REV | DH | RE | IS


//Initialization Functions
extern uint32_t initializeSSD1803A(SSD1803A_orientation_t orientation,  //Initialize Function, configures the chipset for the desired operating mode for the application
                                   SSD1803A_lineCount_t lines,
                                   SSD1803A_vBias_t lcdBias,
                                   SSD1803A_regulatorGain_t lcdGain);

//Interaction Functions
extern uint32_t clearDisplaySSD1803A();                                  //Clear Display Function, clears the contents of the display and returns the cursor to home
extern uint32_t returnHomeSSD1803A();                                    //Return Home Function, returns the cursor to home position on the display
extern uint32_t putCursorSSD1803A(uint32_t newCursorPosition);           //Put Cursor Function, changes the DDRAM address that the cursor is placed at on the LCD display
extern uint32_t setScrollOffset(uint8_t newScrollAmount);                //Set Scroll Offset Function, sets the amount of pixels/characters to shift the display contents over by
extern uint32_t setDisplayModeSSD1803A(SSD1803A_displayMode_t newMode);  //Set Display Mode Function, sets the desired operating mode of the LCD display
extern uint32_t setContrastSSD1803A(uint8_t newContrast);                //Set Contrast Function, sets the contrast of the LCD display to the desired value
extern uint32_t setLineCountSSD1803A(SSD1803A_lineCount_t lines);        //Set Line Count Function, configures how the LCD controller is to arrange the lines on the display

//Utility Functions
extern uint32_t functionSetSSD1803A(SSD1803A_registers_t registerSelect);  //Function Set Function, selects what function registers the LCD controller is to respond to
extern uint32_t sendCommandSSD1803A(uint8_t command);                      //Send Command Function, sends the desired command byte to the LCD controller through the I2C interface
extern uint32_t printStringSSD1803A(uint8_t *string, uint32_t length);     //Print String Function, prints the provided string to the LCD display


#endif






//END OF FILE