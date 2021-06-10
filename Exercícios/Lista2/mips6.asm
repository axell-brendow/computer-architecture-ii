# 6)
# x = -1;
# y = x / 32;
# 
# $s0	= x
# $s1	= y

.text
.globl main
main:
addi	$t0	, $zero	, 32	# t0	= 32
addi	$s0	, $zero	, -1	# x	= -1
#sra	$s1	, $s0	, 5	# y	= x / 32
div	$s0	, $t0		# $lo	= x / 32
mflo	$s1			# y	= x / 32