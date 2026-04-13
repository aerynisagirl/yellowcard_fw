/*********************************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit                      *
 * ----------------------------------------------------------------------------------------- *
 *  Logging.c - Contains all string constants and construction functions related to logging  *
 *********************************************************************************************/

#include "Logging.h"



/*********************
 *  Logging Strings  *
 *********************/

const uint8_t logConstants_measurementReport[] = "\n\n\n\nMeasurement\n  Temperature:   C\n     Humidity:   %\n     Pressure:   Pa\0";
const uint8_t logConstants_packet[] = "\n\nPacket\n   Length:  \n  Address:  \n     Type:  \n  Frame #:  \n      Raw: \0";
const uint8_t logConstants_rssi[] = "\n\nRadio\n  RSSI:   dBm\0";

const uint8_t logConstants_packetType_acknowledge[] = "ACKNOWLEDGE\0";
const uint8_t logConstants_packetType_event[] = "EVENT\0";
const uint8_t logConstants_packetType_measureReport[] = "MEASURE_REPORT\0";

const uint8_t *logConstants_packetTypeLookup[] = {logConstants_packetType_acknowledge,
                                                  logConstants_packetType_event,
                                                  logConstants_packetType_measureReport};

const uint8_t LOGSTRINGS_ARROW[] = " -> ";
const uint8_t LOGSTRINGS_THREADNAME_SENSOR[] = "Sensor Thread  :  \0";
const uint8_t LOGSTRINGS_THREADNAME_RADIO[] = "Radio Thread   :  \0";

const uint8_t LOGSTRINGS_THREADSTATES_SENSOR_SLEEP[] = "SLEEP\0";
const uint8_t LOGSTRINGS_THREADSTATES_SENSOR_STARTMEASUREMENTS[] = "START_MEASUREMENTS\0";
const uint8_t LOGSTRINGS_THREADSTATES_SENSOR_GETPRESSURE[] = "GET_PRESSURE\0";
const uint8_t LOGSTRINGS_THREADSTATES_SENSOR_GETTEMPERATURE[] = "GET_TEMPERATURE\0";
const uint8_t LOGSTRINGS_THREADSTATES_SENSOR_REPORTMEASUREMENTS[] = "REPORT_MEASUREMENTS\0";
const uint8_t LOGSTRINGS_THREADSTATES_SENSOR_MEASUREFAIL[] = "MEASURE_FAIL\0";

const uint8_t LOGSTRINGS_THREADSTATES_RADIO_SLEEP[] = "SLEEP\0";
const uint8_t LOGSTRINGS_THREADSTATES_RADIO_SLEEPTX[] = "SLEEP_TX\0";
const uint8_t LOGSTRINGS_THREADSTATES_RADIO_SLEEPRX[] = "SLEEP_RX\0";
const uint8_t LOGSTRINGS_THREADSTATES_RADIO_IDLE[] = "IDLE\0";
const uint8_t LOGSTRINGS_THREADSTATES_RADIO_PROCESSINTERRUPT[] = "PROCESS_INTERRUPT\0";
const uint8_t LOGSTRINGS_THREADSTATES_RADIO_STARTTX[] = "START_TX\0";
const uint8_t LOGSTRINGS_THREADSTATES_RADIO_STARTRX[] = "START_RX\0";
const uint8_t LOGSTRINGS_THREADSTATES_RADIO_TXDONE[] = "TX_DONE\0";
const uint8_t LOGSTRINGS_THREADSTATES_RADIO_RXDONE[] = "RX_DONE\0";
const uint8_t LOGSTRINGS_THREADSTATES_RADIO_RECEIVEPACKET[] = "RECEIVE_PACKET\0";
const uint8_t LOGSTRINGS_THREADSTATES_RADIO_RXTIMEOUT[] = "RX_TIMEOUT\0";

