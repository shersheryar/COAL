org 100h

jmp start

var db 10,0, dup('$'),
resb 10
setmode:
    mov al, 03h
    mov ah, 00h
    int 10h

ret
array:
    mov si, 2
    l1:
    mov ah, 1
    int 21h
    cmp al, 13
    je end
    mov [var+si],al
    add si,1
    end:
        mov dx, var
        mov ah, 9
        int 21h

ret
start: 
; call setmode
; call setcursor
; call  star
call array

mov ax, 0x4c00 ; terminate program
int 0x21