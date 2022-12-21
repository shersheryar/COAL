[org 0x0100]
xor ax, ax
xor bx,bx
xor cx,cx
xor dx,dx
jmp main

Sum:
    push bp
    mov  bp, sp
    mov ax,[bp + 6]
    mov  dx, [bp + 4]   ; second parameter
    add ax, dx
    pop bp
ret



ret

main:
mov cx,7
tag:
    mov dx,[data+bx]
    add bx,2
    push ax
    push dx
    call Sum
loop tag
mov [result],ax
; call Sum
    mov ax, 0x4c00
    int 0x21
data: dw 1,2,1,1,1,1,1
result: dw 0