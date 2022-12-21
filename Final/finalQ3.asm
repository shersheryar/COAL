org 100h

jmp start

section .data
newLine db 0x0a, '$'
msg db 'Enter a number of rows:  $'
num dd 0 , '$'

setcursor:
    ;mov  dx, 0C23h    ; DH is Row (12), DL is Column (35)
    mov dh, 3       ; Row number 12
    mov dl , 0       ; Column No 35
    mov  bh, 0        ; DisplayPage
    mov  ah, 02h      ; BIOS.SetCursorPosition (set cursor position function)
    int  10h   ; interput to BIOS Display memory service to apply changes.
    
    ; mov  ah, 00h      ; BIOS.WaitKeyboardKey
    ; int  16h          ; -> AX
ret 
printf:
    push bp;
    mov bp, sp;
    mov dx, [bp+4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp;
ret 2
scanchr:
    ; Take Input
    mov ah, 7 
    int 21h ;; input character will be stored in al
    mov [num] ,al
    ; print the entered character
    mov dx, num 
    mov ah, 9
    int 21h

ret 2
goToNewLine:
	mov dx, newLine
	mov  ah, 9          ; DOS print-string function
	int  0x21
    ret
star:
    mov dx,40h
    mov si ,1
    mov di, [num]
    sub di,30h
    first:
        cmp si, di
        ja end
        call printchr
        add si,1
        call goToNewLine
        jmp first
    end:
ret
printchr:
    mov dx, 40h
    mov  cx, si     ; ReplicationCount
    mov  bx, 0007h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov  ah, 09    ; BIOS.WriteCharacterAndAttribute, AL is ASCII ("*")
    mov  al,dl
    add al,cl
    int  10h
ret 
clearscreen:
    MOV AH, 07h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    MOV DX, 184FH  ; lower right corner DH=row, DL=column 
    MOV BH, 07H    ; BlackOnBlack
    INT 10H
ret

start: 
call clearscreen
mov ax, msg
push ax
call printf
call scanchr
call goToNewLine
call  star

mov ax, 0x4c00 ; terminate program
int 0x21
