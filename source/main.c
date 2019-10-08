/*	Author: Zion Gutierrez, zguti001
 *      Partner(s) Name: none
 *	Lab Section: 023
 *	Assignment: Lab #3 Exercise #5
 *	Exercise Description: Car Weight Challenge
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */

#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
     	DDRB = 0xFE; PORTB = 0x01; // Configure port B's 7 most significant pins as outputs and PB0 as input
	DDRD = 0x00; PORTD = 0xFF; // Configure port C's 8 pins as inputs, initialize to 0s
        
	unsigned short totalWeight = 0x0000;
 	unsigned char inputB = 0x00;
	unsigned char outputB = 0x00;
	unsigned char inputD = 0x00;

        while (1) {
	// inputs:
	inputD = PIND;
	inputB = PINB & 0x01;

	totalWeight = inputD;
	totalWeight = totalWeight << 1;
	totalWeight = totalWeight | inputB;
 
	if( totalWeight >= 70) {
		outputB = 0x02;
	}
	if( totalWeight < 70 && totalWeight > 5){
		outputB = 0x04;
	}
	else{
		outputB = 0x00;
	}

        // outputs:
  	PORTB = outputB | PINB;
        }
    return 1;
}
