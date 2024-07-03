.data
x: .word 10
y: .word 20
z: .word 0
msg1: .asciiz "Case 1\n"
msg2: .asciiz "Case 2\n"
msg3: .asciiz "Case 3\n"
msg4: .asciiz "Default case\n"

.text
.globl main
main:
    lw $t0, x($zero)   # load x into $t0
    li $t1, 1         # load case value 1 into $t1
    li $t2, 2         # load case value 2 into $t2
    li $t3, 3         # load case value 3 into $t3

    # Implement switch-case
    beq $t0, $t1, case1
    beq $t0, $t2, case2
    beq $t0, $t3, case3
    j default_case

case1:
    la $a0, msg1      # load address of msg1 into $a0
    li $v0, 4        # system call code for printing string
    syscall          # print msg1
    j end

case2:
    la $a0, msg2      # load address of msg2 into $a0
    li $v0, 4        # system call code for printing string
    syscall          # print msg2
    j end

case3:
    la $a0, msg3      # load address of msg3 into $a0
    li $v0, 4        # system call code for printing string
    syscall          # print msg3
    j end

default_case:
    la $a0, msg4      # load address of msg4 into $a0
    li $v0, 4        # system call code for printing string
    syscall          # print msg4
    j end

end:
    li $v0, 10       # system call code for exit
    syscall          # exit the program
