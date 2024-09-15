EOI EQU 20h
IMR EQU 21h
INT1 EQU 25h
CONT EQU 10h
COMP EQU 11h

N_TIMER EQU 15

ORG 60
IP_TIMER DW RUT_TIMER

ORG 1000h; Memoria de datos
msj db "Larga vida al Imperator Porkus", 0Ah
finmsj db ?

ORG 3000h ;Subrutinas
RUT_TIMER:
  push AX
  mov AL,0
  out CONT, AL
  in AL, EOI
  out EOI, AL
  pop AX
  int 7
  inc DH
  iret

ORG 2000h ;Programa principal
  CLI
  mov AL, 11111101b
  out IMR, AL
  mov AL, N_TIMER
  out INT1, AL
  mov AL, 2
  out COMP, AL
  mov BX, offset msj
  mov AL, offset finmsj - offset msj
  mov DH, 0
  STI
LAZO:
  cmp DH, 5
  jnz LAZO
  int 0
END
