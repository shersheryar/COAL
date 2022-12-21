org 100h

jmp start
data: db 'Assembly Language - Course, FAST University Peshawar Campus'
msg1end:

; // Print a string on screen 
printstr:

    mov cx, msg1end - data ; calculate message size.
    ;mov  bx, 0001h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov al, 1    
    mov bh, 0
    mov bl, 07  ; fore and background color
    
    mov dh, 12         ; Row number 12
    mov dl , 15        ; Column No 15
    push cs
    pop es
    mov bp,  data
    mov ah , 13h      ; To print string on screen we use 13h function
    int  10h
  
    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret 

start: 

call setmode

mov ax, 0x4c00 ; terminate program
int 0x21
