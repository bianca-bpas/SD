.data
x: .word 10
y: .word 20
z: .word 0
msg: .asciiz "O valor de z é: "

.text
.globl main
main:
    lw $t0, x($zero)   # carrega x em $t0
    lw $t1, y($zero)   # carrega y em $t1
    
    BEQ $t0, $t1, ELSE # desvia para ELSE se x == y
    
    # THEN
    sub $t2, $t0, $t1  # z = x - y
    sw $t2, z($zero)   # armazena z
    j EXIT            # desvia para EXIT
    
ELSE:
    sub $t2, $t1, $t0  # z = y - x
    sw $t2, z($zero)   # armazena z
    
EXIT:
    lw $t3, z($zero)   # carrega o valor de z em $t3
    
    # Imprime a mensagem
    la $a0, msg       # carrega o endereço da mensagem em $a0
    li $v0, 4         # código de sistema para imprimir string
    syscall           # imprime a mensagem
    
    # Imprime o valor de z
    move $a0, $t3     # move o valor de z para $a0
    li $v0, 1         # código de sistema para imprimir inteiro
    syscall           # imprime o valor de z
    
    li $v0, 10        # código de sistema para encerrar
    syscall           # encerra o programa
