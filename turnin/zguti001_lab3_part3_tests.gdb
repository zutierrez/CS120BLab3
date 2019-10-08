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

# LAB3_EX3 ===== TESTS: FuelLevel Sensor + Seat Sensor

#Tests with Seat/SeatBelt/Key variations
#K = KeyIgnition, SE = Seated, SB = SeatBelt

test "PINA: 0x7F (K && SE && SB + 15) => PORTC: 0x3F"
setPINA 0x7F
continue 5
expectPORTC 0x3F
checkResult

test "PINA: 0x6F (!K && SE && SB + 15) => PORTC: 0x3F"
setPINA 0x6F
continue 5
expectPORTC 0x3F
checkResult

test "PINA: 0x5F (K && !SE && SB + 15) => PORTC: 0x3F"
setPINA 0x5F
continue 5
expectPORTC 0x3F
checkResult

#SPECIAL CASE FOR PC7 = 1 "Fasten Seatbelt"
test "PINA: 0x3F (K && SE && !SB + 15) => PORTC: 0xBF"
setPINA 0x3F
continue 5
expectPORTC 0xbf
checkResult

test "PINA: 0x32 (K && SE && !SB + 2) => PORTC: 0xE0"
setPINA 0x32
continue 5
expectPORTC 0xe0
checkResult

#Tests withOUT Seat/SeatBelt/Key variations

test "PINA: 0x0F (15) => PORTC: 0x3F"
setPINA 0x0F
continue 5
expectPORTC 0x3F
checkResult

test "PINA: 0x0D (13) => PORTC: 0x3F"
setPINA 0x0D
continue 5
expectPORTC 0x3F
checkResult

test "PINA: 0x0C (12)  => PORTC: 0x3E"
setPINA 0x0C
continue 5
expectPORTC 0x3E
checkResult

test "PINA: 0x0A (10) => PORTC: 0x3E"
setPINA 0x0A
continue 5
expectPORTC 0x3E
checkResult

test "PINA: 0x09 (9) => PORTC: 0x3C"
setPINA 0x09
continue 5
expectPORTC 0x3C
checkResult

test "PINA: 0x07 (7) => PORTC: 0x3C"
setPINA 0x07
continue 5
expectPORTC 0x3C
checkResult

test "PINA: 0x06 (6) => PORTC: 0x38"
setPINA 0x06
continue 5
expectPORTC 0x38
checkResult

test "PINA: 0x04 (4) => PORTC: 0x70"
setPINA 0x04
continue 5
expectPORTC 0x70
checkResult

test "PINA: 0x03 (3) => PORTC: 0x70"
setPINA 0x03
continue 5
expectPORTC 0x70
checkResult

test "PINA: 0x02 (2) => PORTC: 0x60"
setPINA 0x02
continue 5
expectPORTC 0x60
checkResult

test "PINA: 0x00 (0) => PORTC: 0x60"
setPINA 0x00
continue 5
expectPORTC 0x60
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n
