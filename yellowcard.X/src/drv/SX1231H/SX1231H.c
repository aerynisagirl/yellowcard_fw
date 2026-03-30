/***********************************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kits                       *
 * ------------------------------------------------------------------------------------------- *
 *  SX1231H.c - Contains all functions related to interacting with the SX1231H transceiver IC  *
 ***********************************************************************************************/

#include "SX1231H.h"



/***************
 *  Variables  *
 ***************/

//Configuration Settings
const uint8_t SX1231H_Init[] = {
                                0x80,  //RegLna
                                0x4C,  //RegRxBw
                                0x40,  //RegDioMapping1
                                0x07,  //RegDioMapping2
                                0x00,  //RegPreambleMsb
                                0x07,  //RegPreambleLsb
                                0xA8,  //RegSyncConfig
                                0x59,  //RegSyncValue1
                                0x45,  //RegSyncValue2
                                0x4C,  //RegSyncValue3
                                0x4C,  //RegSyncValue4
                                0x4F,  //RegSyncValue5
                                0x57,  //RegSyncValue6
                                0x00,  //RegSyncValue7
                                0x00,  //RegSyncValue8
                                0x80,  //RegPacketConfig1
                                0x40,  //RegPayloadLength
                                0x00,  //RegNodeAdrs
                                0x00,  //RegBroadcastAdrs
                                0x00,  //RegAutoModes      (0x3B)
                                0x8F,  //RegFifoThresh
                                0x02,  //RegPacketConfig2
                                0x2D   //RegTestLna
                               };



/******************************
 *  Initialization Functions  *
 ******************************/

//Initialize Function, configures the transceiver IC to operate as required for the application
void initializeSX1231H(SX1231H_modScheme_t modulation)
{
    uint8_t configBytes[0x00000002];  //Create an array of bytes to use for writing the desired configuration settings to the transceiver IC
    
    //Common configuration registers
    configBytes[0x00000000] = 0x04;        //Put the transceiver into SLEEP mode by default
    configBytes[0x00000001] = modulation;  //Set the desired modulation scheme

    interactWithRegistersSX1231H(0x00000001, configBytes, 0x00000002, 0x00000000);  //Send the configuration bytes to the transceiver IC with a starting address of 0x01 (RegOpMode)

    //Radio receiver registers
    interactWithRegistersSX1231H(0x00000018, (uint8_t *) SX1231H_Init, 0x00000002, 0x00000000);  //Send the configuration bytes to the transceiver IC with a starting address of 0x18

    //Pin mapping registers
    interactWithRegistersSX1231H(0x00000025, (uint8_t *) SX1231H_Init + 0x00000002, 0x00000002, 0x00000000);  //Send the configuration bytes to the transceiver IC with a starting address of 0x25

    //Packet engine registers
    interactWithRegistersSX1231H(0x0000002C, (uint8_t *) SX1231H_Init + 0x00000004, 0x00000012, 0x00000000);  //Send the configuration bytes to the transceiver IC with a starting address of 0x2C

    //Test registers
//    interactWithRegistersSX1231H(0x00000058, (uint8_t *) SX1231H_Init + 0x00000016, 0x00000001, 0x00000000);  //Send the configuration bytes to the transceiver IC with a starting address of 0x58
}



/**************************
 *  Transceiver Commands  *
 **************************/


//Write Packet Function, writes the desired packet to the FIFO buffer on the transceiver IC
void writePacketSX1231H(const uint8_t *payloadBytes, uint32_t payloadLength)
{
    uint8_t formedFrame[0x00000101];     //Create a temporary buffer with the max number of bytes a frame can have
    uint8_t *framePtr = formedFrame;     //Make a pointer to use for iterating through the addresses in the array above
    uint32_t frameSize = payloadLength;  //Declare a variable to use for calculating the total size of the frame

    //Add every byte of the payload to the frame buffer
    while (payloadLength--)
    {
        *(framePtr++) = *(payloadBytes++);  //Copy the next byte from the payloadBytes array into the frame buffer
    }

    interactWithRegistersSX1231H(REGADDR_FIFO, formedFrame, frameSize, 0x00000000);  //Write the packet frame to the FIFO buffer of the transceiver
}



