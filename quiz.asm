[org 0x0100]
mov  bl, [divisor] ;M
mov  al, [dividend] ;Q
mov ah, [accumulator] ;A
mov  cl, 8 ;n

jmp start
yes:
    shr al,1
    shl al,1
    add ah,bl

jmp main
no:

    mov dl,1
    shr al,1
    shr dl,1
    rcl al,1
jmp main


start:

outerloop:
    shl ax,1
    sub ah,bl
    jc  yes
    jmp no

    main:
    loop outerloop
    mov ax, 0x4c00
    int 0x21

divisor: db 7
dividend: db 19
accumulator: db 0






