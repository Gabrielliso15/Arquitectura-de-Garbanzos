	.data
N:	.word 	4
F:	.word	0

	.code
ld 	$t0, N($zero)
ld	$t1, F($zero)
daddi	$t2, $t1, 1
loopardios:
daddi	$t1, $t1, 1
dmul	$t2, $t2, $t1
beq	$t1, $t0, fin
j	loopardios
fin:
sd	$t2, F($zero)
halt
