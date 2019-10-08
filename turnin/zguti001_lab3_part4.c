/*	Author: Zion Gutierrez, zguti001
 *      Partner(s) Name: none
 *	Lab Section: 023
 *	Assignment: Lab #3 Exercise #4
 *	Exercise Description: Nibble Transfer Challenge
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */

#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
        DDRA = 0x00; PORTA = 0xFF; // Configure port A's 8 pins as inputs
     	DDRB = 0xFF; PORTB = 0x00; // Configure port B's 8 pins as outputs, initialize to 0s
	DDRC = 0xFF; PORTC = 0x00; // Configure port C's 8 pins as outputs, initialize to 0s
        unsigned char inputA = 0x00;
 	unsigned char outputB = 0x00;
	unsigned char outputC = 0x00;

        while (1) {
	// inputs:
	inputA = PINA;

        // outputs:
  	outputB = inputA & 0xF0;
	outputB = outputB >> 4;
	outputC = inputA & 0x0F;	
	outputC = outputC << 4; 
   
	PORTB = outputB;
	PORTC = outputC;
	
         }
    return 1;
}
