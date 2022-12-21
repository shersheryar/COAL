[org 0x0100]
jmp start
Section .data
msg db 'Enter a number:  $'
num dd 0 , '$'

Section .code
printf:
    push bp;
    mov bp, sp;
    mov dx , [bp+ 4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp;

ret 2

scanchr:
    ;take input
    mov ah, 7
    int 21h; input character will be stored in al
    mov [num] , al
    ;print the entered character
    mov dx, num
    mov ah, 9
    int 21h
ret 2

scanString:
mov ah, 7
int 21h
mov byte[num], al;; input character wil be stored in al
mov ah, 7
int 21
mov byte[num+1], al; input character wil be stored in al
mov ah, 7
int 21h
mov byte[num+2], al; input character wil be stored in al
mov ah, 7
int 21h
int 21h; input character wil be stored in al

;print the entered number
mov dx, num
mov ah, 9
int 21h

ret 2
start:

    mov ax, msg
    call printf
    call scanString
    mov ah, 4ch
    int 21h