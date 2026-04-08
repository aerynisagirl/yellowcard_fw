/******************************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit                   *
 * -------------------------------------------------------------------------------------- *
 *  SSD1803A.c - Contains all functions for interacting with the SSD1308A LCD controller  *
 ******************************************************************************************/

#include "SSD1803A.h"



/***************
 *  Variables  *
 ***************/

//Configuration Settings
const uint8_t SSD1803A_Init[] = {
                                 0x38,  //Function Set, RE = 0, IS = ?
//                                 0x3B,  //Function Set, RE = 1, IS = 1
//                                 0x80,  //Scroll Quantity, set to 0
//                                 0x10,  //Scroll/Shift Enable, disable for all lines
                                 0x38,  //Function Set, RE = 0, IS = 0
                                 0x01,  //Clear display
                                 0x06,  //Entry Mode Set, cursor moves to the right with shifting enabled
                                 0x0C,  //Display On/Off, on with no cursor
                                 0x39,  //Function Set, RE = 0, IS = 1
                                 0x56,  //Power Control and Contrast, enable internal voltage booster and reset contrast to default
                                 0x70,  //Contrast Set, put the contrast back to the default setting
                                 
                                 0x09,  //Extended Function Set, 4 line display with 5 wide characters and no B/W inversion
                                 0x02,  //Power Down Mode, disabled
//                                 0x38,  //Function Set
                                 0x38,  //Function Set, RE = 0, IS = 0 with DH = 0
                                 0x3C,  //Function Set, RE = 0, IS = 0 with DH = 1
                                };

uint32_t statusRegister_SSD1803A = 0x00000000;  //Driver Status Register, used to track and hold specific static settings that are applied to the chipset when executing the function set instruction



/******************************
 *  Initialization Functions  *
 ******************************/

//Initialize Function, configures the chipset for the desired operating mode for the application
uint32_t initializeSSD1803A(SSD1803A_orientation_t orientation, SSD1803A_lineCount_t lines, SSD1803A_vBias_t lcdBias, SSD1803A_regulatorGain_t lcdGain)
{
    uint32_t counter = 0x00000008;               //Create a temporary variable to use for iterating through each byte of the sequence
    uint8_t calculatedCommands[0x00000005];      //Declare a 4 byte long array for generating the commands to apply the runtime configuration settings
    const uint8_t* bytePointer = SSD1803A_Init;  //Declare a pointer with the address of the first item in the SSD1803A_Init array

    statusRegister_SSD1803A = 0x00000000;  //Clear the state of the drivers status register

    //Send each command in the array to the LCD controller
    while (counter--)
    {
        if (!sendCommandSSD1803A(*bytePointer)) return 0x00000000;  //Try sending the command to the LCD controller, returning if it fails
        bytePointer++;                                              //Increment the address of bytePointer by 1
    }

    calculatedCommands[0x00000000] = ((lcdBias & 0x00000001) << 0x00000003) | 0x13;  //Calculate the appropriate Internal OSC Frequency/Bias command
    calculatedCommands[0x00000001] = lcdGain;                                        //Use the provided Follower Control command
    calculatedCommands[0x00000002] = 0x3A;                                           //Function Set, RE = 1, IS = 0
    calculatedCommands[0x00000003] = orientation;                                    //Use the provided Entry Set command
    calculatedCommands[0x00000004] = (lines & 0x0000001C) | (lcdBias & 0x00000002);  //Calculate the appropriate Double Height/Bias commands

    //Store the provided settings into the drivers status register to use during other function calls
    statusRegister_SSD1803A = (((lines & 0x0000000C) | (lcdBias & 0x00000002)) << 0x00000006) | ((lcdBias & 0x00000001) << 0x00000004) |
                              ((lines & 0x00000001) << 0x00000002) | 0x00000001;
    
    counter = 0x00000005;              //Start the counter with a value of 5 this time
    bytePointer = calculatedCommands;  //Copy the address of the first element in calculatedCommands into bytePointer

    //Send each command in the array to the LCD controller
    while (counter--)
    {
        if (!sendCommandSSD1803A(*bytePointer)) return 0x00000000;  //Try sending the command to the LCD controller, returning if it fails
        bytePointer++;                                              //Increment the address of bytePointer by 1
    }

    counter = 0x00000003 + (lines & 0x00000001);  //Set the counter to 3 or 4 depending if Bit-0 of the lines argument is set
    bytePointer = SSD1803A_Init + 0x00000008;     //Copy the address of the 11th index in the SSD1803A_Init array into bytePointer

    //Send each command in the array to the LCD controller
    while (counter--)
    {
        if (!sendCommandSSD1803A(*bytePointer)) return 0x00000000;  //Try sending the command to the LCD controller, returning if it fails
        bytePointer++;                                              //Increment the address of bytePointer by 1
    }

    statusRegister_SSD1803A &= 0xFFFFFFFFE;  //Update the driver status register to match
    return 0xFFFFFFFF;                       //Return with all bits set to indicate the initialization procedure succeeded
}