/*****************************************
 *  Transceiver Configuration Functions  *
 *****************************************/

//Set Carrier Frequency Function, sets the RF transceiver to tune to the desired carrier frequency
void setCarrierFreqSX1231H(uint32_t freqRF)
{
    float calculatedFrequency = (float) freqRF / SX1231H_F_STEP;  //Calculate the value of Frf to provide the transceiver IC to achieve the desired carrier frequency
    uint32_t regFrfValue = calculatedFrequency;                   //Force cast the calculated value into an unsigned 32-bit integer to make byte separation easier

    uint8_t registerValues[0x00000003];  //Create an array of 3 bytes to use for splitting the contents of the register value across

    registerValues[0x00000002] = regFrfValue & 0x000000FF;  //Write the first 8 bits of regFrfValue into the 3rd element of the registerValues array
    regFrfValue >>= 0x00000008;                             //Shift the contents of regFrfValue to the right by 8 bits
    registerValues[0x00000001] = regFrfValue & 0x000000FF;  //Write the next 8 bits of regFrfValue into the 2nd element of the registerValues array
    regFrfValue >>= 0x00000008;                             //Shift the contents of regFrfValue to the right by 8 bits
    registerValues[0x00000000] = regFrfValue & 0x000000FF;  //Write the final 8 bits of the regFrfValue variable into the first index of the array

    interactWithRegistersSX1231H(REGADDR_FRF_MSB, registerValues, 0x00000003, 0x00000000);  //Send the configuration bytes to the transceiver IC
}

//Set Frequency Deviation Function, sets the FSK (de)modulator frequency deviation
void setFreqDeviationSX1231H(uint32_t freqDev)
{
    float calculatedDeviation = (float) freqDev / SX1231H_F_STEP;  //Calculate the value of Fdev to provide to the transceiver to achieve the desired frequency deviation in FSK mode
    uint16_t regFdevValue = calculatedDeviation;                   //Force cast the calculated value into an unsigned 16-bit integer to make byte separation easier

    uint8_t registerValues[0x00000002];  //Create an array of 2 bytes to use for splitting the contents of the register value across

    registerValues[0x00000001] = regFdevValue & 0x000000FF;  //Write the first 8 bits of regFdevValue into the 2nd element of the registerValues array
    regFdevValue >>= 0x00000008;                             //Shift the contents of regFdevValue to the right by 8 bits
    registerValues[0x00000000] = regFdevValue & 0x000000FF;  //Write the final 8 bits of the regFdev variable into the first index of the array

    interactWithRegistersSX1231H(REGADDR_FDEV_MSB, registerValues, 0x00000002, 0x00000000);  //Send the configuration bytes to the transceiver IC
}

//Set Bit-Rate Function, sets the data (de)modulator to operate at the desired bit-rate
void setBitRateSX1231H(uint32_t bitRate)
{
    bitRate = SX1231H_F_XOSC / bitRate;  //Calculate the value to be written to the bit-rate registers in order to achieve the desired bit-rate

    uint8_t registerValues[0x00000002];  //Create an array of 2 bytes to use for splitting the contents of the register value across

    registerValues[0x00000001] = bitRate & 0x000000FF;  //Write the first 8-bits of the calculated bit-rate value into the 2nd element of the registerValues array
    bitRate >>= 0x00000008;                             //Shift the contents of the bitRate variable to the right by 8 bits
    registerValues[0x00000000] = bitRate & 0x000000FF;  //Write the remaining 8 bits of the calculated bit-rate value into the first index of the array

    interactWithRegistersSX1231H(REGADDR_BITRATE_MSB, registerValues, 0x00000002, 0x00000000);  //Send the configuration bytes to the transceiver IC
}

//Set Device Mode Function, puts the transceiver into the desired operating mode
void setDeviceModeSX1231H(SX1231H_deviceMode_t newMode)
{
    if (newMode >= MODE_RESERVED) return;  //Just leave if trying to set the mode of the transceiver to something invalid

    uint8_t registerValue = newMode << 0x00000002;                                         //Write the value of the newMode enum to the registerValue variable and shift it to the left by 2 bits
    interactWithRegistersSX1231H(REGADDR_OPMODE, &registerValue, 0x00000001, 0x00000000);  //Send the configuration byte to the transceiver IC
}

