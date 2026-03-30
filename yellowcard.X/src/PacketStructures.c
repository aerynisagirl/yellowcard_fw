/*************************************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit                          *
 * --------------------------------------------------------------------------------------------- *
 *  PacketStructures.c - Anything related to packet data structure translation an be found here  *
 *************************************************************************************************/

#include "PacketStructures.h"



/**********************
 *  Global Variables  *
 **********************/

volatile uint16_t globalFrameCount = 0x0000;  //Create a 16-bit unsigned variable to use for the global frame counter, this increments every time a packet is created



/***********************
 *  Packet Generation  *
 ***********************/

//Generate Header Function, creates a new packet header to use for constructing a full packet
void generateHeader(packetHeader_t *header, packetPayloadType_t packetType, uint8_t packetLength)
{
    header->length = packetLength;                                       //Set the length of the packet to provided length value
    header->sourceAddress = configNodeID;                                //Put the applications configured node ID value into the appropriate field in the header
    header->payloadType = (uint8_t) packetType;                          //Set the type field of the header to the given payload type value
    header->frameNumberMSB = (globalFrameCount & 0xFF00) >> 0x00000008;  //Mask out the upper byte of the globalFrameCount variable, and write that byte to frameNumberMSB in the header
    header->frameNumberLSB = globalFrameCount++ & 0x00FF;                //Put the lower byte of globalFrameCount into frameNumberLSB, incrementing the contents of globalFrameCount by 1

    if (!globalFrameCount) globalFrameCount = 0x0000;  //Reset the value of globalFrameCount to 1 upon rollover, 0 is exclusively used for the very first packet on power up
}

//New Acknowledge Packet Function, generates a new acknowledge packet for this address
void newAcknowledgePacket(packetAcknowledge_t *packetBuffer)
{
    generateHeader(&packetBuffer->packetHeader, ACKNOWLEDGE, PACKET_LENGTH_ACKNOWLEDGE);  //Generate a new packet header for the ACKNOWLEDGE type
}

//New Event Packet Function, generates a new event packet at the provided address
void newEventPacket(packetEvent_t *packetBuffer, packetEventType_t eventType, uint8_t argument)
{
    generateHeader(&packetBuffer->packetHeader, EVENT, PACKET_LENGTH_EVENT);  //Generate a new packet header for the EVENT type

    packetBuffer->eventType = eventType;   //Set the event type of the packet to the provided value
    packetBuffer->auxArgument = argument;  //Set the auxArgument value of the packet to the argument provided
}

//New Measure Report Packet Function, generates a new measurement report packet at the provided address
void newMeasureReportPacket(packetMeasureReport_t *packetBuffer, const float *temperature, const float *humidity, const float *pressure)
{
    generateHeader(&packetBuffer->packetHeader, MEASURE_REPORT, PACKET_LENGTH_MEASUREREPORT);  //Generate a new packet header for the MEASURE_REPORT type
    
    //Prepare the data to use in the payload
    uint32_t dataBuffer;  //Create a temporary 32-bit unsigned variable to use for data manipulation while constructing the payload

    //Put the temperature value into the payload
    dataBuffer = (int32_t) (*temperature * 100.0F);
    packetBuffer->reportedTempLSB = dataBuffer & 0x000000FF;  //Store the first byte of dataBuffer in the reportedTempLSB part of the packet
    dataBuffer >>= 0x00000008;                                //Shift the contents of dataBuffer over to the right by 8 bits
    packetBuffer->reportedTempMSB = dataBuffer & 0x000000FF;  //Write the remaining byte of dataBuffer into the reportedTempMSB portion of the packet

    //Put the relative humidity value into the payload
    dataBuffer = (uint32_t) *humidity;
    packetBuffer->reportedRH = dataBuffer;  //Copy the contents of dataBuffer into the reportedRH part of the packet

    //Put the barometric pressure value into the payload
    dataBuffer = (uint32_t) *pressure;
    packetBuffer->reportedPresLSB = dataBuffer & 0x000000FF;  //Store the first byte of dataBuffer in the reportedPresLSB part of the packet
    dataBuffer >>= 0x00000008;                                //Shift the contents of dataBuffer over to the right by 8 bits
    packetBuffer->reportedPresMSB = dataBuffer & 0x000000FF;  //Write the second byte of dataBuffer into the reportedPresMSB portion of the packet
    dataBuffer >>= 0x00000008;                                //Shift the contents of dataBuffer over to the right by 8 bits
    packetBuffer->reportedPresHSB = dataBuffer & 0x000000FF;  //Write the third byte of dataBuffer into the reportedPresHSB portion of the packed
}



/********************
 *  Packet Parsing  *
 ********************/


//Get Measurements From Measure Report Packet Function, extracts the measurement data from the provided packet into the provided pointers
void getMeasurementsFromMeasureReportPacket(const packetMeasureReport_t *packetBuffer, float *temperature, float *humidity, float *pressure)
{
    uint32_t dataBuffer = 0x00000000;  //Create a temporary 32-bit signed variable to use for data manipulation while parsing the payload

    //Extract the temperature value from the payload
    dataBuffer = (packetBuffer->reportedTempMSB << 0x00000008) | packetBuffer->reportedTempLSB;  //Combine both the reported MSB and LSB temperature bytes into a single 32-bit value
    *temperature = (float) ((int16_t) dataBuffer) / 100.0F;                                                  //Write the obtained temperature value into the provided pointer, dividing the value by 100

    //Extract the humidity from the payload
    *humidity = packetBuffer->reportedRH;  //Copy the reported relative humidity into the provided pointer that represents the humidity value

    //Extract the barometric pressure value into the payload
    dataBuffer = packetBuffer->reportedPresHSB;   //Copy the HSB of the reported pressure value into the dataBuffer variable
    dataBuffer <<= 0x00000008;                    //Shift the contents of dataBuffer over to the left by 8 bits
    dataBuffer |= packetBuffer->reportedPresMSB;  //OR the contents of the reported pressure MSB into dataBuffer
    dataBuffer <<= 0x00000008;                    //Shift the contents of dataBuffer over to the left by 8 bits
    dataBuffer |= packetBuffer->reportedPresLSB;  //OR the final byte of the reported pressure into dataBuffer
    *pressure = dataBuffer;                       //Convert dataBuffer into a float and then write it into the provided barometric pressure pointer
}






//END OF FILE