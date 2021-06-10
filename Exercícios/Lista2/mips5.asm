# 5)
# x	= 305419896;
# 
# $s0	= x

.text
.globl main
main:
ori	$t0	, $zero	, 0x1234	# $t0	= 0x1234
sll	$t0	, $t0	, 16		# $t0	= $t0 << 16	= 0x12340000
ori	$s0	, $t0	, 0x5678	# x	= 0x12345678