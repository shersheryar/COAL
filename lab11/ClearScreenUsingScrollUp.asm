[org 0x0100]
jmp start

clearscreen:
    ;clear screen ma 5 chezin aata ha
    ;1-> clear screen interrpt
    mov ah, 07
    ;2->kitna lines clear kerna ha jo (al) ma store hoga
    xor al, al
    ;3->kahan sa start kerna ha
    xor cx, cx
    ;4->or kahan tak jana ha
    mov dx,184FH
    ;5-> color knsa dena ha
    mov bh, 00h
    ;or akher ha interupt 
    int 10H

ret

start:
    call clearscreen
    
    mov ax, 0x4c00
    int
; org 100h

; jmp start

; clearscreen:
;     MOV AH, 07h    ; Scroll up function
;     XOR AL, AL     ; number of lines by which to scroll up
;     ; (00h = clear entire window)
;     XOR CX, CX     ; Upper left corner CH=row, CL=column
;     MOV DX, 184FH  ; lower right corner DH=row, DL=column 
;     MOV BH, 00h    ; BlackOnBlack
;     INT 10H
; ret

; start: 

; call clearscreen

; mov ax, 0x4c00 ; terminate program
; int 0x21