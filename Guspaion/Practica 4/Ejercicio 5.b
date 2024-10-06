	.data
A:	.word	4
B:	.word	2
C:	.word	0		

	.code
ld	$t0, A($zero)
ld	$t1, B($zero)
daddi	$t2, r0, 1
daddi 	$t3, r0, 2
beqz	$t1, es_cero
slt	$t4, $t0, $t1
beq	$t4, $t2, es_menor
dmul	$t5, $t0, $t3
j	fin
es_cero:
dadd	$t5, r0, r0
j	fin  
es_menor:
dadd	$t5, $t1, r0
j	fin
fin:
sd	$t5, C ($zero)
halt