const uint8_t *LOGSTRINGS_THREADSTATES_SENSOR[] = {
                                                   LOGSTRINGS_THREADSTATES_SENSOR_SLEEP,
                                                   LOGSTRINGS_THREADSTATES_SENSOR_STARTMEASUREMENTS,
                                                   LOGSTRINGS_THREADSTATES_SENSOR_GETPRESSURE,
                                                   LOGSTRINGS_THREADSTATES_SENSOR_GETTEMPERATURE,
                                                   LOGSTRINGS_THREADSTATES_SENSOR_REPORTMEASUREMENTS,
                                                   LOGSTRINGS_THREADSTATES_SENSOR_MEASUREFAIL
                                                  };

const uint8_t *LOGSTRINGS_THREADSTATES_RADIO[] = {
                                                  LOGSTRINGS_THREADSTATES_RADIO_SLEEP,
                                                  LOGSTRINGS_THREADSTATES_RADIO_SLEEPTX,
                                                  LOGSTRINGS_THREADSTATES_RADIO_SLEEPRX,
                                                  LOGSTRINGS_THREADSTATES_RADIO_IDLE,
                                                  LOGSTRINGS_THREADSTATES_RADIO_PROCESSINTERRUPT,
                                                  LOGSTRINGS_THREADSTATES_RADIO_STARTTX,
                                                  LOGSTRINGS_THREADSTATES_RADIO_STARTRX,
                                                  LOGSTRINGS_THREADSTATES_RADIO_TXDONE,
                                                  LOGSTRINGS_THREADSTATES_RADIO_RXDONE,
                                                  LOGSTRINGS_THREADSTATES_RADIO_RECEIVEPACKET,
                                                  LOGSTRINGS_THREADSTATES_RADIO_RXTIMEOUT
                                                 };



/****************************
 *  Construction Functions  *
 ****************************/

//Construct Thread State Log Function, constructs a new string to log a thread state machine change
uint32_t constructThreadStateLog(uint8_t *stringBuffer, const uint8_t *threadName, const uint8_t *oldState, const uint8_t *newState)
{
    uint32_t stringLength;   //Create a new variable to use for tracking the length of the string being constructed
    uint32_t sectionLength;  //Declare another variable to use for storing the length of each section being appended to the string

    stringLength = strlen(threadName);               //Determine the length of the string for the threads name
    memcpy(stringBuffer, threadName, stringLength);  //Copy the thread name string into the string buffer

    sectionLength = strlen(oldState);                              //Get the length of the string for the next section
    memcpy(stringBuffer + stringLength, oldState, sectionLength);  //Append the string for the previous state onto the end of the string buffer
    stringLength += sectionLength;                                 //Recalculate the length of the string with the new section included

    memcpy(stringBuffer + stringLength, LOGSTRINGS_ARROW, 0x00000004);  //Append the arrow to the end of the string
    stringLength += 0x00000004;                                         //Recalculate the length of the string with the arrow ended

    sectionLength = strlen(newState);                              //Get the length of the string for the next section
    memcpy(stringBuffer + stringLength, newState, sectionLength);  //Append the string for the new state onto the end of the string buffer
    stringLength += sectionLength;                                 //Recalculate the length of the string with the new section included

    stringBuffer[stringLength++] = 0x0A;  //End the string with a new line character
    stringBuffer[stringLength++] = 0x00;  //Null terminate the string

    return stringLength;  //Leave the function returning the final length of the constructed string
}

