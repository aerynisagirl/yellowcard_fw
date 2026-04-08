/**************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit   *
 * ---------------------------------------------------------------------- *
 *  StringUtils.h - All utilities related to string processing live here  *
 **************************************************************************/

#ifndef __STRING_UTILS_H__
#define __STRING_UTILS_H__

//Import any libraries used by this file
#include <xc.h>  //Include the main header file for the XC32 compiler, provides register definitions


//Define prototypes for functions used in the StringUtils source file
extern void uintToDecString(uint32_t numberToConvert, uint8_t *stringBuffer);  //Unsigned Integer To Decimal String, converts the provided unsigned integer into it's decimal string representation
extern void byteToHexString(uint8_t byteToConvert, uint8_t *stringBuffer);     //Byte To Hexadecimal String, converts the provided byte into it's hexadecimal string representation


#endif






//END OF FILE