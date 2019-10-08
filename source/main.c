/*	Author: Zion Gutierrez, zguti001
 *      Partner(s) Name: none
 *	Lab Section: 023
 *	Assignment: Lab #3 Exercise #2
 *	Exercise Description: Fuel Level Tracker
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */

#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

#define fuelLevel PINA

int main(void) {
        DDRA = 0x00; PORTA = 0xFF; // Configure port A's 8 pins as inputs
        DDRC = 0xFF; PORTC = 0x00; // Configure port B's 8 pins as outputs, initialize to 0s

        unsigned char inputA = 0x00; // Temp (PORTA)
        unsigned char outputC = 0x00; // Temp (PORTC)

        while (1) {
        // inputs:

         if(fuelLevel >= 13){
         	outputC = 0x3F; // (0011 1111)
         }
         if(fuelLevel < 13 && fuelLevel >= 10){ //(12-10)
         	outputC = 0x3E; // (0011 1110)
	 }
	 if(fuelLevel < 10 && fuelLevel >= 7){ //(9-7)
	 	outputC = 0x3C; // (0011 1100)
	 }	
	 if(fuelLevel < 7 && fuelLevel >= 5){  //(6-5)
		outputC = 0x38; // (0011 1000)
	 }
	 if(fuelLevel < 5 && fuelLevel >= 3){  //(4-3)
		outputC = 0x70; // (0111 0000)
	 }
	 if(fuelLevel < 3){     // (2-0)
		outputC = 0x60; // (0110 0000)
	 }

        // Output
	PORTC = outputC;
    }
    return 1;
}
