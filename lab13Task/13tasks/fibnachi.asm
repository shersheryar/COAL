[org 0x0100]
jmp start
Section .data
sum dw 30,0
resb 30
; msg db 'Enter a number:  $'
; num dd 0 , '$'


fib:
    push bp
    mov bp, sp
    mov dx, [bp + 4]
    mov [num],ax
    add ax, dx
    mov [sum + si], ax
    pop bp
    cmp cx, 0

    je end
    sub cx, 1
    add si,2
    mov bx, [num]
    push bx
    call fib

    
     
    end:
ret 2


start:
    mov si, 6
    mov ax, 1
    mov cl, 3
    mov [sum + 4], ax
    mov bx, [num]
    push bx
    call fib
    mov ax, 0x4c00
    int 0x21
    num: dw 0
    