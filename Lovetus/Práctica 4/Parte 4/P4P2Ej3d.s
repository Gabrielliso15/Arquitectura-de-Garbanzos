    .data
BASE: .word 0
ALTURA: .word 0
SUPERFICIE: .word 0
MSJBASE: .asciiz "Ingrese la base: "
MSJALT: .asciiz "Ingrese la altura: "

CONTROL: .word 0x10000
DATA: .word 0x10008

    .code
  ld $t0, CONTROL($0)
  ld $t1, DATA($0)

  ; Msj base
  daddi $t2, $0, MSJBASE
  sd  $t2, 0($t1)
  daddi $t2, $0, 4
  sd $t2, 0($t0)
  ; Leo base
  daddi $t2, $0, 8
  sd $t2, 0($t0)
  ld $t3, 0($t1)

  ; Msj altura
  daddi $t2, $0, MSJALT
  sd  $t2, 0($t1)
  daddi $t2, $0, 4
  sd $t2, 0($t0)
  ; Leo altura
  daddi $t2, $0, 8
  sd $t2, 0($t0)
  ld $t4, 0($t1)

  ; Calculo resultado
  dmul $t5, $t3, $t4
  daddi $t6, $0, 2
  ddiv $t7, $t5, $t6
  ; Imprimo resultado
  sd $t7, 0($t1)
  daddi $t2, $0, 2
  sd $t2, 0($t0)
FIN:
  halt
