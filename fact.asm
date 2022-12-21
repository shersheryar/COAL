[org 0x0100]
xor ax, ax
xor bx,bx
xor cx,cx
xor dx,dx
jmp main

fact:
    push bp
    mov  bp, sp
    mov ax,[bp + 6]
    mov  dx, [bp + 4]   ; second parameter
    mul dx
    pop bp
ret



ret

main:
mov cx,5
mov ax,1
tag:
    mov dx, cx
    push ax
    push dx
    call fact
    cmp cx,1
loopne tag
mov [result],ax
; call Sum
    mov ax, 0x4c00
    int 0x21

result: dw 0