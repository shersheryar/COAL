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
   
   ;// print msg in rectangle.
    mov cx, msg2end - data1 ; calculate message size.
    ;mov  bx, 0001h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov al, 1    
    mov bh, 0
    mov bl, 07  ; color the text and background
    
    mov dh, 10         ; Row number 12
    mov dl , 22        ; Column No 20
    push cs
    pop es
    mov bp,  data1
    mov ah , 13h      ; To print string on screen we use 13h function
    int  10h


    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret

start: 

call setmode

mov ax, 0x4c00 ; terminate program
int 0x21
