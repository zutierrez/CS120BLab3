# Test file for Lab3_BitManipulation


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

# LAB3_EX5 ===== TESTS: totalWeight Sensor

test "PIND: 0x2C, PB0: 1 (89) => PORTB: 0x03"
setPINA 0xC6
setPINB 0x01
continue 5
expectPORTB 0x03
checkResult

test "PINA: 0x11 => PORTB: 0x01, PORTC: 0x10"
setPINA 0x11
continue 5
expectPORTB 0x01
expectPORTC 0x10
checkResult

test "PINA: 0xF1 => PORTB: 0x0F, PORTC: 0x10"
setPINA 0xF1
continue 5
expectPORTB 0x0F
expectPORTC 0x10
checkResult

test "PINA: 0x86 => PORTB: 0x08, PORTC: 0x60"
setPINA 0x86
continue 5
expectPORTB 0x08
expectPORTC 0x60
checkResult

test "PINA: 0x1C => PORTB: 0x01, PORTC: 0xC0"
setPINA 0x1C
continue 5
expectPORTB 0x01
expectPORTC 0xC0
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