//Construct Measurement Log Function, constructs a new string to log the provided measurement results
uint32_t constructMeasurementLog(uint8_t *stringBuffer, const float *temperature, const float *humidity, const float *pressure)
{
    int32_t dataBuffer;     //Reserve a new 32-bit variable in RAM to use for doing number manipulation while creating the measurement report
    uint32_t stringLength;  //Create a new variable to use for tracking the length of the string being constructed

    memcpy(stringBuffer, logConstants_measurementReport, 0x00000020);  //Copy the first part of the measurement report string into the string buffer
    stringLength = 0x00000020;                                         //Set the starting length of the string to 32 characters
    dataBuffer = (*temperature * 100.0F);                              //Multiply the most recent temperature measurement by 100, then store it in dataBuffer with no decimal

    //Handle scenarios where the value of dataBuffer is actually a negative
    if (dataBuffer < 0x00000000)
    {
        stringBuffer[stringLength++] = 0x2D;  //Add a minus character to the string buffer to indicate the negative number
        dataBuffer = -dataBuffer;             //Force the contents of dataBuffer back into the positives again
    }

    uintToDecString(dataBuffer / 0x00000064, stringBuffer + stringLength);  //Convert the whole number portion of the temperature into a string and put it into the string buffer
    stringLength = strlen(stringBuffer);                                    //Find the new length of the string with the whole number added into it
    dataBuffer %= 0x00000064;                                               //Modulo the contents of dataBuffer by 100, storing the result back into the dataBuffer variable

    //Only add the decimal point and digits when actually required, otherwise don't bother
    if (dataBuffer)
    {
        stringBuffer[stringLength++] = 0x2E;                                    //Place the decimal point right after the whole number portion
        uintToDecString(dataBuffer % 0x00000064, stringBuffer + stringLength);  //Convert the decimal portion of the temperature into a string and put it into the string buffer
        stringLength = strlen(stringBuffer);                                    //Find the new length of the string with the decimal places added into it
    }

    memcpy(stringBuffer + stringLength, logConstants_measurementReport + 0x00000020, 0x00000013);  //Load the next segment of the report string into the buffer
    stringLength += 0x00000013;                                                                    //Add the appropriate amount to stringLength to compensate for the added characters
    uintToDecString((uint32_t) *humidity, stringBuffer + stringLength);                            //Convert the measured RH into it's string equivalent and append it to the string buffer
    stringLength = strlen(stringBuffer);                                                           //Find the new length of the string with the humidity measurement added in

    memcpy(stringBuffer + stringLength, logConstants_measurementReport + 0x00000033, 0x00000013);  //Load the next segment of the report string into the buffer
    stringLength += 0x00000013;                                                                    //Add the appropriate amount to stringLength to compensate for the added characters
    uintToDecString((uint32_t) *pressure, stringBuffer + stringLength);                            //Convert the measured pressure into a string and append it to the string buffer
    stringLength = strlen(stringBuffer);                                                           //Find the new length of the string with the barometric pressure value added

    memcpy(stringBuffer + stringLength, logConstants_measurementReport + 0x00000046, 0x00000004);  //Add the final part of the report string into the buffer
    stringLength += 0x00000004;                                                                    //Add the appropriate amount to stringLength to compensate for the added characters

    return stringLength;  //Leave the function returning the final length of the constructed string
}

