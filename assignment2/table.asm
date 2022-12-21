
org 100h
jmp start
Section .data
msg db 'Enter a number:  $'
msg2 db 'Enter limit 0-9: $'
star db ' *  $'
equal db ' = $' 
iterator db '1 $'
answer db '0 $'

newLine db 0x0a, '$'
num db 0 ,'$'
num2 db 0, '$'


Section .code

table:
    mov dl,[num]
    mov [answer], dl
    data:
    mov ax, num
    push ax
    call printf

    mov ax, star
    push ax
    call printf
    mov ax, iterator
    push ax
    call printf

    mov ax, equal
    push ax
    call printf
    ; add bl, 31h

    mov  cx, 1      ; ReplicationCount
    mov  bx, 0007h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov  ah, 09h    ; BIOS.WriteCharacterAndAttribute, AL is ASCII ("*")
    mov dl, [num]
    add dl, 30h
    mov  al,dl

    int  10h


    ; mov ax, answer
    ; push ax
    ; call printf
    add byte[iterator],1
    mov cl, [iterator]
    call goToNewLine
    cmp  cl, [num2]
    jna data
ret

goToNewLine:
    mov dx, newLine
    mov ah, 9
    int 21h
ret
number:

    ; Take input
    mov ah, 7
    int 21h
    mov [num], al
    ;print the character
    mov dx, num
    mov ah, 9
    int 21h

ret 2
limit:
    ;take limit
    mov ah, 7
    int 21h
    mov [num2], al
    ;print limit
    mov dx, num2
    mov ah, 9
    int 21h
ret 2
printf:
    push bp
    mov bp, sp
    mov dx, [bp+4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp
ret 2

start:
    mov ax, msg
    push ax
    call printf
    call number
    call goToNewLine
    mov ax, msg2
    push ax
    call printf
    call limit
    call goToNewLine
    ; mov cx, 9
    ; add cl,30h
    call table
mov ax, 0x4c00
int 0x21