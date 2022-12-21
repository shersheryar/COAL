
org 100h

jmp start
clrscr:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nextloc:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  nextloc

    pop  di 
    pop  ax
    pop  es
    ret
setBorderColor:
;// Left side column
    MOV AH, 06h    ; Scroll up function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    MOV DX, 3501H  ; lower right corner DH=row, DL=column 
    MOV BH, 1Eh    ; YellowOnBlue
    INT 10H
;// Right side column
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    ;XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov ch, 00
    mov cl, 78
    MOV DX, 2475H  ; lower right corner DH=row, DL=column 
    MOV BH, 1Eh    ; YellowOnBlue
    INT 10H
;// Top Row
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    ;XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov ch, 00h
    mov cl, 00h
    MOV DX, 0179H  ; lower right corner DH=row, DL=column 
    MOV BH, 1Eh    ; YellowOnBlue
    INT 10H
    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX

;// Bottom Row
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    ;XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov ch, 18h ; 24= 18 hex
    mov cl, 00h 
    MOV DX, 1879H  ; lower right corner DH=row, DL=column 
    MOV BH, 1Eh    ; YellowOnBlue
    INT 10H
    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret

start: 
call clrscr
call setBorderColor 
mov ax, 0x4c00 ; terminate program
int 0x21
