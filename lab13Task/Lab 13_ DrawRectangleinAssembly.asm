org 100h

jmp start

drawRectangular:
   MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)

    mov ch, 7      ; Upper left corner CH=row
    mov cl, 20 ; Upper left corner CL=column
    mov dh, 15 ; lower right corner DH=row
    MOV dl, 60  ; lower right corner DL=column 
    MOV BH, 1Eh    ; YellowOnBlue
    INT 10H
    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret

start: 

call drawRectangular

mov ax, 0x4c00 ; terminate program
int 0x21