/***************************
 *  Interaction Functions  *
 ***************************/

//Clear Display Function, clears the contents of the display and returns the cursor to home
uint32_t clearDisplaySSD1803A()
{
    const uint8_t clearCommand = 0x01;  //Create a constant in flash for the clear display byte to live in

    return sendBytesToSSD1803A(0x000000C0, &clearCommand, 0x00000001);  //Send the Clear Display command to the chipset returning true on success
}

//Return Home Function, returns the cursor to home position on the display
uint32_t returnHomeSSD1803A()
{
    if (!functionSetSSD1803A((SSD1803A_registers_t) statusRegister_SSD1803A & 0x00000001)) return 0x00000000;  //Try selecting the regular register set on LCD controller

    const uint8_t homeCommand = 0x02;  //Create a constant in flash for the home byte to live in
    
    return sendBytesToSSD1803A(0x000000C0, &homeCommand, 0x0000001);  //Send the Return Home command to the chipset returning true on success
}

//Put Cursor Function, changes the DDRAM address that the cursor is placed at on the LCD display
uint32_t putCursorSSD1803A(uint32_t newCursorPosition)
{
    if (!functionSetSSD1803A((SSD1803A_registers_t) statusRegister_SSD1803A & 0x00000001)) return 0x00000000;  //Try selecting the regular register set on the LCD controller

    newCursorPosition = (newCursorPosition & 0x0000007F) | 0x00000080;  //Format the requested cursor position into the proper command format for the LCD controller

    return sendBytesToSSD1803A(0x000000C0, (uint8_t *) &newCursorPosition, 0x00000001);  //Send the Set DDRAM Address command to the chipset returning true on success
}

//Set Scroll Offset Function, sets the amount of pixels/characters to shift the display contents over by
uint32_t setScrollOffsetSSD1803A(uint8_t newScrollAmount)
{
    if (!functionSetSSD1803A(RE_1_IS_0)) return 0x00000000;  //Try selecting the extended register set on the LCD controller

    newScrollAmount = (newScrollAmount & 0x0000003F) | 0x00000080;  //Format the requested scroll amount into the proper command format for the LCD controller

    return sendBytesToSSD1803A(0x000000C0, &newScrollAmount, 0x00000001);  //Send the command to the chipset returning true on success
}

//Set Line Count Function, configures how the LCD controller is to arrange the lines on the display
uint32_t setLineCountSSD1803A(SSD1803A_lineCount_t lines)
{
    if (!functionSetSSD1803A(RE_1_IS_0)) return 0x00000000;  //Try putting the LCD controller into the extended register mode

    uint8_t commandByte = ((statusRegister_SSD1803A & 0x000000C0) >> 0x00000006) | (lines & 0x0000001C);            //Calculate the correct bits to send for the Double Height command
    if (!sendBytesToSSD1803A(0x000000C0, &commandByte, 0x00000001)) return 0x00000000;                              //Try to sending the command, exiting if it fails
    statusRegister_SSD1803A = (statusRegister_SSD1803A & 0xFFFFFCFB) | ((commandByte & 0x0000000C) << 0x00000006);  //Update the driver status register to match

    commandByte = statusRegister_SSD1803A & 0x00000004;             //Get the current state of the DH bit before modifying it in the status register
    if (lines & 0x00000001) statusRegister_SSD1803A |= 0x00000004;  //Set the DH bit if the selected line count setting requires it
    if (functionSetSSD1803A(RE_0_IS_1)) return 0xFFFFFFFF;          //Update the LCD controller with the new value of the DH bit

    statusRegister_SSD1803A = statusRegister_SSD1803A & 0xFFFFFFFB | commandByte;  //Write the value of the old DH bit to the status register being that the attempt to change it failed
    return 0x00000000;                                                             //Return a value of 0 indicating that the operation failed
}

