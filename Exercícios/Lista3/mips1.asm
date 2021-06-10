# Questão 1

.text
.globl main
main:
lui $t0, 0x1001
lw $a0, 0 ($t0)
lw $a1, 4 ($t0)
jal criarArranjo

li $v0, 10	# 10 = exit code
syscall

criarArranjo: # $a0 = endereço, $a1 = quantidade de elementos

	add $t0, $a0, $zero		# t0 = endereço
	addi $t5, $zero, 30		# t5 = 30
	add $t2, $zero, $zero		# t2 = contador = 0
	add $t6, $zero, $zero		# t6 = soma = 0

	addi $sp, $sp, -4		# aloca 4 bytes na pilha
	sw $ra, 4 ($sp)			# guarda ra no espaço alocado

	slt $t5, $t5, $a1 		# t5 = 30 < quantElem ? 1 : 0 que é equivalente a quantElem > 30
	beq $t5, $zero, dowhile		# vai para dowhile: se quantElem <= 30

	dowhile:
		add $a0, $zero, $t2	# a0 = contador
		jal pow2		# return contador * contador
		add $t1, $zero, $v0	# t1 = contador * contador
		
		andi $t4, $t2, 1	# t4 = t2 & 1;
		bne $t4, $zero, calculado # vai para calculado: se t4 != 0, ou seja, se t2 é ímpar
		
		par:
		sll $t1, $t1, 1		# t1 = t1 << 1 = 2 * t1
		add $t1, $t1, $t2	# t1 = t1 + contador
		add $t1, $t1, $t2	# t1 = t1 + contador
		addi $t1, $t1, 1	# t1 = t1 + 1
		
		calculado:
		add $t6, $t6, $t1	# soma = soma + valor calculado
		sw $t1, 0 ($t0)		# MEM[ endereço ] = t1 = ( contador % 2 == 1 ? contador² : 2contador² + 2contador + 1 )
		addi $t0, $t0, 4	# t0 = t0 + 4
		addi $t2, $t2, 1	# contador = contador + 1
		bne $t2, $a1, dowhile	# vai para dowhile: se contador != quantidade de elementos

	lw $ra, 4 ($sp)		# recupera ra
	addi $sp, $sp, 4	# desaloca o espaço
	add $v0, $zero, $t6	# v0 = soma
jr $ra

pow2:
	mult $a0, $a0
	mflo $v0
jr $ra


.data
endereco:	.word	0x10010008
quantElem:	.word	5
