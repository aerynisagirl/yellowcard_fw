/****************************************************************************
 *  Yellowcard - Example firmware for the Yellowcard RF Development Kit     *
 * ------------------------------------------------------------------------ *
 *  Interrupts.h - Anything related to system interrupts can be found here  *
 ****************************************************************************/

#ifndef __INTERRUPTS_H__
#define	__INTERRUPTS_H__

//Import any libraries used by this file
#include <xc.h>           //Include the main header file for the XC32 compiler, provides register definitions
#include <sys/attribs.h>  //Include the attribs file, contains macros for defining ISR functions
#include "Application.h"  //Inlcude the Application header file, contains the application program and all associated threads/state machines


//Define any variables that are external to this file


//Initialization Functions
extern void setupInterrupts();  //Setup Interrupts Function, configures the interrupt controller to receive and create program interrupts for the application


//Interrupt Service Routines
//  Priority 7  (Highest)


//  Priority 4


//  Priority 3
extern void timer2PeriodMatchISR();  //Timer 2 Period Match Interrupt Handler Function, called with the TMR2 register matches PR2
extern void int4ISR();               //External Interrupt 4 Handler Function, called on the rising edge of INT4

//  Priority 2
extern void timer1PeriodMatchISR();  //Timer 1 Period Match Interrupt Handler Function, called when the TMR1 register matches PR1
extern void rtccAlarmISR();          //RTCC Alarm Interrupt Handler Function, called whenever an alarm goes off within the RTCC
extern void dma2ISR();               //DMA Channel 2 Interrupt Handler Function, called when DMA2 aborts or finishes transferring a block of data

//  Priority 1  (Lowest)
extern void portChangeNoticeISR();   //Port Change Notice Interrupt Handler Function, called when any of the 3 buttons or reed switch changes state


#endif






//END OF FILE