//Set Power Level Function, sets the TX output power strength
void setPowerLevelSX1231H(uint32_t txPower)
{
    uint8_t paLevel = 0x00;               //Create a buffer variable to use for storing the value that will be written to RegPaLevel
    uint8_t overcurrentRegister = 0x19;   //Create another buffer for storing the value to be written to the overcurrent settings register
    uint8_t pa1HighPowerRegister = 0x55;  //Make a buffer for the high power settings register of PA1, defaulting to disabling high power mode
    uint8_t pa2HighPowerRegister = 0x70;  //Make a buffer for the high power settings register of PA2, defaulting to disabling high power mode

    if (txPower > 0x00000017) txPower = 0x00000017;  //Force any value of txPower greater than 0x17 back to 0x17 to prevent the offsets from messing up

    if (txPower >= 0x000000008)
    {
        paLevel = 0x68 + txPower;  //Enable both PA1 and PA2 when operating in high power mode, setting the output level as requested

        pa1HighPowerRegister = 0x5D;  //Put PA1 into high power mode
        pa2HighPowerRegister = 0x7C;  //Put PA2 into high power mode
    }
    else if (txPower >= 0x00000005)
    {
        paLevel = 0x6B + txPower;  //Enable both PA1 and PA2, setting the output accordingly
    }
    else if (txPower)
    {
        paLevel = 0x4F + txPower;  //Enable PA1, and set the output level accordingly
    }

    interactWithRegistersSX1231H(REGADDR_PALEVEL, &paLevel, 0x00000001, 0x00000000);               //Write the value of paLevel to the RegPaLevel register on the transceiver IC
    interactWithRegistersSX1231H(REGADDR_OCP, &overcurrentRegister, 0x00000001, 0x00000000);       //Write the value of overcurrentRegister to the RegOcp register on the transceiver IC
    interactWithRegistersSX1231H(REGADDR_TESTPA1, &pa1HighPowerRegister, 0x00000001, 0x00000000);  //Write the value of pa1HighPowerRegister to the RegTestPa1 register on the transceiver IC
    interactWithRegistersSX1231H(REGADDR_TESTPA2, &pa2HighPowerRegister, 0x00000001, 0x00000000);  //Write the value of pa2HighPowerRegister to the RegTestPa2 register on the transceiver IC
}

//Set DIO Mappings Function, changes the functionality of the DIO pins on the transceiver IC
void setDIOMappingsSX1231H(uint32_t newMappings)
{
    uint8_t registerValues[0x00000002];  //Create a 2 byte array to use for forming the data bytes to send to the transceiver

    registerValues[0x00000000] = (newMappings >> 0x00000002) & 0x000000FF;               //Bits 2 through 10 of newMappings are to make up the contents of the first data byte
    registerValues[0x00000001] = (newMappings << 0x00000004) & 0x000000C0 | 0x00000007;  //Bits 0 through 1 of newMappings combined with 0x07 make up the second data byte

    interactWithRegistersSX1231H(REGADDR_DIOMAPPING1, registerValues, 0x00000002, 0x00000000);  //Write the 2 bytes to the transceiver IC starting at the DioMapping1 register
}

//Set Auto Mode Function, programs the desired auto-mode into the RF transceiver
void setAutoModeSX1231H(SX1231H_autoCondition_t enter, SX1231H_autoCondition_t exit, SX1231H_autoMode_t mode)
{
    enter = (enter & 0x00000007) << 0x00000005;  //Mask out the 3 least significant bits of the provided enter value, then shift them left by 5 bits
    exit = (exit & 0x00000007) << 0x00000002;    //Mask out the 3 least significant bits of the provided exit value, then shift them left by 2 bits

    uint8_t registerValue = (mode & 0x00000003) | enter | exit;                               //Generate the appropriate command to send to the transceiver IC for the requested auto mode
    interactWithRegistersSX1231H(REGADDR_AUTOMODES, &registerValue, 0x00000001, 0x00000000);  //Send the configuration byte to the transceiver IC
}



