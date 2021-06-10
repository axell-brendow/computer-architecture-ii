# 12)
# i = 2
# h = 100
# do
# {
#     a[i] = a[i - 1] + a[i - 2];
#     i = i + 1;
# } while ( i != h );
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
addi	$s0	, $zero	, 100		# h = 100
ori	$s1	, $zero	, 0x1001
sll	$s1	, $s1	, 16
ori	$s1	, $s1	, 0x0000	# A = 0x10010000
addi	$s3	, $zero	, 2		# i = 2

do:

add	$a0	, $zero	, $s1		# Coloca o endereço base no primeiro argumento
add	$a1	, $zero	, $s3		# Coloca o índice no segundo argumento
jal	calcular_endereco		# Calcula o endereco do elemento no arranjo
add	$t9	, $zero	, $v0		# Coloca o retorno da função em $t9

lw	$t0	, -4	($t9)		# $t0 = A[i - 1]
lw	$t1	, -8	($t9)		# $t1 = A[i - 2]
add	$t0	, $t0	, $t1		# $t0 = A[i - 1] + A[i - 2]
sw	$t0	, 0	($t9)		# A[i] = $t0
addi	$s3	, $s3	, 1		# i = i + 1

bne	$s3	, $s0	, do		# goto do: if (i != h)

.data
A0:	.word	1
A1:	.word	1