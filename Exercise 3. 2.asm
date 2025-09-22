
#include <iostream>

#using namespace std;

#int main() {
#    int cattle;

#    // input from the user
#    cout << "Enter number of cattle: ";
#    cin >> cattle;

#    // Check conditions
#    if (cattle < 5) {
#        cout << "Not enough for bohali" <<endl;
#    } else if (cattle <= 20) {
#        cout << "Small herd" <<endl;
#    } else {
#        cout << "Wealthy cattle owner" <<endl;
#    }

#    return 0;
#}

.data
prompt:     .asciz "Enter number of cattle: "
msg_not:    .asciz "Not enough for bohali\n"
msg_small:  .asciz "Small herd\n"
msg_wealthy:.asciz "Wealthy cattle owner\n"

.text
.globl _start
_start:
    # input from the user
    la a0, prompt
    li a7, 4
    ecall

    # Read input
    li a7, 5
    ecall
    mv t0, a0

    # if t0 < 5 => Not enough for bohali
    li t1, 5
    blt t0, t1, not_enough

    # if 5 <= t0 <= 20 => Small herd
    li t2, 20
    ble t0, t2, small_herd

    # else Wealthy cattle owner
wealthy:
    la a0, msg_wealthy
    li a7, 4
    ecall
    j exit

small_herd:
    la a0, msg_small
    li a7, 4
    ecall
    j exit

not_enough:
    la a0, msg_not
    li a7, 4
    ecall

exit:
    li a7, 10
    ecall
