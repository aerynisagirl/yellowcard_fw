/********************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit         *
 * ---------------------------------------------------------------------------- *
 *  Display.c - Contains all things related to putting text on the LCD display  *
 ********************************************************************************/

#include "Display.h"


/**********************
 *  String Constants  *
 **********************/

//const uint8_t displayString_measurements[] = "        ";
//const uint8_t displayString_blankLine[] = "                ";



/***********************
 *  Display Functions  *
 ***********************/

//Display Measurements Function, puts the provided measurement data onto the LCD display
void displayMeasurements(float *temperature, float *humidity, float *pressure)
{
    uint8_t stringBuffer[0x00000010];    //Declare an array of 16 bytes to use for the string buffer
    int32_t dataBuffer;                  //Reserve a new 32-bit variable in RAM to use for doing number manipulation while creating the strings
    uint32_t stringLength = 0x00000000;  //Create a new variable to use for tracking the length of the string being constructed

    //Pad the line with 4 spaces
    while (stringLength <= 0x00000003)
    {
        stringBuffer[stringLength++] = 0x20;  //Write a space character to the next character in the string
    }

    dataBuffer = (*temperature * 100.0F);  //Multiply the most recent temperature measurement by 100, then store it in dataBuffer with no decimal

    //Handle scenarios where the value of dataBuffer is actually a negative
    if (dataBuffer < 0x00000000)
    {
        stringBuffer[stringLength] = 0x2D;  //Add a minus character to the string buffer to indicate the negative number
        dataBuffer = -dataBuffer;           //Force the contents of dataBuffer back into the positives again
    }
    else
    {
        stringBuffer[stringLength] = 0x20;  //Use a space character when the temperature is a positive integer
    }

    stringLength++;  //Increment the string length variable by a value of 1

    //Integer portion
    uintToDecString(dataBuffer / 0x00000064, stringBuffer + stringLength);  //Convert the whole number portion of the temperature into a string and put it into the string buffer
    stringLength = strlen(stringBuffer);                                    //Find the new length of the string with the whole number added into it
    dataBuffer %= 0x00000064;                                               //Modulo the contents of dataBuffer by 100, storing the result back into the dataBuffer variable

    //Decimal portion
    stringBuffer[stringLength++] = 0x2E;                                    //Place the decimal point right after the whole number portion
    uintToDecString(dataBuffer % 0x00000064, stringBuffer + stringLength);  //Convert the decimal portion of the temperature into a string and put it into the string buffer
    stringLength = strlen(stringBuffer);                                    //Find the new length of the string with the decimal places added into it

    //Keep adding spaces until the string is 16 characters long
    while (stringLength <= 0x000000F)
    {
        stringBuffer[stringLength++] = 0x20;  //Append another space to the end of the string
    }

    stringBuffer[0x0000000B] = 0x43;  //Make the 11 character of the string a capital C
    
    putCursorSSD1803A(0x00000020);                  //Position the cursor on the LCD to the beginning of line 2
    printStringSSD1803A(stringBuffer, 0x00000010);  //Send the temperature string to the display

    stringLength = 0x00000010;                                 //Write a value of 15 into the stringLength variable
    while (stringLength) stringBuffer[--stringLength] = 0x00;  //Clear the contents of every character in the string

    uintToDecString((uint32_t) *humidity, stringBuffer);  //Convert the measured RH into it's string equivalent, storing it in the string buffer
    stringLength = strlen(stringBuffer);                  //Find the new length of the string with the humidity value added in

    stringBuffer[stringLength++] = 0x25;  //Next character in the string is to be a percent sign
    stringBuffer[stringLength++] = 0x20;  //Next character of the string is a space
    stringBuffer[stringLength++] = 0x52;  //Next character is a capital R
    stringBuffer[stringLength++] = 0x48;  //Next character is a capital H
//    stringBuffer[stringLength++] = 0x20;  //Next character is a space
    stringBuffer[stringLength++] = 0x20;  //Terminate this section of the string with a space character

    //Add an extra space to the string if the barometric pressure result is less than 100000
    if (*pressure < 100000) stringBuffer[stringLength++] = 0x20;  //Append another space character to the string

    dataBuffer = (*pressure / 10.0F);  //Divide the provided barometric pressure measurement by 10 to remove the last 2 decimal places

    //Integer portion
    uintToDecString(dataBuffer / 0x00000064, stringBuffer + stringLength);  //Convert the whole number portion of the pressure into a string and put it into the string buffer
    stringLength = strlen(stringBuffer);                                    //Find the new length of the string with the whole number added to it
    dataBuffer %= 0x00000064;                                               //Modulo the contents of dataBuffer by 10, storing the result back into the dataBuffer variable

    //Decimal portion
    stringBuffer[stringLength++] = 0x2E;                                    //Place the decimal point right after the whole number portion
    uintToDecString(dataBuffer % 0x00000064, stringBuffer + stringLength);  //Convert the decimal portion of the pressure into a string and put it into the string buffer
    stringLength = strlen(stringBuffer);                                    //Find the new length of the string with the decimal places added into it

    while (stringLength < 0x0000000D) stringBuffer[stringLength++] = 0x20;  //Keep adding spaces into the string until theres 3 characters of space left

    stringBuffer[stringLength++] = 0x6B;  //Next character in the string is a lowercase k
    stringBuffer[stringLength++] = 0x50;  //Next character in the string is a capital P
    stringBuffer[stringLength++] = 0x61;  //Final character in the string is a lowercase A
    
    putCursorSSD1803A(0x00000060);                  //Position the cursor on the LCD to the beginning of line 4
    printStringSSD1803A(stringBuffer, 0x00000010);  //Put the humidity and barometric pressure values on the display
}






//END OF FILE