[org 0x0100]
xor ax, ax
xor bx,bx
xor cx,cx
xor dx,dx
jmp main

add2:

    mov ax,[bp + 6]
    mov  dx, [bp + 4]  
    add ax, dx
    mov dx,[bp - 2]
    add ax, dx
    pop cx
    pop bp
 ret

add1:
    push bp
    mov  bp, sp
    mov ax,[bp + 6]
    mov  dx, [bp + 4]   ; second parameter
    add ax, dx
    mov cx, ax
    push cx
    call add2
    pop bp

ret


main:
    mov dx,[data+bx]
    add bx,2
    mov ax,[data + bx]
    push ax
    push dx
    call add1
mov [result],ax
; call Sum
    mov ax, 0x4c00
    int 0x21
data: dw 2,2
result: dw 0