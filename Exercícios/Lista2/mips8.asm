# 8)
# h = k + A [ i ];
# 
# $s0	= h
# $s1	= &A[0]
# $s2	= k
# $s3	= i

.text
.globl main # r�tulo onde o programa come�a
j main

# Calcula o endereco de um elemento em um arranjo.
#
# @param Em $a0, Endere�o de in�cio do arranjo.
# @param Em $a1, Indice do elemento que se deseja buscar.
#
# @return Em $v0, o endere�o do elemento no �ndice informado.

# calcular_endereco( endereco_base, indice )
calcular_endereco:
sll	$t9	, $a1	, 2		# $t0	= indice * 4
add	$v0	, $a0	, $t9		# $v0	= endere�o + 4 * indice
jr $ra

main:
# Inicializa��o das vari�veis
addi	$s0	, $zero	, 1		# h = 1
addi	$s2	, $zero	, 1		# k = 1
addi	$s3	, $zero	, 1		# i = 1
ori	$s1	, $zero	, 0x1001
sll	$s1	, $s1	, 16
ori	$s1	, $s1	, 0x0000	# A = 0x10010000

add	$a0	, $zero	, $s1		# Coloca o endere�o base no primeiro argumento
add	$a1	, $zero	, $s3		# Coloca o �ndice no segundo argumento
jal	calcular_endereco		# Calcula o endereco do elemento no arranjo
add	$t9	, $zero	, $v0		# Coloca o retorno da fun��o em $t9

lw	$t0	, 0	($t9)		# Coloca A[i] em $t0
add	$s0	, $s2	, $t0		# h = k + A[i]

.data
A0:	.word	0
A1:	.word	1