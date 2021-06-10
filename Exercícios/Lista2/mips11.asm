# 11)
# j = 0;
# i = 10;
# do
# {
#     j = j + 1;
# }
# while ( j != i );
#
# $s2	= j
# $s3	= i

.text
.globl main # rótulo onde o programa começa

main:
# Inicialização das variáveis
addi	$s2	, $zero	, 0		# j = 0
addi	$s3	, $zero	, 10		# i = 10

do:
addi	$s2	, $s2	, 1		# j = j + 1
bne	$s2	, $s3	, do		# goto do: if ($s2 != $s3)