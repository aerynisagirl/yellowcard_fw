/*******************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit        *
 * --------------------------------------------------------------------------- *
 *  Application.c - Contains all functions related to the application program  *
 *******************************************************************************/

#include "Application.h"



/********************************
 *  State Machines And Threads  *
 ********************************/

//Sensor Thread
volatile sensorState_t sensorThreadState;  //Stores the current state of the sensor thread
const void (*sensorFunctionTable[])() = {
                                         &threadSleep,
                                         &sensorStartMeasurements,
                                         &sensorGetPressure,
                                         &sensorGetTemperature,
                                         &sensorReportMeasurements,
                                         &sensorMeasureFail
                                        };

//Radio Thread
volatile radioState_t radioThreadState;  //Stores the current state of the radio thread
const void (*radioFunctionTable[])() = {
                                        &threadSleep,             //RADIO_SLEEP
                                        &threadSleep,             //RADIO_SLEEP_TX
                                        &threadSleep,             //RADIO_SLEEP_RX
                                        &threadSleep,             //RADIO_IDLE
                                        &radioProcessInterrupts,  //RADIO_DO_INTERRUPTS
                                        &radioStartTX,            //RADIO_START_TX
                                        &radioStartRX,            //RADIO_START_RX
                                        &threadSleep,             //RADIO_TX_DONE
                                        &threadSleep,             //RADIO_RX_DONE
                                        &radioGetPayload,         //RADIO_RECEIVE_PACKET
                                        &radioTimeoutRX           //RADIO_RX_TIMEOUT
                                       };



/***************
 *  Variables  *
 ***************/

//Sensor Thread
float mostRecentTemp;  //Create a float to store the most recent temperature measurement
float mostRecentRH;    //Create a float to store the most recent relative humidity measurement
float mostRecentPres;  //Create a float to store the most recent barometric pressure measurement

//Radio Thread
uint8_t txBuffer[0x00000042];  //Create a byte-array to use for storing the packet to be transmitted
uint8_t rxBuffer[0x00000042];  //Create a byte-array to use for writing the received packets into
uint32_t txAttempts;           //Create a variable to track how many remaining retransmission attempts are available
float mostRecentRSSI;          //Create a float to store the most recent RSSI measurement







/********************
 *  Initialization  *
 ********************/

//Initialize Application Function, resets the application and all the associated state machines
void initializeApplication()
{
    sensorThreadState = SENSOR_START_MEASUREMENTS;  //Start the sensor thread in the SENSOR_START_MEASUREMENTS state

#ifdef __IS_SENSORNODE__
    radioThreadState = RADIO_SLEEP;  //Start the radio thread in the RADIO_SLEEP state
#endif
#ifdef __IS_BASESTATION__
    TMR1 = 0x0000FFFF;                  //Set the Timer 1 counter to 1, instructs the thread to stay in RX mode permanently
    radioThreadState = RADIO_START_RX;  //Start the radio thread in the RADIO_START_RX state
#endif
}



/*******************
 *  Sensor Thread  *
 *******************/

//Start Measurements Function, instructs the sensors to begin new measurements
void sensorStartMeasurements()
{
    requestMeasurementSHT4X(HIGH_PRECISION_NO_HEATER);  //Ask the SHT4x sensor to start a new temperature and humidity measurement
    setModeDPS368(CONT_BOTH);                           //Start background measurements of both pressure and temperature on the DPS368 sensor

    LATBSET = 0x00000400;  //Turn on the status LED to indicate the measurement process has started

    sensorThreadState = SENSOR_GET_PRESSURE;  //Next state of the thread is SENSOR_GET_TEMPERATURE
}

//Get Measurements Function, attempts to read the new measurement data from the sensors
void sensorGetPressure()
{
    if (getResultStatusDPS368() != BOTH_READY) return;  //Leave if the results from the barometric pressure sensor aren't ready yet

    uint32_t resultBuffer[0x00000002];                   //Create an array of 2 32-bit unsigned integers to use for caching the results obtained from the sensors
    setModeDPS368(IDLE);                                 //Put the DPS368 sensor back into IDLE mode to save power
    getResultsFromFifoDPS368(resultBuffer, 0x00000002);  //Read both the temperature and pressure data from the sensor into resultBuffer

    mostRecentPres = convertToPressureFromDPS368(*resultBuffer, *(resultBuffer + 0x00000001));  //Convert the raw sensor data into the compensated barometric pressure in Pascal

    sensorThreadState = SENSOR_GET_TEMPERATURE;  //Next state of the thread is SENSOR_GET_TEMPERATURE
}

