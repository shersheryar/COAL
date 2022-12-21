org 100h
jmp start
Section .data

newLine db 0x0a, '$'
msg db 'Enter the number: $'
answer db 12, 0
resb 12
reverse db 12, 0
resb 12

convert:
    mov si,12
    mov di, 2
    data1:
    mov al,[answer + si]
    mov [reverse + di], al
    add di,1
    sub si,1
    cmp si,1
    jne data1
ret

printf:
    push bp;
    mov bp, sp;
    mov dx , [bp+ 4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp;

ret 2
printscr:
    mov cx, 12; calculate message size
    mov al, 1
    mov bh, 0
    mov bl, 05  ;color tdatahe test and background

    mov dh, 10  ;row number 5
    mov dl, 0  ;colowm nnumber 12
    push cs
    pop es
    mov bp, reverse + 2
    mov ah, 13h     ;TO PRINT STRING ON SCREEN WE use 13h function
    int 10h


ret
getNumber:
    mov dx, answer
    mov ah, 0x0a
    int 0x21
ret
goToNewLine:
    mov dx, newLine
    mov  ah, 9          ; DOS print-string function
    int  0x21
    ret

start:
    mov ax, msg
    push ax
    call printf
    call getNumber
    ; call printscr
    call goToNewLine
    call convert
    call printscr
    

    ; call printNumber
mov ax, 0x4c00
int 0x21

