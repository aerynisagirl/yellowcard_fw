/********************************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit                     *
 * ---------------------------------------------------------------------------------------- *
 *  Application.h - Houses all things related to the application and program state machine  *
 ********************************************************************************************/

#ifndef __APPLICATION_H__
#define __APPLICATION_H__

//Import any libraries used by this file
#include <xc.h>                        //Include the main header file for the XC32 compiler, provides register definitions
#include "../drv/DPS368/DPS368.h"      //Include the driver for the DPS368 barometric pressure sensor
#include "../drv/SHT4x/SHT4x.h"        //Include the driver for the SHT4x temperature and humidity sensor
#include "../drv/SX1231H/SX1231H.h"    //Include the driver for the SX1231H sub-1GHz radio IC
#include "Display.h"                   //Include the display header file for displaying the screens onto the LCD
#include "PacketStructures.h"          //Include the packet structures header file to use for handling packet creation

//Include any libraries used specifically for development builds
#ifdef __BUILD_DEVELOPMENT__
#include "../Logging.h"                //Include the logging header file that contains all things logging related
#endif


//Define any enum types used within this file
typedef enum
{
    SENSOR_SLEEP, SENSOR_START_MEASUREMENTS, SENSOR_GET_PRESSURE, SENSOR_GET_TEMPERATURE, SENSOR_REPORT_MEASUREMENTS, SENSOR_MEASURE_FAIL
} sensorState_t;

typedef enum
{
    RADIO_SLEEP, RADIO_SLEEP_TX, RADIO_SLEEP_RX, RADIO_IDLE, RADIO_PROCESS_INTERRUPT, RADIO_START_TX, RADIO_START_RX,
    RADIO_TX_DONE, RADIO_RX_DONE, RADIO_RECEIVE_PACKET, RADIO_RX_TIMEOUT
} radioState_t;


//Define any variables that are external to this file
//Application Configuration
extern const uint16_t configNodeID;          //Contains the Node ID of the device
extern const uint32_t configSampleInterval;  //Specifies the delay time between each measurement
extern const uint32_t configRadioCarrier;    //Contains the carrier frequency the radio will operate on
extern const uint16_t configRadioBitrate;    //Contains the bit-rate that the radio will operate at

//Sensor Thread
extern volatile sensorState_t sensorThreadState;  //Used to track where program execution is currently taking place within the sensor thread
extern const void (*sensorFunctionTable[])();     //Provides a lookup table of handler functions for the sensor state machine

extern float mostRecentTemp;                      //Holds the most recent temperature measurement
extern float mostRecentRH;                        //Holds the most recent relative humidity measurement
extern float mostRecentPres;                      //Holds the most recent barometric pressure measurement

//Radio Thread
extern volatile radioState_t radioThreadState;  //Used to track where program execution is currently taking place within the radio thread
extern const void (*radioFunctionTable[])();    //Provides a lookup table of handler functions for the radio state machine

extern uint8_t txBuffer[0x00000042];            //All packets to be sent on air are to be written here
extern uint8_t rxBuffer[0x00000042];            //All packets received from the radio are available here
extern uint32_t txAttempts;                     //Counts how many retransmission attempts are left before a timeout
extern float mostRecentRSSI;                    //Holds the most recent RSSI measurement


//Initialization Functions
extern void initializeApplication();  //Initialize Application Function, resets the application and all the associated state machines


//Sensor Thread Handler Functions
extern void __attribute__ ((section(".thread_handlers"))) sensorStartMeasurements();   //Start Measurements Function, instructs the sensors to begin new measurements
extern void __attribute__ ((section(".thread_handlers"))) sensorGetPressure();         //Get Pressure Function, attempts to read the new measurement data from the barometric pressure sensor
extern void __attribute__ ((section(".thread_handlers"))) sensorGetTemperature();      //Get Temperature Function, attempts to read the new measurement data from the temperature and humidity sensor
extern void __attribute__ ((section(".thread_handlers"))) sensorReportMeasurements();  //Report Measurements Function, prepares the obtained measurements and then sends them over the air
extern void __attribute__ ((section(".thread_handlers"))) sensorMeasureFail();         //Measure Fail Function, handles any exceptions that occur when collecting measurements from the sensors

//Radio Thread Handler Functions
extern void __attribute__ ((section(".thread_handlers"))) radioProcessInterrupts();  //Process Interrupt Function, handles interrupt assertions placed by the radio
extern void __attribute__ ((section(".thread_handlers"))) radioStartRX();            //Start RX Function, puts the radio into receive mode and prepares for packet reception
extern void __attribute__ ((section(".thread_handlers"))) radioStartTX();            //Start TX Function, instructs the radio to begin transmitting the next available packet
extern void __attribute__ ((section(".thread_handlers"))) radioGetPayload();         //Get Payload Function, reads the newly received payload data from the radios FIFO buffer
extern void __attribute__ ((section(".thread_handlers"))) radioTimeoutRX();          //Radio Receive Timeout Function, handles timeout events for the radio while in receive mode

//Utility Functions
extern void __attribute__ ((section(".thread_handlers"))) threadSleep();  //Thread Sleep Function, provides a blank handler function to use when a thread is asleep


#endif






//END OF FILE