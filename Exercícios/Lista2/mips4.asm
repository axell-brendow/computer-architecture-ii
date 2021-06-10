# 4)
# x = 3;
# y = x / 4;
# 
# $s0	= x
# $s1	= y

.text
.globl main
main:
addi	$s0	, $zero	, 3		# x	= 3
srl	$s1	, $s0	, 2		# $s1	= x / 4