//Set Contrast Function, sets the contrast of the LCD display to the desired value
uint32_t setContrastSSD1803A(uint8_t newContrast)
{
    if (!functionSetSSD1803A(RE_0_IS_1)) return 0x00000000;  //Try selecting the special instruction registers on the LCD controller

    uint8_t contrastCommands[0x00000002];                                     //Create a 2 byte array for holding the contrast commands to be send to the controller
    contrastCommands[0x00000000] = (newContrast & 0x0000000F) | 0x00000070;   //Generate a Power Control command containing the LSB of the requested contrast settings
    contrastCommands[0x00000001] = (newContrast >> 0x00000004) | 0x00000054;  //Generate a Contrast Set command containing the MSB of the requested contrast value

    return sendBytesToSSD1803A(0x000000C0, contrastCommands, 0x00000002);  //Attempt to send the commands to the chipset returning true on success
//    if (!sendCommandSSD1803A((newContrast & 0x0000000F) | 0x00000070)) return 0x00000000;   //Send the LSB of the requested contrast setting to the controller
//    if (!sendCommandSSD1803A((newContrast >> 0x00000004) | 0x00000054)) return 0x00000000;  //Send the MSB of the requested contrast setting to the controller
}

//Set Display Mode Function, sets the desired operating mode of the LCD display
uint32_t setDisplayModeSSD1803A(SSD1803A_displayMode_t newMode)
{
    if (!functionSetSSD1803A(RE_0_IS_0)) return 0x00000000;  //Try selecting the regular register set on LCD controller

    uint8_t displayModeCommands[0x00000002];    //Create a 2 byte array for holding the display mode commands to be sent to the controller
    displayModeCommands[0x00000000] = newMode;  //Generate a Display On/Off command with the requested mode settings

    //Determine whether or not to put the controller in low power mode
    if (newMode & 0x00000004)
    {
        displayModeCommands[0x00000001] = 0x02;  //Generate a Power Down Mode command with low-power mode disabled when the display is requested to be on
    }
    else
    {
        displayModeCommands[0x00000001] = 0x03;  //Generate a Power Down Mode command with low-power mode enabled when the display is requested to be off
    }

    return sendBytesToSSD1803A(0x000000C0, displayModeCommands, 0x00000002);  //Attempt to send the commands to the chipset, returning true on success
//    return sendCommandSSD1803A((newMode & 0x00000004) ? 0x00000002 : 0x00000003);  //Place the controller chipset into low-power mode when the desired mode is DISPLAY_OFF
//    if (!sendCommandSSD1803A((newMode & 0x00000004 ^ 0x0000000C) >> 0x00000002)) return 0x00000000;  //Change the power-down bit of the controller to match the newly requested mode
//    return sendCommandSSD1803A(newMode);                                                             //Attempt to put the controller into the newly requested mode
}






/***********************
 *  Utility Functions  *
 ***********************/

//           8           6          4          2         0
//    UD2 | UD1 | BS1 | DH` | BE | BS0 | REV | DH | RE | IS

//Function Set Function, selects what function registers the LCD controller is to respond to
uint32_t functionSetSSD1803A(SSD1803A_registers_t registerSelect)
{
    //Don't do anything if the controller already has the desired register set selected
    if (((statusRegister_SSD1803A & 0x00000001) ^ (registerSelect & 0x00000003)) && (statusRegister_SSD1803A & 0x00000002))
    {
        uint8_t commandByte = ((statusRegister_SSD1803A & 0x00000028) >> 0x00000003) | 0x00000038;  //Calculate the first expected output command and store it in a new buffer

        //Determine if we need to leave the extended register selection first when the requested IS bit is different from it's current state on the LCD controller
        // if ((statusRegister_SSD1803A & 0x00000002) == 0x00000002 && (statusRegister_SSD1803A & 0x00000001 ^ specialRegisters) == 0x00000000)
        if (((statusRegister_SSD1803A & 0x00000003) ^ (registerSelect & 0x00000001)) ^ 0x00000002)
        {
            if (!sendBytesToSSD1803A(0x000000C0, &commandByte, 0x00000001)) return 0x00000000;  //Try to take the LCD controller out of the extended registers
            statusRegister_SSD1803A &= 0xFFFFFFFD;                                              //Clear the RE bit in the driver status register to match
        }

        //Determine how to handle this based on the requested changes based on the current state of the LCD controller
        if (statusRegister_SSD1803A & 0x00000002)
        {
            commandByte = (registerSelect & 0x00000002) | commandByte;                                         //Form the correct command byte to send to the LCD controller
            if (!sendBytesToSSD1803A(0x000000C0, &commandByte, 0x00000001)) return 0x00000000;                 //Attempt to select the desired registers on the LCD controller chipset
            statusRegister_SSD1803A = (statusRegister_SSD1803A & 0xFFFFFFFD) | (registerSelect & 0x00000002);  //Update the RE bit of the drivers status register to match the new value
        }
        else
        {
            commandByte = (statusRegister_SSD1803A & 0x00000004) | registerSelect | 0x00000038;  //Form the correct command byte to send to the LCD controller
            if (!sendBytesToSSD1803A(0x000000C0, &commandByte, 0x00000001)) return 0x00000000;   //Try sending the command to the LCD controller
            statusRegister_SSD1803A = statusRegister_SSD1803A & 0xFFFFFFFC | registerSelect;     //Update the RE and IS bits of the drivers status register to match the new values
        }
    }

    return 0xFFFFFFFF;  //Return a value of true to indicate that operation completed successfully
}

