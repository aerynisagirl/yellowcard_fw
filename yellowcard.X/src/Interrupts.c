/*************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit  *
 * --------------------------------------------------------------------- *
 *  Interrupts.c - Contains all application interrupt functions          *
 *************************************************************************/

#include "Interrupts.h"



/********************
 *  Initialization  *
 ********************/

//Setup Interrupts Function, configures the interrupt controller to receive and create program interrupts for the application
inline void setupInterrupts()
{
    asm volatile ("di");  //Disable global interrupts
    INTCON = 0x00001010;  //Enable multi-vector interrupt modes

    IFS0 = 0x00000000;  //Clear the entire IFS0 register to clear all interrupt flags
    IFS1 = 0x00000000;  //Clear the entire IFS1 register to clear all interrupt flags

    IPC1 = 0x00000008;   //Set the Timer 1 interrupt priority to level 2
    IPC3 = 0x0000000C;   //Set the Timer 2 interrupt priority to level 3
    IPC4 = 0x0C000000;   //Set the External Interrupt 4 priority to level 3
    IPC6 = 0x00000800;   //Set the RTCC interrupt priority to level 2
    IPC8 = 0x00040000;   //Set the Change Notice interrupt priority to level 1
    IPC10 = 0x08000000;  //Set the DMA Channel 3 interrupt priority to level 2

    IEC0 = 0x40800210;  //Enable the Timer 1 period match, Timer 2 period match, RTCC, and 4th external interrupts
    IEC1 = 0x80000000;  //Enable the DMA Channel 3 abort/complete interrupt
//    IEC1 = 0x80004000;  //Enable the DMA Channel 3 abort/complete interrupt and Port B change notification interrupts

    asm volatile ("ei");  //Enable global interrupts again
}



/********************************
 *  Interrupt Service Routines  *
 ********************************/

//Priority 4


//Priority 3

//Timer 1 Period Match Interrupt Handler Function, called when the TMR1 register matches PR1
void __ISR(_TIMER_1_VECTOR, IPL3SOFT) timer1PeriodMatchISR()
{
    IFS0CLR = 0x00000010;  //Clear the Timer 1 interrupt flag

    T1CONCLR = 0x00008000;//Stop Timer 1 to prevent future unwanted interrupts

#ifdef __BUILD_DEVELOPMENT__
    startTransferDMA3(dmaBufferTxUART, constructThreadStateLog(dmaBufferTxUART, LOGSTRINGS_THREADNAME_RADIO,
                                                               LOGSTRINGS_THREADSTATES_RADIO[radioThreadState],
                                                               LOGSTRINGS_THREADSTATES_RADIO_RXTIMEOUT));
#endif
    
    radioThreadState = RADIO_RX_TIMEOUT;  //Generate an RX timeout event for the radio thread by changing its state to RADIO_RX_TIMEOUT
}

//Timer 2 Period Match Interrupt Handler Function, called with the TMR2 register matches PR2
void __ISR(_TIMER_2_VECTOR, IPL3SOFT) timer2PeriodMatchISR()
{
    IFS0CLR = 0x00000200;  //Clear the Timer 2 interrupt flag

    T2CONCLR = 0x00008000;  //Stop Timer 2 to prevent future unwanted interrupts

#ifdef __BUILD_DEVELOPMENT__
    startTransferDMA3(dmaBufferTxUART, constructThreadStateLog(dmaBufferTxUART, LOGSTRINGS_THREADNAME_RADIO,
                                                               LOGSTRINGS_THREADSTATES_RADIO[radioThreadState],
                                                               LOGSTRINGS_THREADSTATES_RADIO_STARTRX));
#endif

    radioThreadState = RADIO_START_RX;  //Put the radio back into RX mode by changing the radio threads state to RADIO_START_RX
}

//External Interrupt 4 Handler Function, called on the rising edge of INT4
void __ISR(_EXTERNAL_4_VECTOR, IPL3SOFT) int4ISR()
{
    IFS0CLR = 0x00800000;  //Clear the INT4 interrupt flag 

    T2CONCLR = 0x00008000;  //Stop Timer 2 to prevent future unwnated interrupts

#ifdef __BUILD_DEVELOPMENT__
    startTransferDMA3(dmaBufferTxUART, constructThreadStateLog(dmaBufferTxUART, LOGSTRINGS_THREADNAME_RADIO,
                                                               LOGSTRINGS_THREADSTATES_RADIO[radioThreadState],
                                                               LOGSTRINGS_THREADSTATES_RADIO_PROCESSINTERRUPT));
#endif

    radioThreadState = RADIO_PROCESS_INTERRUPT;  //Handle the radio interrupt by putting the radio thread into the RADIO_PROCESS_INTERRUPT state
}


//Priority 2

//RTCC Alarm Interrupt Handler Function, called whenever an alarm goes off within the RTCC
void __ISR(_RTCC_VECTOR, IPL2SOFT) rtccAlarmISR()
{
    IFS0CLR = 0x40000000;  //Clear the RTCC interrupt flag

    RTCCON = 0x00002208;  //Stop and disable the RTCC now that we have woken up again

#ifdef __BUILD_DEVELOPMENT__
    startTransferDMA3(dmaBufferTxUART, constructThreadStateLog(dmaBufferTxUART, LOGSTRINGS_THREADNAME_SENSOR,
                                                              LOGSTRINGS_THREADSTATES_SENSOR[sensorThreadState],
                                                              LOGSTRINGS_THREADSTATES_SENSOR_STARTMEASUREMENTS));
#endif

    sensorThreadState = SENSOR_START_MEASUREMENTS;  //Begin a new measurement by putting the sensor thread into the SENSOR_START_MEASUREMENTS state
}

//DMA Channel 3 Interrupt Handler Function, called when DMA3 aborts or finishes transferring a block of data
void __ISR(_DMA3_VECTOR, IPL2SOFT) dma3ISR()
{
    IFS1CLR = 0x80000000;  //Clear the DMA Channel 3 interrupt flag

    //Not sure I've done this, but it doesn't to behave correctly without this /shrug
    DCH3INT = 0x00080000;           //Clear the interrupts flags for DMA 3 itself
}


//Priority 1 (Lowest)

//Port Change Notice Interrupt Handler Function, called when any of the 3 buttons or reed switch changes state
void __ISR(_CHANGE_NOTICE_VECTOR, IPL1SOFT) portChangeNoticeISR()
{
    uint32_t statbBuffer = CNSTATB;  //Create a temp copy of the state of CNSTATB so that PORTB calls aren't changing CNSTATB for the next if statement
    IFS1CLR = 0x00002000;            //Clear Port Change Notice interrupt flag

    //Do something here
}