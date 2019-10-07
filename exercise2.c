/*	Author: Zion Gutierrez, zguti001
 *      Partner(s) Name: none
 *	Lab Section: 023
 *	Assignment: Lab #3 Exercise #2
 *	Exercise Description: Fuel Sensor 
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
	int i;
	int j;

	while (1) {
	// inputs:
	inputA = PINA;

	// smart naming is required
	
	if(fuelLevel >= 13){
		//turn on all bits (0011 1111)
	}
	if(fuelLevel < 13 && fuelLevel >= 10){
		//turn on (0011 1110)
	}
	if(fuelLevel < 10 && fuelLevel >= 7){
		//turn on (0011 1100)
	}
	if(fuelLevel < 7 && fuelLevel >= 5){
		//turn on (0011 1000)
	}
	if(fuelLevel < 5 && fuelLevel >= 3){
		//turn on (0011 0000)
	}
	if(fuelLevel < 2) {
		// turn on (0010 0000)
	}

	
        // output:
	PORTC = outputC;
	
    }

    return 1;
}

