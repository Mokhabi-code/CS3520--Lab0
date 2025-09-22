
#include <iostream>
#include <string>

#using namespace std;

#int main() {
#    // Array of day names
#    string days[] = {
#        "Mantaha",
#        "Labobeli",
#        "Laboraro",
#        "Labone",
#        "Labohlano",
#        "Moqebelo",
#        "Sontaha"
#    };

#    int day_num;
#    cout << "Enter day number (1-7): ";
#    cin >> day_num;

#    if (day_num < 1 || day_num > 7) {
#        cout << "Invalid day number\n";
#    } else {
#        cout << days[day_num - 1] << "\n";
#    }

#    return 0;
#}

.data
prompt:   .asciz "Enter day number (1-7): "
error:    .asciz "Invalid day number\n"

# Individual day strings
day1:     .asciz "Mantaha"
day2:     .asciz "Labobeli"
day3:     .asciz "Laboraro"
day4:     .asciz "Labone"
day5:     .asciz "Labohlano"
day6:     .asciz "Moqebelo"
day7:     .asciz "Sontaha"

# Pointer table to day strings 
days:
    .word day1, day2, day3, day4, day5, day6, day7

.text
.globl _start
_start:
    # Print prompt
    la a0, prompt
    li a7, 4         
    ecall

    # Read integer input
    li a7, 5         
    ecall
    mv t0, a0         # store input in t0

    # Check if input < 1 -> invalid
    li t1, 1
    blt t0, t1, invalid

    # Check if input > 7 -> invalid
    li t2, 7
    bgt t0, t2, invalid

    # Calculate zero-based index (input - 1)
    addi t0, t0, -1

    # Load base address of days table
    la t3, days

    # Calculate address offset: t0 * 4 (word size)
    slli t4, t0, 2
    add t3, t3, t4

    # Load pointer to selected day string into a0
    lw a0, 0(t3)

    # Print day string
    li a7, 4          
    ecall

    j exit

invalid:
    # Print error message
    la a0, error
    li a7, 4          
    ecall

exit:
    #Exiting
    li a7, 10         
    ecall
