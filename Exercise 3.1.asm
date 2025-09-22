
#include <iostream>

#using namespace std;

#int main() {
#    int quantity;

#    // input from the user
#    cout << "Enter quantity in liters: ";
#    cin >> quantity;

#    // Each lekokopo holds 20 liters
#    int makokopo = quantity / 20;
#    int remaining = quantity % 20;

#    // Output result
#    cout << "Makokopo (20L units): " << makokopo <<endl;
#    cout << "Remaining liters: " << remaining <<endl;

#    return 0;
#}

.data
prompt:    .asciz "Enter quantity in liters: "
msg1:      .asciz "Makokopo (20L units): "
msg2:      .asciz "Remaining liters: "
newline:   .asciz "\n"

.text
.globl _start
_start:
    # Prompt user
    la a0, prompt
    li a7, 4
    ecall

    # Read input quantity
    li a7, 5
    ecall
    mv t0, a0        # t0 = quantity

    # Divide t0 by 20 (makokopo size)
    li t1, 20
    div t2, t0, t1   # t2 = number of makokopo
    rem t3, t0, t1   # t3 = remainder

    # Print "Makokopo (20L units): "
    la a0, msg1
    li a7, 4
    ecall

    # Print number of makokopo (t2)
    mv a0, t2
    li a7, 1
    ecall

    # Print newline
    la a0, newline
    li a7, 4
    ecall

    # Print "Remaining liters: "
    la a0, msg2
    li a7, 4
    ecall

    # Print remainder (t3)
    mv a0, t3
    li a7, 1
    ecall

    # Exit
    li a7, 10
    ecall
