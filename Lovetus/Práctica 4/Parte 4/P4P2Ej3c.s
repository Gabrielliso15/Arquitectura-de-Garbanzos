    .data
NUM1: .word 0
NUM2: .word 0
SUM: .ascii "+"
SUB: .ascii "-"
DIV: .ascii "/"
MUL: .ascii "*"
OPERACION: .ascii " "
TOTAL: .word 0

CONTROL: .word 0x10000
DATA: .word 0x10008

    .code
  ld $t0, CONTROL($0)
  ld $t1, DATA($0)

  ; Leo 1er operando
  daddi $t2, $0, 8
  sd $t2, 0($t0)
  ld $t3, 0($t1)

LOOPOP:
  ; Leo operación
  daddi $t2, $0, 9
  sd $t2, 0($t0)
  ld $t4, 0($t1)

  ; Leo 2do operando
  daddi $t2, $0, 8
  sd $t2, 0($t0)
  ld $t5, 0($t1)

  ; Compruebo operación
  lbu $t6, SUM($0)
  bne $t4, $t6, SUBIF
  dadd $t3, $t3, $t5
  sd $t3, TOTAL($0)
  j IMPRIMIR

SUBIF:
  lbu $t6, SUB($0)
  bne $t4, $t6, DIVIF
  dsub $t3, $t3, $t5
  sd $t3, TOTAL($0)
  j IMPRIMIR

DIVIF:
  lbu $t6, DIV($0)
  bne $t4, $t6, MULIF
  ddiv $t3, $t3, $t5
  sd $t3, TOTAL($0)
  j IMPRIMIR

MULIF:
  lbu $t6, MUL($0)
  bne $t4, $t6, FIN
  dmul $t3, $t3, $t5
  sd $t3, TOTAL($0)

  ; Imprimo resultado
IMPRIMIR:
  sd $t3, 0($t1)
  daddi $t2, $0, 2
  sd $t2, 0($t0)
  j LOOPOP
FIN:
  halt
