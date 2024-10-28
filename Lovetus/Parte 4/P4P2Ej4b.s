    .data
coorX: .byte 24 ; coordenada X de un punto
coorY: .byte 24 ; coordenada Y de un punto
color: .byte 0, 0, 0, 0 ; color: máximo rojo + máximo azul => magenta
CONTROL: .word 0x10000
DATA: .word 0x10008

    .code
  ld $t0, CONTROL($zero) ; $t0 = dirección de CONTROL
  ld $t1, DATA($zero) ; $t1 = dirección de DATA
  lbu $t6, color($zero)
  daddi $t7, $0, 255

LOOP:
  lwu $t2, color($zero) ; $t2 = valor de color a pintar (4 bytes)
  daddi $t6, $t6, 1
  sw $t2, 0($t1) ; DATA recibe el valor del color a pintar
  lbu $t3, coorX($zero) ; $t2 = valor de coordenada X
  sb $t3, 5($t1) ; DATA+5 recibe el valor de coordenada X
  sb $t6, color($0)
  lbu $t4, coorY($zero) ; $t2 = valor de coordenada Y
  sb $t4, 4($t1) ; DATA+4 recibe el valor de coordenada Y
  daddi $t5, $zero, 5 ; $t2 = 5 -> función 5: salida gráfica
  sd $t5, 0($t0) ; CONTROL recibe 5 y produce el dibujo del punto
  bne $t6, $t7, LOOP
  halt
