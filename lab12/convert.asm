[org 0x0100]
jmp start
Section .data
error db 'Wrong entry: $'
msg db 'Enter character:  $'
char dd 4 , 0
resb 4
newLine db 0x0a, '$'
Section .code
printf:
    push bp;
    mov bp, sp;
    mov dx , [bp+ 4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp;

ret 2

getchar:
    mov dx, char
    mov ah, 0x0a
    int 0x21
ret

invalid:
    mov ax, error
    push ax
    call printf
    call goToNewLine
    jmp start

compare:
; //  FOR INVALID INPUT
    mov al, [char + 2]
    cmp al , 41h
    jl invalid
    cmp al, 7ah
    jg invalid

    ; TO CHECK FOR UPPER CASE
    mov al, [char + 2]
    cmp al, 5Ah
    jg small    ; if al is greater then it is small

    add al, 20h
    mov [char + 2], al
    call printchr
    jmp khatam
    small:
        sub al, 20h
        mov [char + 2], al
        call printchr

    khatam:

ret
printchr:
    mov  cx, 1      ; ReplicationCount
    mov  bx, 0007h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov  ah, 09h    ; BIOS.WriteCharacterAndAttribute, AL is ASCII ("*")
    mov  al, [char+2]
    int  10h
ret 
goToNewLine:
    mov dx, newLine
    mov  ah, 9          ; DOS print-string function
    int  0x21
ret
printscr:
    mov cx, 1; calculate message size
    mov al, 1
    mov bh, 0
    mov bl, 05  ;color tdatahe test and background

    mov dh, 24  ;row number 5
    mov dl, 0  ;colowm nnumber 12
    push cs
    pop es
    mov bp, char + 2
    mov ah, 13h     ;TO PRINT STRING ON SCREEN WE use 13h function
    int 10h
ret

start:

    mov ax, msg
    push ax
    call printf
    call getchar
    call printscr
    call goToNewLine
    call compare

    mov ah, 4ch
    int 21h