/******************************
 *  Status Request Functions  *
 ******************************/

//Get Device Mode Function, returns the current mode that the transceiver is operating in
SX1231H_deviceMode_t getDeviceModeSX1231H()
{
    uint8_t registerValue = 0x00;                                                          //Create a buffer variable to use for storing the read byte
    interactWithRegistersSX1231H(REGADDR_OPMODE, &registerValue, 0x00000001, 0xFFFFFFFF);  //Read the contents of the RegOpMode register from the transceiver

    registerValue = (registerValue & 0x1C) >> 0x00000002;  //Mask out the bits that set the transceivers mode and shift them over to the right by 2 bits
    if (registerValue >= 0x05) registerValue = 0x05;       //Force the mode number to 0x05 if it's set to any number thats classified as Reserved as per the datasheet

    return (SX1231H_deviceMode_t) registerValue;  //Cast the integer to the opModeSX1231_t type and return the enum
}

//Get RSSI Function, returns the last measured RSSI value in dBm
float getRssiSX1231H()
{
    uint8_t registerValue = 0x00;                                                             //Create a buffer variable to use for storing the read byte
    interactWithRegistersSX1231H(REGADDR_RSSIVALUE, &registerValue, 0x00000001, 0xFFFFFFFF);  //Read the contents of the RegRssiValue register from the transceiver

    float calculatedRSSI = (float) registerValue;  //Convert the obtained value into a float and store it in a buffer
    return calculatedRSSI / -2.0F;                 //Return the calculated RSSI value in dBm
}



/*****************************************
 *  Transceiver Data Exchange Functions  *
 *****************************************/

//Interact With Registers Functions, reads/writes to the registers in the transceiver at the given start address using/into dataBytes 
void interactWithRegistersSX1231H(uint32_t startAddress, uint8_t *dataBytes, uint32_t bufferLength, uint32_t readMode)
{
    while (SPI1CON & 0x00000800);  //Wait until the SPI1 peripheral is in idle mode before starting the data transaction

    startAddress |= 0x00000080;                //Force-set Bit-7 of the startAddress variable to indicate the assumed write operation
    if (readMode) startAddress &= 0x0000007F;  //Clear Bit-7 of startAddress when the readMode parameter is not 0

    LATBCLR = 0x00001000;    //Clear RB12 to pull the SS line down to logic LOW
    SPI1BUF = startAddress;  //Begin the transaction by writing the contents of the startAddress variable to the data buffer of SPI2

    while (SPI1STAT & 0x00000800);  //Wait until the SPI2 peripheral is no longer busy before continuing
    SPI1BUF;                        //Read from the SPI2 peripherals input buffer to clear it
    SPI1STATCLR = 0x00000040;       //Clear the Read Buffer Overflow flag in the SPI1 status register

    //Perform the data exchange for the size of the provided buffer
    while (bufferLength--)
    {
        //Determine what data to send based on what operation is being performed
        if (readMode)
        {
            SPI1BUF = 0x00;  //Send a series of blank of 0's when performing a read operation
        }
        else
        {
            SPI1BUF = *(dataBytes++);  //Transmit the value stored at the address given by the dataBytes pointer, incrementing the pointer address by 1 afterwards
        }

        while (SPI1STAT & 0x00000800);  //Wait until the SPI1 peripheral is no longer busy before continuing

        //Collect the obtained data byte when in read mode from the SPI1 peripheral, ignoring the first byte in the sequence
        if (readMode)
        {
            *(dataBytes++) = (SPI1BUF & 0x000000FF);  //Write the contents of the SPI1 receive buffer into the address specified by the dataBytes pointer
        }
        else
        {
            SPI1BUF;  //Clear the SPI1 receive buffer and its associated flags by reading from the SPI1BUF register
        }
    }

    LATBSET = 0x00001000;  //Clear RB12 to bring the SS line back up to its idle state of logic HIGH
}






//END OF FILE