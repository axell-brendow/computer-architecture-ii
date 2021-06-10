# 9)
# A [ j ] = h + A [ i ];
# 
# $s0	= h
# $s1	= &A[0]
# $s2	= j
# $s3	= i

.text
.globl main # rótulo onde o programa começa
j main

# Calcula o endereco de um elemento em um arranjo.
#
# @param Em $a0, Endereço de início do arranjo.
# @param Em $a1, Indice do elemento que se deseja buscar.
#
# @return Em $v0, o endereço do elemento no índice informado.

# calcular_endereco( endereco_base, indice )
calcular_endereco:
sll	$t9	, $a1	, 2		# $t0	= indice * 4
add	$v0	, $a0	, $t9		# $v0	= endereço + 4 * indice
jr $ra

main:
addi	$s0	, $zero	, 1		# h = 1
ori	$s1	, $zero	, 0x1001
sll	$s1	, $s1	, 16
ori	$s1	, $s1	, 0x0000	# A = 0x10010000
addi	$s2	, $zero	, 1		# j = 1
addi	$s3	, $zero	, 1		# i = 1

add	$a0	, $zero	, $s1		# Coloca o endereço base no primeiro argumento
add	$a1	, $zero	, $s3		# Coloca o índice no segundo argumento
jal	calcular_endereco		# Calcula o endereco do elemento no arranjo
add	$t9	, $zero	, $v0		# Coloca o retorno da função em $t9

lw	$t0	, 0	($t9)		# Coloca A[i] em $t0
add	$t0	, $s0	, $t0		# Coloca em $t0 h + A[i]

add	$a0	, $zero	, $s1		# Coloca o endereço base no primeiro argumento
add	$a1	, $zero	, $s2		# Coloca o índice no segundo argumento
jal	calcular_endereco		# Calcula o endereco do elemento no arranjo
add	$t9	, $zero	, $v0		# Coloca o retorno da função em $t9

sw	$t0	, 0	($t9)		# Guarda h + A[i] em A[j]

.data
A0:	.word	0
A1:	.word	1