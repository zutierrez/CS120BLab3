/*	Author: Zion Gutierrez, zguti001
 *      Partner(s) Name: none
 *	Lab Section: 023
 *	Assignment: Lab #3 Exercise #1
 *	Exercise Description: Count number of 1's in A&B
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
	DDRB = 0x00; PORTB = 0xFF; // Configure port B's 8 pins as inputs
	DDRC = 0xFF; PORTC = 0x00; // Configure port C's 8 pins as outputs, initialize to 0s
	
	unsigned char inputA = 0x00; // Temp (PORTA)
	unsigned char inputB = 0x00; // Temp (PORTB)
	unsigned char BitMaskA = 0x80; //BitMask for 7th bit (1000 0000)
	unsigned char BitMaskB = 0x80; // to be shifted down, inspect each bit and ++cnt
	unsigned char cnt = 0x00; 
	int i;
	int j;

	while (1) {
	// inputs:
	inputA = PINA;
	inputB = PINB;
	
	//counting 1's in A 
	for( i = 7; i >= 0; --i){
		if( ((inputA & BitMaskA) >> i) == 1 ){
			cnt = cnt + 1; 
		}
	BitMaskA = BitMaskA >> 1;
	}
	
	//counting 1's in B
	for( j = 7; j >= 0; --j){
		if( (inputB & BitMaskB) >> j == 1 ){
			cnt = cnt + 1; 
		}
	BitMaskB = BitMaskB >> 1;
	}
	
        // Output
	PORTC = cnt;
	cnt = 0x00;
    }

    return 1;
}
