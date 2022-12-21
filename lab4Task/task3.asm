[org 0x0100]
xor ax, ax
xor bx,bx
xor cx,cx
xor dx,dx
jmp main

Sum:
    mov cx, 7
    tag1:
        add ax,[data + bx]
        add bx,2
    loop tag1
ret



ret

main:

call Sum
mov [result],ax
; call Sum
    mov ax, 0x4c00
    int 0x21
data: dw 1,2,1,1,1,1,1
result: dw 0