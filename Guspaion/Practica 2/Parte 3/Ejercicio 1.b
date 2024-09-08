PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

ORG 3000h ;Subrutinas
ini_pio:
  mov AL, 0FFh
  out CA, AL
  mov AL, 0
  out CB, AL
  ret

recibir_caracter:
  mov AL, 0FFh
  out PB, AL
  in AL, PA
  cmp AL, 0
  JNZ recibir_caracter
  ret

ORG 2000h ;Programa principal
  call ini_pio
  call recibir_caracter
  int 0
END
