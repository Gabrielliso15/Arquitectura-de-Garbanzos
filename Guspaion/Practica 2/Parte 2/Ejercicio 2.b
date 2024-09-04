PA EQU 30h
CA EQU 32h
ORG 1000h
  no db "Libre"
ORG 2000H
  MOV AL,10
ocupada:
  out CA, al
  in al, PA
  AND AL, 1
  jnz ocupada
  MOV BX, OFFSET no
  MOV AL, 5
  INT 7
  int 0
end
