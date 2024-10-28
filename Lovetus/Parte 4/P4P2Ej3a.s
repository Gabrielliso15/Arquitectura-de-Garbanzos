    .data
NUM1: .word 0
NUM2: .word 0
SUM: .word 0

CONTROL: .word 0x10000
DATA: .word 0x10008

    .code
  ld $t0, CONTROL($0)
  ld $t1, DATA($0)
  daddi $t2, $0, 8
  sd $t2, 0($t0)
  ld $t3, 0($t1)
  sd $t2, 0($t0)
  ld $t4, 0($t1)
  dadd $t5, $t3, $t4
  sd $t5, 0($t1)
  daddi $t2, $0, 2
  sd $t2, 0($t0)
  halt