//Get Temperature Function, attempts to read the new measurement data from the temperature and humidity sensor
void sensorGetTemperature()
{
    uint32_t resultBuffer[0x00000002];

    if (!getResultsSHT4X((uint16_t *) resultBuffer, (uint16_t *) (resultBuffer + 0x00000001))) return;  //Try to get the temperature and humidity data from the sensor, leaving upon failure

    mostRecentTemp = convertToTempCFromSHT4X((uint16_t *) resultBuffer);            //Convert the raw temperature data into it's compensated form in Celsius
    mostRecentRH = convertToRHFromSHT4X((uint16_t *) (resultBuffer + 0x00000001));  //Convert the raw humidity data into it's compensated form as a percentage

    //Reset the RTC now that the measurements have been collected
    RTCDATE = 0x00000000;  //Reset the date value back to 0
    RTCTIME = 0x00000000;  //Reset the time value back to 0
    RTCALRM = 0x00008600;  //Setup a single alarm to occur at the pre-set interval
    RTCCON = 0x0000A248;   //Enable the RTCC and start counting

    sensorThreadState = SENSOR_REPORT_MEASUREMENTS;  //Next state of the thread is SENSOR_REPORT_MEASUREMENTS
}

//Report Measurements Function, prepares the obtained measurements and then sends them over the air
void sensorReportMeasurements()
{
#ifdef __BUILD_DEVELOPMENT__
    uint32_t stringLength;                    //Create a new variable to use for storing the size of constructed log strings

    stringLength = constructMeasurementLog((uint8_t *) dmaBufferTxUART, &mostRecentTemp, &mostRecentRH, &mostRecentPres);  //Construct a new measurement report log and store it in dmaBufferTxUART
    startTxUART((uint8_t *) dmaBufferTxUART, &stringLength);                                                               //Start the transmission of the log message over UART

    while (DCH2CON & 0x00008000) asm volatile ("wait");  //Keep the CPU in idle mode until DMA 2 is done writing to UART 2 before down-clocking the CPU
    while (!(U2STA & 0x00000100));                       //Wait until the transmission has completed fully before we down-clock the CPU
#endif

#ifdef __IS_BASESTATION__
    LATBCLR = 0x00000400;

    sensorThreadState = SENSOR_SLEEP;  //Next state of the thread is SENSOR_SLEEP
#endif
#ifdef __IS_SENSORNODE__
    //Check to see if the radio is not busy
    if (radioThreadState == RADIO_SLEEP)
    {
        LATBCLR = 0x00000400;

        newMeasureReportPacket((packetMeasureReport_t *) txBuffer,                //Create a new measurement report packet using the newly obtained measurements storing it in txBuffer
                               &mostRecentTemp, &mostRecentRH, &mostRecentPres);

        TMR1 = 0x00000000;                  //Clear the Timer 1 counter, instructs the thread to enter listen mode during RX periods
        txAttempts = 0x00000003;            //Allow a maximum of 3 attempts to send the packet before giving up and going back to sleep
        radioThreadState = RADIO_START_TX;  //Request that the radio start sending the new packet

        sensorThreadState = SENSOR_SLEEP;  //Next state of the thread is SENSOR_SLEEP
    }
#endif
}

//Measure Fail Function, handles any exceptions that occur when collecting measurements from the sensors
void sensorMeasureFail()
{
    //Do something

    sensorThreadState = SENSOR_SLEEP;  //Next state of the thread is SENSOR_SLEEP
}






/******************
 *  Radio Thread  *
 ******************/

