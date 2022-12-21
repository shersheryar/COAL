org 100h

SECTION .TEXT

jmp start

getTime:
;INT 1Ah / AH = 00h - get system time.
mov cx, 0
mov AH, 00h 
INT 1Ah 
; return:
; CX:DX = number of clock ticks since midnight.
; AL = midnight counter, advanced each time midnight passes.

ret

start
call getTime

mov ax, 0x4c00 ; terminate program
int 0x21
