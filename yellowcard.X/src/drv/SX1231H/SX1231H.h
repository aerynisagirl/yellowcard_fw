/*************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit  *
 * --------------------------------------------------------------------- *
 *  SX1231H.h - Driver for the SX1231H sub-1GHz radio                    *
 *************************************************************************/

#ifndef __SX1231H_H__
#define __SX1231H_H__

//Import any libraries used by this file
#include <xc.h>                //Include the primary header used by the XC32 compiler
#include "SX1231HRegisters.h"  //Include a list of handy register address definitons for the transceiver


//Define any enum types used in this file
typedef enum
{
    SLEEP, STBY, FS, TX, RX, MODE_RESERVED
} SX1231H_deviceMode_t;

typedef enum
{
    FSK_NOSHAPING = 0x00, FSK_F_BT10 = 0x01, FSK_F_BT05 = 0x02, FSK_F_BT03 = 0x03,
    OOK_NOSHAPING = 0x08, OOK_F_BR = 0x09, OOK_F_2BR = 0x0A, MOD_RESERVED = 0x0B
} SX1231H_modScheme_t;

typedef enum
{
    NONE, FIFO_NOT_EMPTY, FIFO_LEVEL, CRC_OK, PAYLOAD_READY, SYNC_ADDRESS, PACKET_SENT, TIMEOUT = 0x07
} SX1231H_autoCondition_t;

typedef enum
{
    INT_SLEEP, INT_STBY, INT_TX, INT_RX
} SX1231H_autoMode_t;


//Define any variables that are external to this file
extern const uint8_t SX1231H_Init[];  //Stores the default configuration to use during initialization of the transceiver IC


//Initialization Functions
extern void initializeSX1231H(SX1231H_modScheme_t modulation);  //Initialize Transceiver Function, configures the transceiver IC to operate as required for the application

//Interaction Functions
extern void writePacketSX1231H(const uint8_t *payloadBytes,  //Load Packet Function, writes the desired packet to the FIFO buffer on the transceiver IC
                               uint32_t payloadLength);

//Configuration Functions
extern void setCarrierFreqSX1231H(uint32_t freqRF);              //Set Carrier Frequency Function, sets the RF transceiver to tune to the desired carrier frequency
extern void setFreqDeviationSX1231H(uint32_t freqDev);           //Set Frequency Deviation Function, sets the FSK (de)modulator frequency deviation
extern void setBitRateSX1231H(uint32_t bitRate);                 //Set Bit-Rate Function, sets the data (de)modulator to operate at the desired bit-rate
extern void setDeviceModeSX1231H(SX1231H_deviceMode_t newMode);  //Set Device Mode Function, instructs the RF transceiver to enter the desired mode
extern void setAutoModeSX1231H(SX1231H_autoCondition_t enter,    //Set Auto Mode Function, programs the desired auto-mode into the RF transceiver
                               SX1231H_autoCondition_t exit,
                               SX1231H_autoMode_t mode);
extern void setPowerLevelSX1231H(uint32_t txPower);              //Set Power Level Function, sets the TX output power strength
extern void setDIOMappingsSX1231H(uint32_t newMappings);         //Set DIO Mappings Function, changes the functionality of the DIO pins on the transceiver IC

//Status Request Functions
extern SX1231H_deviceMode_t getDeviceModeSX1231H();  //Get Device Mode Function, returns the current mode that the transceiver is operating in
extern float getRssiSX1231H();                       //Get RSSI Function, returns the last measured RSSI value in dBm

//Transceiver Data Exchange Functions
extern void interactWithRegistersSX1231H(uint32_t startAddress,  //Interact With Registers Functions, reads/writes to the registers in the transceiver at the given start address using/into dataBytes
                                         uint8_t *dataBytes,
                                         uint32_t bufferLength,
                                         uint32_t readMode);


#endif






//END OF FILE