//Process Interrupt Function, handles interrupt assertions placed by the radio
void radioProcessInterrupts()
{
    uint8_t radioIRQdata = 0x00;                                                             //Create a new variable to use for putting the IRQ bits obtained from the radio into
    interactWithRegistersSX1231H(REGADDR_IRQFLAGS2, &radioIRQdata, 0x00000001, 0xFFFFFFFF);  //Read the IRQ bits from the IrqFlags2 register on the radio

    //Check if the PacketSent flag is set
    if (radioIRQdata & 0x00000008)
    {
        LATACLR = 0x00000002;

        setDeviceModeSX1231H(SLEEP);

        //Determine if a receive window is supposed to follow the transmission
        if (txAttempts == 0xFFFFFFFF)
        {
            txAttempts = 0x00000000;         //Reset the txAttempts counter back to 0

#ifdef __IS_BASESTATION__
            radioThreadState = RADIO_START_RX;  //Next state of the thread is RADIO_START_RX
#endif
#ifdef __IS_SENSORNODE__
            radioThreadState = RADIO_SLEEP;  //Next state of the thread is RADIO_SLEEP
#endif
        }
        else
        {
            TMR1 = 0x00000000;                  //Set the Timer 1 counter to 0, requests that the listen mode becomes active
            radioThreadState = RADIO_START_RX;  //Next state of the thread is RADIO_START_RX
        }

        return;  //Leave, we're done here now
    }

    //Check if the PayloadReady flag is set
    if (radioIRQdata & 0x00000004)
    {
        setDeviceModeSX1231H(SLEEP);  //Put the radio to sleep now that a packet has been received

        radioThreadState = RADIO_RECEIVE_PACKET;  //Next state of the thread is RADIO_RECEIVE_PACKET
        return;                                   //Leave, we're done here now
    }

    interactWithRegistersSX1231H(REGADDR_IRQFLAGS1, &radioIRQdata, 0x00000001, 0xFFFFFFFF);  //Read the IRQ bits from the IrqFlags1 register on the radio

    //Check if the SyncAddressMatch flag is set
    if (radioIRQdata & 0x00000001)
    {
        LATASET = 0x00000001;

        mostRecentRSSI = getRssiSX1231H();  //Record the current RSSI of the detected signal as we can not capture this after the payload is ready
        setDIOMappingsSX1231H(0x00000100);  //Make GPIO0 of the transceiver IC output the PayloadReady interrupt signal

        TMR2 = 0x00000000;      //Clear the Timer 2 count register
        T1CONCLR = 0x00008000;  //Stop Timer 1 while attempting to receive a new packet
        T2CONSET = 0x00008000;  //Start Timer 2 to act as a time-out generator in the event that no packet is actually received

        radioThreadState = RADIO_IDLE;  //Next state of the thread is RADIO_IDLE
        return;                         //Leave, we're done here now
    }

    radioThreadState = RADIO_SLEEP;  //Next state of the thread is RADIO_SLEEP by default
}

//Start TX Function, instructs the radio to begin transmitting the next available packet
void radioStartTX()
{
    LATASET = 0x00000002;

    setDeviceModeSX1231H(SLEEP);        //Put the radio into sleep mode, ensures that the FIFO gets cleared
    setDIOMappingsSX1231H(0x00000000);  //Make GPIO0 of the transceiver IC output the PacketSent interrupt signal
    setPowerLevelSX1231H(0x00000010);   //Do the transmission at something dBm idk what power-level it is lol

    writePacketSX1231H(txBuffer, ((packetHeader_t *) txBuffer)->length);  //Write the packet to the radio FIFO
    setDeviceModeSX1231H(TX);                                             //Start the transmission by putting the transceiver into TX mode

    txAttempts--;  //Decrement the retransmission counter by 1

    radioThreadState = RADIO_SLEEP_TX;  //Next state of the thread is RADIO_SLEEP_TX
}

//Start RX Function, puts the radio into receive mode and prepares for packet reception
void radioStartRX()
{
    setPowerLevelSX1231H(0x00000000);           //Set the power level of the radio to 0, required before entering RX mode to prevent damage
    setDeviceModeSX1231H(STBY);                 //Put the radio into standby mode, ensures that the FIFO gets cleared
    setAutoModeSX1231H(NONE, NONE, INT_SLEEP);  //Turn off auto-modes on the radio, we want full control of it during receive mode
    setDIOMappingsSX1231H(0x00000200);          //Make GPIO0 of the transceiver IC output the SyncAddress interrupt signal
    setDeviceModeSX1231H(RX);                   //Put the radio into the receive mode, also clears the FIFO buffer

    //Check if the listen timer needs to be started
    if (!TMR1)
    {
        T1CONSET = 0x00008000;  //Start Timer 1
    }

    radioThreadState = RADIO_SLEEP_RX;  //Next state of the thread is RADIO_SLEEP_RX
}

