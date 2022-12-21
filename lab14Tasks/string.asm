[org 0x0100]
jmp start
section .data
newLine db 0x0a, '$'
msg db 'Enter the string: $'
msg2 db 'Enter the start index andd end index: $'
k db 4, 0
resb 4
array db 30,0
resb 30
newArray db 30, 0
resb 30     

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
copy:
    mov cx, 0; calculate message size
    mov dx, 0
    mov cl, [k + 3]
    sub cl, 30h
    add cl, 2
    mov dl, [k + 2]
    sub dl,30h
    add dl, 1
    sub cl, dl
    mov si, 2    ; new array index
    mov di, dx
    run:
        mov bx, [array + di] 
        mov [newArray + si], bx
        add si,1
        add di,1
        loop run
ret
printArr:
    mov cx, 0; calculate message size
    mov cl, [k + 3]
    sub cl, 30h
    mov dl, [k + 2]
    sub dl,30h
    sub cl, dl
    add cl, 2
    ; mov cl, [array +1]
    mov al, 1
    mov bh, 0
    mov bl, 05  ;color tdatahe test and background

    mov dh, 20  ;row number 5
    mov dl, 0  ;colowm nnumber 12
    push cs
    pop es
    mov si, dx

    mov bp, newArray + 2
    mov ah, 13h     ;TO PRINT STRING ON SCREEN WE use 13h function
    int 10h

ret
goToNewLine:
    mov dx, newLine
    mov  ah, 9          ; DOS print-string function
    int  0x21
ret

start:
    mov ax, msg
    push ax
    call printf
    call getNumber
    call goToNewLine
    mov ax, msg2
    push ax
    call printf
    call getk
    call goToNewLine
    call copy
    ; call sort
    call printArr

mov ax,0x4c00
int 0x21