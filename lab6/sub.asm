[org 0x0100]
jmp main

Sum:
    add ax, bx

ret


minus:
    sub ax, bx

ret

main:
mov ax, 3
mov bx, 4

call Sum
call minus
    mov ax, 0x4c00
    int 0x21