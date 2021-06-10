# 10)
# h = A [ i ] ;
# A[ i ] = A [ i + 1] ;
# A [ i + 1] = h ;
# 
# $s0	= h
# $s1	= &A[0]
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
addi	$s3	, $zero	, 1		# i = 1

add	$a0	, $zero	, $s1		# Coloca o endereço base no primeiro argumento
add	$a1	, $zero	, $s3		# Coloca o índice no segundo argumento
jal	calcular_endereco		# Calcula o endereco do elemento no arranjo
add	$t9	, $zero	, $v0		# Coloca o retorno da função em $t9

lw	$s0	, 0	($t9)		# h = A[i]
lw	$t0	, 4	($t9)		# $t0 = A[i + 1]
sw	$t0	, 0	($t9)		# A[i] = $t0
sw	$s0	, 4	($t9)		# A[i + 1] = h

.data
A0:	.word	0
A1:	.word	1
A2:	.word	2