//Send Command Function, sends the desired command byte to the LCD controller through the I2C interface
uint32_t sendCommandSSD1803A(uint8_t command)
{
    uint8_t outputBytes[0x00000002];    //Create a 2 byte long array to use for creating the sequence of bytes to send to the LCD controller
    outputBytes[0x00000000] = 0xFF;     //Set the first byte of the sequence to 0, this indicates the next byte will be an instruction
    outputBytes[0x00000001] = command;  //Copy the desired command byte into the sequence

    while (outputBytes[0x00000000]--);
    *outputBytes = 0x00;

    return writeToI2C(SSD1803A_I2C_ADDR, outputBytes, 0x00000002);  //Try and send the byte sequence to the LCD controller and return the result
}

//Print String Function, prints the provided string to the LCD display
uint32_t printStringSSD1803A(uint8_t *string, uint32_t length)
{
    uint8_t outputBytes[0x00000002];           //Create a 2 byte long array to use for creating the sequence of bytes to send to the LCD controller
    uint8_t *byte = outputBytes + 0x00000001;  //Declare a pointer to the second byte in the outputBytes array
    *outputBytes = 0xC0;                       //Set the first byte of the sequence to 0, this indicates the next byte will be an instruction

    //Write each character from the provided string into the DDRAM on the LCD controller
    while (length--)
    {
        *byte = *string;  //Copy the next character from the provided string into the location of the byte pointer
        string++;         //Increment the address of the string pointer by 1

        if (!writeToI2C(SSD1803A_I2C_ADDR, outputBytes, 0x00000002)) return 0x00000000;  //Send the character to the controller
    }

    return 0xFFFFFFFF;  //Return a value of true to indicate the operation completed successfully
}

//Send Bytes To Function, sends the contents of dataBytes to the LCD controller as either commands or raw data as specified
uint32_t sendBytesToSSD1803A(uint32_t isCommand, const uint8_t* dataBytes, uint32_t bufferLength)
{
    uint8_t outputBytes[0x00000002];           //Create a 2 byte long array to use for creating the sequence of bytes to send to the LCD controller
    uint8_t *byte = outputBytes + 0x00000001;  //Declare a pointer to the second byte in the outputBytes array

    //Load the first byte with the appropriate value depending on if the data being sent is commands
    if (isCommand)
    {
        *outputBytes = 0xC0;  //Set the first byte of the output array to 0xC0, indicates that the byte immediately following shall be interpreted as a command
    }
    else
    {
        *outputBytes = 0x00;  //Set the first byte of the output array to 0, indicating that the byte immediately following shall be interpreted as normal data
    }

    //Write each index of dataBytes to the LCD controller
    while (bufferLength--)
    {
        *byte = *dataBytes;  //Copy the contents of the next element in dataBytes into the location provided by the byte pointer
        dataBytes++;         //Increment the address of the dataBytes pointer by 1 element

        if (!writeToI2C(SSD1803A_I2C_ADDR, outputBytes, 0x00000002)) return 0x00000000;  //Send the next byte to the controller chipset
    }

    return 0xFFFFFFFF;  //Return a value of true to indicate the operation completed successfully
}

//Print String Function, prints the provided string to the LCD display
//uint32_t printStringSSD1803A(uint8_t *string, uint32_t length)
//{
////    uint32_t index = 0x00000001;                 //Declare a new variable to use for tracking the length of the created array
//    uint8_t outputBytes[0x00000074];               //Create a buffer to use for forming the data stream to send to the controller
//    uint8_t *bytePointer = outputBytes;            //Create a pointer to the output
//    if (length > 0x00000074) length = 0x00000074;  //Enforce a strict buffer length to prevent memory overflows from occurring
//
//    *outputBytes = 0x40;  //Start the output sequence with 0x80 to instruct the chipset to load the following information into DDRAM
//
//    //Copy all the characters in the provided string into the output buffer
//    while (length--)
//    {
//        bytePointer++;             //Increment the address of bytePointer
//        *bytePointer = *string;  //Copy the next character from the provided string into the next memory location given by bytePointer
//        string++;                //Increment the address of the string pointer
//    }
//
//    return writeToI2C(SSD1803A_I2C_ADDR, outputBytes, bytePointer - outputBytes);  //Try to send the byte sequence to the LCD controller and return the result
//}






//END OF FILE