//Construct Packet Log Function, constructs a new string to log the provided packet bytes
uint32_t constructPacketLog(uint8_t *stringBuffer, const uint8_t *packetBytes)
{
    uint32_t stringLength;                          //Create a new variable to use for tracking the length of the string being constructed
    uint32_t counter = *packetBytes;                //Store the size of the provided packet locally in a new variable to use for later
    uint32_t dataBuffer = packetBytes[0x00000001];  //Reserve a new 32-bit variable in RAM to use for doing number manipulation while creating the log message

    memcpy(stringBuffer, logConstants_packet, 0x00000015);  //Copy the first part of the packet log string into the string buffer
    stringLength = 0x00000015;                              //Set the starting length of the string to 22 characters
    uintToDecString(counter, stringBuffer + stringLength);  //Put the decimal representation of the packet size
    stringLength = strlen(stringBuffer);                    //Find the new length of the string with the packet size added in

    memcpy(stringBuffer + stringLength, logConstants_packet + 0x00000015, 0x0000000D);  //Load the next segment of the log string into the buffer
    stringLength += 0x0000000D;                                                         //Add the appropriate amount to stringLength to compensate for the added characters
    uintToDecString(dataBuffer, stringBuffer + stringLength);                           //Convert the destination address value into it's decimal form and append it to the string buffer
    stringLength = strlen(stringBuffer);                                                //Find the new length of the string with the destination address added

    uint8_t *typeString = (uint8_t *) logConstants_packetTypeLookup[packetBytes[0x00000002]];  //Create a pointer that points to the string that represents the packet type
    memcpy(stringBuffer + stringLength, logConstants_packet + 0x00000022, 0x0000000D);         //Load the next segment of the log string into the buffer
    stringLength += 0x0000000D;                                                                //Add the appropriate amount to stringLength to compensate for the added characters
    memcpy(stringBuffer + stringLength, typeString, strlen(typeString) + 0x00000001);          //Copy the string constants that represents the packet type into the buffer
    stringLength = strlen(stringBuffer);                                                       //Find the new length of the string with the packet type added

    memcpy(stringBuffer + stringLength, logConstants_packet + 0x0000002F, 0x0000000D);  //Load the next segment of the log string into the buffer
    stringLength += 0x0000000D;                                                         //Add the appropriate amount to stringLength to compensate for the added characters
    dataBuffer = (packetBytes[0x00000003] << 0x00000008) | packetBytes[0x00000004];     //Combine the next 3 bytes of the packet to calculate the frame number of the packet
    uintToDecString(dataBuffer, stringBuffer + stringLength);                           //Convert the frame number into it's decimal form and append it to the string buffer
    stringLength = strlen(stringBuffer);                                                //Find the new length of the string with the frame number added

    memcpy(stringBuffer + stringLength, logConstants_packet + 0x0000003C, 0x0000000C);  //Load the next segment of the log string into the buffer
    stringLength += 0x0000000C;                                                         //Add the appropriate amount to stringLength to compensate for the added characters

    //Create a series of hexadecimal translations of the raw packet
    while (counter--)
    {
        stringBuffer[stringLength++] = 0x20;                             //Append a space just before the hexadecimal string
        byteToHexString(*(packetBytes++), stringBuffer + stringLength);  //Convert the next byte of the packet into it's string hexadecimal representation and append it to stringBuffer
        stringLength += 0x00000002;                                      //Increment the value of the stringLength variable by 2 to compensate for the 2 newly added bytes
    }

    stringBuffer[stringLength++] = 0x00;  //Null terminate the end of the string
    return stringLength;                  //Leave the function returning the final length of the constructed string
}

//Construct RSSI Log Function, constructs a new string to log the provided RSSI value in dBm
uint32_t constructRssiLog(uint8_t *stringBuffer, const float *rssi)
{
    int32_t dataBuffer;     //Reserve a new 32-bit variable in RAM to use for doing number manipulation while creating the radio report
    uint32_t stringLength;  //Create a new variable to use for tracking the length of the string being constructed
    
    memcpy(stringBuffer, logConstants_rssi, 0x00000011);  //Copy the first part of the RSSI log string into the string buffer
    stringLength = 0x00000011;                            //Set the starting length to the string to 17 characters
    dataBuffer = (*rssi * 10.0F);                         //Multiply the provided RSSI value by 10, then store it in dataBuffer with no decimal

    //Handle scenarios where the value of dataBuffer is actually a negative
    if (dataBuffer < 0x00000000)
    {
        stringBuffer[stringLength++] = 0x2D;  //Add a minus character to the string buffer to indicate the negative number
        dataBuffer = -dataBuffer;             //Force the contents of dataBuffer back into the positives again
    }

    uintToDecString(dataBuffer / 0x0000000A, stringBuffer + stringLength);  //Convert the whole number portion of the RSSI value into a string and put it into the string buffer
    stringLength = strlen(stringBuffer);                                    //Find the new length of the string with the whole number added into it
    dataBuffer %= 0x0000000A;                                               //Modulo the contents of dataBuffer by 10, storing the result back into the dataBuffer variable

    //Only add the decimal point and digits when actually required, otherwise don't bother
    if (dataBuffer)
    {
        stringBuffer[stringLength++] = 0x2E;                                    //Place the decimal point right after the whole number portion
        uintToDecString(dataBuffer % 0x00000064, stringBuffer + stringLength);  //Convert the decimal portion of the RSSI into a string and put it into the string buffer
        stringLength = strlen(stringBuffer);                                    //Find the new length of the string with the decimal places added into it
    }

    memcpy(stringBuffer + stringLength, logConstants_rssi + 0x00000011, 0x00000005);  //Add the final part of the log string into the buffer
    stringLength += 0x00000005;                                                      //Add the appropriate amount to stringLength to compensate for the added characters

    return stringLength;  //Leave the function returning the final length of the constructed string
}






//END OF FILE