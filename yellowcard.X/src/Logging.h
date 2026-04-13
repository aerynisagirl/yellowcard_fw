/****************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit     *
 * ------------------------------------------------------------------------ *
 *  Logging.h - Houses all things related to logging strings       *
 ****************************************************************************/

#ifndef __LOGGING_H__
#define __LOGGING_H__

//Include any libraries used by this file
#include <xc.h>           //Include the main header file for the XC32 compiler, provides register definitions
#include <sys/attribs.h>  //Include the attribs file, contains compiler level memory organization macros
#include <string.h>       //Include the default string library which has some handy memory and string manipulation functions
#include "StringUtils.h"  //Include the string utils header file, has some functions to convert different data types into strings


//Logging string flash memory allocation
extern const uint8_t __attribute__ ((space(prog), section(".logging_constants"))) logConstants_measurementReport[];
extern const uint8_t __attribute__ ((space(prog), section(".logging_constants"))) logConstants_packet[];
extern const uint8_t __attribute__ ((space(prog), section(".logging_constants"))) logConstants_rssi[];

//Packet type string flash memory allocation
extern const uint8_t __attribute__ ((space(prog), section(".logging_constants"))) logConstants_packetType_acknowledge[];
extern const uint8_t __attribute__ ((space(prog), section(".logging_constants"))) logConstants_packetType_event[];
extern const uint8_t __attribute__ ((space(prog), section(".logging_constants"))) logConstants_packetType_measureReport[];

extern const uint8_t* __attribute__ ((space(prog), section(".logging_constants_ptrs"))) logConstants_packetTypeLookup[];

//String constant flash memory allocation
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_ARROW[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADNAME_SENSOR[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADNAME_RADIO[];

extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_SENSOR_SLEEP[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_SENSOR_STARTMEASUREMENTS[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_SENSOR_GETPRESSURE[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_SENSOR_GETTEMPERATURE[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_SENSOR_REPORTMEASUREMENTS[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_SENSOR_MEASUREFAIL[];

extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_SLEEP[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_SLEEPTX[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_SLEEPRX[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_IDLE[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_PROCESSINTERRUPT[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_STARTTX[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_STARTRX[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_TXDONE[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_RXDONE[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_RECEIVEPACKET[];
extern const uint8_t __attribute__ ((space(prog), section(".strings"))) LOGSTRINGS_THREADSTATES_RADIO_RXTIMEOUT[];

extern const uint8_t* __attribute__ ((space(prog), section(".stringptrs"))) LOGSTRINGS_THREADSTATES_SENSOR[];
extern const uint8_t* __attribute__ ((space(prog), section(".stringptrs"))) LOGSTRINGS_THREADSTATES_RADIO[];


//Define prototypes for functions used in the Logging source file
extern uint32_t constructThreadStateLog(uint8_t *stringBuffer,     //Construct Thread State Log Function, constructs a new string to log a thread state machine change
                                        const uint8_t *threadName,
                                        const uint8_t *oldState,
                                        const uint8_t *newState);
extern uint32_t constructMeasurementLog(uint8_t *stringBuffer,     //Construct Measurement Log Function, constructs a new string to log the provided measurement results
                                        const float *temperature,
                                        const float *humidity,
                                        const float *pressure);
extern uint32_t constructPacketLog(uint8_t *stringBuffer,          //Construct Packet Log Function, constructs a new string to log the provided packet bytes
                                   const uint8_t *packetBytes);
extern uint32_t constructRssiLog(uint8_t *stringBuffer,            //Construct RSSI Log Function, constructs a new string to log the RSSI value of the last packet received
                                 const float *rssi);


#endif






//END OF FILE