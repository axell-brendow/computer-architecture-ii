# 3)
# x = 3;
# y = x * 1025;
# 
# $s0	= x
# $s1	= y

.text
.globl main
main:
addi	$s0	, $zero	, 3		# x	= 3
sll	$t0	, $s0	, 10		# $t0	= 4x
add	$s1	, $t0	, $s0		# y	= $t0 + x