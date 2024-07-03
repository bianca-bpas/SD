.data
prompt1: .asciiz "Enter first number: "
prompt2: .asciiz "Enter second number: "
sum_msg: .asciiz "Soma: "

.text
.globl main
main:
    # Prompt for first number
    la $a0, prompt1
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $s0, $v0  # Store first number in $s0

    # Prompt for second number
    la $a0, prompt2
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $s1, $v0  # Store second number in $s1

    # Call the add_numbers function
    move $a0, $s0
    move $a1, $s1
    jal add_numbers
    move $s2, $v0  # Store the result in $s2

    # Print the result
    la $a0, sum_msg
    li $v0, 4
    syscall

    move $a0, $s2
    li $v0, 1
    syscall

    # Exit the program
    li $v0, 10
    syscall

add_numbers:
    add $v0, $a0, $a1  # Add the two numbers and store the result in $v0
    jr $ra            # Return to the caller
