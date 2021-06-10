# 13)
# if ((h >= 50 && h <= 100) ||(h >= 150 && h <= 200))
#     flag = 1;
# else
#     flag = 0;
# 
# $s0	= h
# $s1	= flag

.text
.globl main # rótulo onde o programa começa

main:
addi	$s0	, $zero	, 50		# h = 150

slti	$t1	, $s0	, 50		# set $t1 to 1 if h < 50
beq	$t1	, 1	, flag0		# goto flag0 if $t1 = 1
slti	$t1	, $s0	, 100		# set $t1 to 1 if h < 100
beq	$t1	, 1	, flag1		# goto flag1 if $t1 = 1
beq	$s0	, 100	, flag1		# goto flag1 if h = 100

slti	$t1	, $s0	, 150		# set $t1 to 1 if h < 150
beq	$t1	, 1	, flag0		# goto flag0 if $t1 = 1
slti	$t1	, $s0	, 200		# set $t1 to 1 if h < 200
beq	$t1	, 1	, flag1		# goto flag1 if $t1 = 1
beq	$s0	, 200	, flag1		# goto flag1 if h = 200

flag0:
addi	$s1	, $zero	, 0		# flag = 0
j final

flag1:
addi	$s1	, $zero	, 1		# flag = 1

final:

.data
A0:	.word	0
A1:	.word	2
A2:	.word	1