# programa 15
# $s0	= contador
# $s1	= end. base
# $s2	= copia end. base
# $s3	= soma
# $t0	= end. base[contador]

.text
.globl main

main:

lui	$s0	, 0x1001		# calcula o endereco $s0
add	$s2	, $s1	,	$zero	# copia end. base = end. base
addi	$s0	, $zero	,	100	# contador = 100
add	$s3	, $zero	,	$zero	# soma = 0

dowhile:
sw	$s0	, 0	($s2)		# *copia end. base = contador
lw	$t0	, 0	($s2)		# $t0 = *copia end. base
addi	$s2	, $s2	, 4		# copia end. base = copia end. base + 4
addi	$s0	, $s0	, -1		# contador = contador - 1
add	$s3	, $s3	, $t0		# soma = soma + *copia end. base
bne	$s0	, $zero	, dowhile	# jump to do: if contador != 0

sw	$s3	, 0	($s2)		# *copia end. base = soma