
section .text
    org 0x100
main:                   ; this label is documentary only

call clearscreen
    mov  dx, prompt
    call prtstring      ; a very minor subroutine
    call getArray
    call goToNewLine
    call printArray
done:
    mov  al, 0          ; return code
    mov  ah, 0x4c       ; Alternatively:  "mov ax, 0x4c00"
    int  0x21


clearscreen:
    MOV AH, 07h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    MOV DX, 184FH  ; lower right corner DH=row, DL=column 
    MOV BH, 07h    ; BlackOnBlack
    INT 10H
ret

getArray:
    mov  dx, answer     ; a structured input buffer - see below
    mov  ah, 0x0a       ; DOS input-string function
    int  0x21           ; DOS services interrupt
    mov  al, [answer+2] ; al <-- 3rd position/1st character of buffer
    ret
prtstring:
    mov  ah, 9          ; DOS print-string function
    int  0x21
    ret
goToNewLine:
	mov dx, newLine
	mov  ah, 9          ; DOS print-string function
	int  0x21
    ret

printArray:
	mov cx,0;
    mov cl, [answer+1]; calculate message size.
    ;mov  bx, 0001h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov al, 1    
    mov bh, 0
    mov bl, 07  ; color the text and background
    
    mov dh, 24         ; Row number 12
    mov dl , 0        ; Column No 20
    push cs
    pop es
    mov bp,  answer+2
    mov ah , 13h      ; To print string on screen we use 13h function
    int  10h


    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret

    section .data
prompt  db "Enter your Array of size 10: ", 0x0d, 0x0a, '$'
newLine db 0x0a, '$'

answer  db 20, 0
resb  20
