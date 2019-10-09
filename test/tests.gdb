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
setPIND 0x2C
setPINB 0x01
continue 5
expectPORTB 0x03
checkResult

test "PIND: 0x15, PB0: 1 (43) => PORTB: 0x05"
setPIND 0x15
setPINB 0x01
continue 5
expectPORTB 0x05
checkResult

test "PIND: 0x01, PB0: 1 (3) => PORTB: 0x01"
setPIND 0x01
setPINB 0x01
continue 5
expectPORTB 0x01
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
