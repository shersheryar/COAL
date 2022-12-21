org 100h
mov ax, 0
arr db 1,0,1,2,3
; resw 10
mov byte[arr+3] , 4
mov byte[arr+4] , 6
mov ax, arr
; mov ds, ax
; mov si, 3
mov dx, arr
add dx,30h
mov ah, 02
int 21h

mov ax, 0x4c00
int 21h