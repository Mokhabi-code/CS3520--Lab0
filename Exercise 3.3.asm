
#include <iostream>
#include <string>

#using namespace std;

#int main() {
#    int height;

 #   // collect input from the user
 #   cout << "Enter height of Mokorotlo: ";
 #   cin >> height;

#    // Print Mokorotlo
#    for (int i = 1; i <= height; ++i) {
#        for (int space = 0; space < height - i; ++space) {
#            cout << " ";
#        }
#        for (int star = 0; star < 2 * i - 1; ++star) {
#            cout << "*";
#        }

#        // New line after each row
#        cout <<endl;
#    }

#    return 0;
#}



.data
prompt:     .asciz "Enter height of Mokorotlo: "
newline:    .asciz "\n"
star:       .asciz "*"
space:      .asciz " "

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
    mv t0, a0           # t0 = height

    li t1, 1            # line counter starting at 1

print_line:
    bgt t1, t0, done    # if t1 > height, done

    # Calculate spaces: t2 = t0 - t1
    sub t2, t0, t1

print_spaces:
    beqz t2, print_stars
    la a0, space        # address of " "
    li a7, 4            # print string
    ecall
    addi t2, t2, -1
    j print_spaces

print_stars:
    slli t3, t1, 1      # t3 = 2 * t1
    addi t3, t3, -1     # t3 = 2 * t1 - 1

print_star_loop:
    beqz t3, print_newline
    la a0, star         # address of "*"
    li a7, 4            # print string
    ecall
    addi t3, t3, -1
    j print_star_loop

print_newline:
    la a0, newline      # address of "\n"
    li a7, 4            # print string
    ecall

    addi t1, t1, 1      # next line
    j print_line

done:
    li a7, 10           
    ecall

