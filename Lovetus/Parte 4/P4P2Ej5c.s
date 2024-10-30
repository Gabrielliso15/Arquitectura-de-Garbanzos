    .data
X: .byte 0
Y: .byte 0
color: .byte 50, 100, 200, 0
CONTROL: .word 0x10000
DATA: .word 0x10008
RVAR: .byte 0x80
GVAR: .byte 0x40
BVAR: .byte 0x20

    .code
  lwu $s0, CONTROL($0)
  lwu $s1, DATA($0)
  lbu $t1, Y($0)
  lbu $t2, X($0)
  daddi $t4, $0, 50
  daddi $a0, $0, color
loop:
  lbu $a1, RVAR($0)
  lbu $a2, GVAR($0)
  lbu $a3, BVAR($0)
  lwu $t0, color($0)
  sw $t0, 0($s1)
  sb $t1, 4($s1)
  sb $t2, 5($s1)
  daddi $t5, $0, 5
  sd $t5, 0($s0)
  daddi $t2, $t2, 1
  bne $t2, $t4, loop
  daddi $t2, $0, 0
  daddi $t1, $t1, 1
  lbu $t3, 0($a0)
  xor $t6, $a1, $t3
  daddi $a1, $a1, 5
  sb $t6, 0($a0)
  sb $a1, RVAR($0)
  lbu $t3, 1($a0)
  xor $t6, $a2, $t3
  daddi $a2, $a2, 5
  sb $t6, 1($a0)
  sb $a2, GVAR($0)
  lbu $t3, 2($a0)
  xor $a3, $a3, $t3
  daddi $a3, $a3, 5
  sb $t6, 2($a0)
  sb $a3, BVAR($0)
  bne $t1, $t4, loop
  halt
