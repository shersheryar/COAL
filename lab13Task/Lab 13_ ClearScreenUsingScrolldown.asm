org 100h

jmp start

clearscreen:
    MOV AH, 07h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    MOV DX, 184FH  ; lower right corner DH=row, DL=column 
    MOV BH, 00h    ; BlackOnBlack
    INT 10H
ret

start: 

call clearscreen

mov ax, 0x4c00 ; terminate program
int 0x21
