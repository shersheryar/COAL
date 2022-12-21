[org 0x100]
xor ax, ax
xor bx,bx
xor cx,cx
xor dx,dx
mov cx,10
jmp main

maximum:
    mov ax,[data + bx]
    div cx
    add ax,dx
    mov dx,0
    cmp [result],ax
    ja noSwap

    mov [result],ax

    noSwap:


ret

main:
    mov ax,0
    call maximum
    add bx,2
    cmp bx,6
    jne main
mov [result],ax
; call Sum
    mov ax, 0x4c00
    int 0x21
data: dw 47,72,31
result: dw 0
mod: dw 10