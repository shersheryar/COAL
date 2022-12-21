[org 0x0100]
jmp start
clearscreen:
    mov ah, 07h     ;scrool down function
    xor al, al      ;NUMER OF LINES BY which to scrool up
    mov ch, 9
    mov cl, 30      ;upper left corner ch= row cl = c0lumn
    ; mov dx, 174fh   ;lower ruht corner dh-row dl=column
    mov dh, 15
    mov dl, 50
    mov bh, 50h     ;blackonblack
    int 10h

ret
start:
call clearscreen
mov ax, 0x4c00
int 0x21s