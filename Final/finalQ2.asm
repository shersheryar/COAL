org 100h


jmp start
section.data
num dw 0
msg1: db 'I$'
msg2: db 'Love$'
msg3: db 'Pakistan$'

section.code
printf: 
    mov ah ,9
    int 21h

ret
clearscreen:
    mov ah ,06h
    xor al , al
    mov ch , 0
    mov cl , 0
    mov dh , 24
    mov dl , 79
    mov bh , 07h
    int 10h 
ret

cursor1:
     ; mov dx , 0c23h
     mov dh , 20
     mov dl , 12
     mov bh , 0
     mov ah , 02h 
     int 10h 
ret

cursor2:
     ; mov dx , 0c23h
     mov dh , 13
     mov dl , 38
     mov bh , 0
     mov ah , 02h 
     int 10h 
ret


cursor3:
     ; mov dx , 0c23h
     mov dh , 7
     mov dl , 63
     mov bh , 0
     mov ah , 02h 
     int 10h 
ret
cursor4:
     ; mov dx , 0c23h
     mov dh , 24
     mov dl , 1
     mov bh , 0
     mov ah , 02h 
     int 10h 
ret


square:
    ;top left square
    mov ah ,06h
    xor al , al
    mov ch , 2
    mov cl , 1
    mov dh , 12
    mov dl , 26
    mov bh , 70h
    int 10h
    ;top right square
    mov ah ,06h
    xor al , al
    mov ch ,2
    mov cl , 52
    mov dh , 12
    mov dl , 78
    mov bh , 70h
    int 10h 
    ;center square
    mov ah ,06h
    xor al , al
    mov ch ,8
    mov cl , 26
    mov dh , 18
    mov dl , 52
    mov bh , 70h
    int 10h 
    ;bottom left square
    mov ah ,06h
    xor al , al
    mov ch ,16
    mov cl , 1
    mov dh , 24
    mov dl , 26
    mov bh , 70h
    int 10h 
    ;bottom right square
    mov ah ,06h
    xor al , al
    mov ch ,16
    mov cl , 52
    mov dh , 24
    mov dl , 78
    mov bh , 70h
    int 10h 
   
ret


start:

    call clearscreen


    call square

    call cursor1
    mov dx,msg1
    call printf
    call cursor2
    mov dx,msg2
    call printf
    call cursor3
    mov dx,msg3
    call printf
    call cursor4


   mov ax , 0x4c00
int 0x21

