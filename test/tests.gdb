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

# LAB3_EX1 ===== TESTS: A&B 1'S COUNTER

test "PINA: 0x00, PINB: 0x00 => PORTC: 0x00"
setPINA 0x00
setPINB 0x00
continue 5
expectPORTC 0x00
checkResult

test "PINA: 0x01 (0000 0001), PINB: 0x01 => PORTC: 0x02"
setPINA 0x01
setPINB 0x01
continue 5
expectPORTC 0x02
checkResult

test "PINA: 0x08 (0000 1000), PINB: 0x08 => PORTC: 0x02"
setPINA 0x08
setPINB 0x08
continue 5
expectPORTC 0x02
checkResult

test "PINA: 0x88 (1000 1000), PINB: 0x88 => PORTC: 0x04"
setPINA 0x88
setPINB 0x88
continue 5
expectPORTC 0x04
checkResult

test "PINA: 0xF0 (1111 0000), PINB: 0xF0 => PORTC: 0x08"
setPINA 0xF0
setPINB 0xF0
continue 5
expectPORTC 0x08
checkResult

test "PINA: 0xFF (1111 1111), PINB: 0xFF => PORTC: 0x10"
setPINA 0xF0
setPINB 0xF0
continue 5
expectPORTC 0x10
checkResult

test "PINA: 0xF0 (1111 0000), PINB: 0x03 (0000 0011) => PORTC: 0x06"
setPINA 0xF0
setPINB 0x03
continue 5
expectPORTC 0x06
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
