# 2)
# x = 3;
# y = x * 4 ;
# 
# $s0	= x
# $s1	= y

.text
.globl main
main:
addi	$s0	, $zero	, 3		# x	= 3
sll	$s1	, $s0	, 2		# y	= 4x