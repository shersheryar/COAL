;Bubble sort
[org 0x0100]
jmp start
section .data
newLine db 0x0a, '$'
msg db 'Enter the numbers: $'
msg2 db 'Enter the value of k: $'
k db 3, 0
resb 3
array db 12,0
resb 12

section .text
printf:
    push bp
    mov bp, sp
    mov dx, [bp + 4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp
ret 2

getNumber:
    mov dx, array
    mov ah, 0x0a
    int 21h
ret
getk:
    mov dx, k
    mov ah, 0x0a
    int 21h
ret

printArr:
    
    mov cx, 0; calculate message size
    mov cl, [k + 2]
    sub cl,30h
    ; mov cl, [array +1]
    mov al, 1
    mov bh, 0
    mov bl, 05  ;color tdatahe test and background

    mov dh, 20  ;row number 5
    mov dl, 0  ;colowm nnumber 12
    push cs
    pop es
    mov bp, array + 2
    mov ah, 13h     ;TO PRINT STRING ON SCREEN WE use 13h function
    int 10h

ret
goToNewLine:
    mov dx, newLine
    mov  ah, 9          ; DOS print-string function
    int  0x21
ret
swapflag:   db  0
sort:
    mainloop:
        mov si, 2
        mov byte[swapflag], 0
        innerloop:
            mov al,[array + si]
            sub al, 30h
            mov bl, [array + si + 1]
            sub bl, 30h
            cmp al, bl
            jg noswap
            add al, 30h
            mov [array + si + 1], al
            add bl, 30h
            mov [array + si], bl
            mov byte[swapflag], 1
            noswap:
            add si, 1

            cmp si, 12
            jl innerloop
        cmp byte[swapflag], 1
        je mainloop
ret



start:
    mov ax, msg
    push ax
    call printf
    call getNumber
    call goToNewLine
    mov ax, msg
    push ax
    call printf
    call getk
    call goToNewLine
    call sort
    call printArr

mov ax,0x4c00
int 0x21