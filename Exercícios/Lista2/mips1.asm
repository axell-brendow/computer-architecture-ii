# 1)
# a = 10;
# b = -1;
# a = a + 1;
# c = a + b;
# 
# $s0	= a
# $s1	= b
# $s2	= c

.text
.globl main
main:
addi	$s0	, $zero	, 10		# a	= 10
addi	$s1	, $zero	, -1		# b	= -1
addi	$s0	, $s0	, 1		# a	= a + 1
add	$s2	, $s0	, $s1		# c	= a + b