//TX Done Function, event handler for 

//Get Payload Function, reads the newly received packet from the radio's FIFO buffer
void radioGetPayload()
{
    LATACLR = 0x00000001;

    interactWithRegistersSX1231H(REGADDR_PAYLOADLENGTH, rxBuffer, 0x00000001, 0xFFFFFFFF);  //Determine the size of the received payload and write it to the first byte of the rxBuffer array
    interactWithRegistersSX1231H(REGADDR_FIFO, rxBuffer, *rxBuffer, 0xFFFFFFFF);            //Read the desired number of bytes from the FIFO into the rxBuffer array

    packetHeader_t *receivedHeader = (packetHeader_t *) rxBuffer;  //Create a packetHeader_t pointer from the contents of rxBuffer

    //Determine if we're accepting an ACKNOWLEDGE
    if (receivedHeader->payloadType == ACKNOWLEDGE)
    {
        txAttempts = 0x00000000;  //Clear txAttempts to reset the transmission retry counter

        radioThreadState = RADIO_SLEEP;  //Next state of the thread is RADIO_SLEEP
    }
    else
    {
#ifdef __IS_BASESTATION__
        newAcknowledgePacket((packetAcknowledge_t *) txBuffer);  //Create a new acknowledge packet and put it into txBuffer

        TMR1 = 0x0000FFFF;                  //Write an arbitrary value to the Timer 1 counter, ensures that the thread enters sleep after transmission
        txAttempts = 0x00000000;            //Only allow 1 transmission
        radioThreadState = RADIO_START_TX;  //Instruct the thread to begin the transmission by changing its state to RADIO_START_TX
#endif
#ifdef __IS_SENSORNODE__
        //Determine if we're supposed to go back into RX mode or not
        if (!TMR1)
        {
            radioThreadState = RADIO_START_RX;  //Next state of the thread is RADIO_START_RX
        }
        else
        {
            radioThreadState = RADIO_SLEEP;  //Next state of the thread is RADIO_SLEEP
        }
#endif
    }

//    float decodedTemperature, decodedHumidity, decodedPressure;
//    uint32_t stringLength = 0x00000000;

//    getMeasurementsFromMeasureReportPacket((packetMeasureReport_t *) rxBuffer, &decodedTemperature, &decodedHumidity, &decodedPressure);

#ifdef __BUILD_DEVELOPMENT__
//    stringLength = constructMeasurementLog((uint8_t *) dmaBufferTxUART, &decodedTemperature, &decodedHumidity, &decodedPressure);
//    stringLength = constructRssiLog((uint8_t *) dmaBufferTxUART, &mostRecentRSSI);
//    startTxUART((uint8_t *) dmaBufferTxUART, &stringLength);                                                      //Start the transmission of the log message over UART
#endif
}

//Radio Receive Timeout Function, handles timeout events for the radio while in receive mode
void radioTimeoutRX()
{
    LATACLR = 0x00000001;

    setDeviceModeSX1231H(SLEEP);  //Put the radio into sleep mode now that the receive window has closed

    //Check if we're allowed to try sending the packet again
    if (txAttempts)
    {
        radioThreadState = RADIO_START_TX;  //Next state of the thread is RADIO_START_TX
    }
    else
    {
        radioThreadState = RADIO_SLEEP;  //Next state of the thread is RADIO_SLEEP
    }
}

void radioPowerDown()
{
    //Do something

    radioThreadState = RADIO_SLEEP;  //Next state of the thread is RADIO_SLEEP
}






/**********************
 *  Utility Handlers  *
 **********************/

//Thread Sleep Function, provides a blank handler function to use when a thread is asleep
void threadSleep()
{
    //Literally do nothing lol
}






//END OF FILE