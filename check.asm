[org 0x0100]

jmp main
Prod:
    push bp
    mov  bp, sp
 
    mov  ax, [bp + 6]   ; frist parameter
    mov  bx, [bp + 4]   ; second parameter
    mul bx
    mov [resultMul],ax
    mov ax,[bp + 6]
    div bx
    mov[resultDiv],ax

    pop bp
ret


main:
 mov ax, 4
 mov bx, 3

 push ax
 push bx

call Prod


    mov  ax, 0x4c00
    int  0x21
resultMul:dw 0
resultDiv:dw 0