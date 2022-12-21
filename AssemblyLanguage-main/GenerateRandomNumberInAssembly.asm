org 100h

SECTION .TEXT
jmp start

generateRamdomNo:
;***********Get number of clock ticks*******
mov cx, 0
mov AH, 00h
INT 1Ah  ;output will be in dx

mov ax, DX ; number of clock ticks since midnight.
mov dx, 00h
mov bx, 10 ; Random No between 0-10
div bx
;***********How Reminder work*******
; output will be in dx. 
; mov ax, 1234          ; dividend low half
; mov dx, 0             ; dividend high half = 0.  prefer  xor dx,dx
; mov bx, 10            ; divisor can be any register or memory
; div bx       ; Divides 1234 by 10.
;         ; DX =   4 = 1234 % 10  remainder
;         ; AX = 123 = 1234 / 10  quotient

; // Print the a character on screen 
   add  dl, 30h  ; to ascii conversion
;    print the number 
   mov ah, 2h   ; call interrupt to display a value in DL
   int 21h
ret 
ret
start

call generateRamdomNo
mov ax, 0x4c00 ; terminate program
int 0x21
