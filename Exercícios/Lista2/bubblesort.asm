.text
.globl main
j main

bubblesort: #($a0 = end. base, $a1 = inicio, $a2 = numero de elementos a serem ordenados)
# $t9	= numero de elementos ordenados
# $t8	= endereco da bolha
# $t7	= indice final da ordenacao
# $t6	= indice da bolha
# $t5	= registrador para set on less than
# $t4	= elemento da bolha
# $t3	= elemento 'a esquerda da bolha (IMAGINANDO UM ARRANJO HORIZONTAL)
add	$t9	, $zero	, $zero		# numero de elementos ordenados
add	$t7	, $a1	, $a2		# indice final
addi	$t7	, $t7	, -1		# indice final

while:
	beq	$t9	, $a2	, end		# vai para end se ( numero de elementos ordenados == quantidade desejada (2º param) )
	add	$t6	, $zero	, $t7		# indice bolha = indice final de ordenacao
	
	for:
		slt	$t5	, $t9	, $t6		# $t5 = ( numero de elementos ordenados < indice bolha ) ? 1 : 0
		beq	$t5	, $zero	, endfor	# vai para endfor se ( numero de elementos ordenados >= bolha )
		sll	$t8	, $t6	, 2		# multiplica o indice por 4
		addi	$t6	, $t6	, -1		# indice bolha = indice bolha - 1
		add	$t8	, $a0	, $t8		# endereco bolha = endereco base + deslocamento
		lw	$t4	, 0	($t8)		# elemento da bolha = end. base[indice bolha]
		lw	$t3	, -4	($t8)		# elemento 'a esquerda da bolha = end. base[indice bolha - 1]
		slt	$t5	, $t4	, $t3		# $t5 = ( elem_bolha < elem_a_esq_bolha ) ? 1 : 0
		beq	$t5	, $zero	, for		# vai para for se ( elem_bolha >= elem_a_esq_bolha )
		sw	$t4	, -4	($t8)		# swap
		sw	$t3	, 0	($t8)		# swap
		
		j for
	endfor:
	
	addi	$t9	, $t9	, 1		# numero de elementos ordenados++
	j while
end:
jr $ra

main:

addi	$a0	,	$zero	,	0x1001
sll	$a0	,	$a0	,	16
addi	$a1	,	$zero	,	0
addi	$a2	,	$zero	,	5
jal bubblesort

.data
A0:	.word	3
A1:	.word	1
A2:	.word	2
A3:	.word	4
A4:	.word	0