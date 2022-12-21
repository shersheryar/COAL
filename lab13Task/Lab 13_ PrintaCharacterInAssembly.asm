org 100h

jmp start

; // Print the a character on screen 
printchr:
    mov  cx, 5       ; ReplicationCount
    mov  bx, 0007h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov  ah, 09h    ; BIOS.WriteCharacterAndAttribute, AL is ASCII ("*")
    mov  al, 2ah
    int  10h
ret 

start: 
call printchr

mov ax, 0x4c00 ; terminate program
int 0x21
