; org 100h
    org 0x100
main:                   ; this label is documentary only
call goToNewLine
call goToNewLine
call goToNewLine
call goToNewLine


    mov  al, 0          ; return code
    mov  ah, 0x4c       ; Alternatively:  "mov ax, 0x4c00"
    int  0x21


goToNewLine:
    mov dx, newLine
    mov  ah, 9          ; DOS print-string function
    int  0x21
    ret

    section .data
newLine db 0x0a, '$'
; jmp start

; ; // Print the a character on screen 
printchr:
    mov  cx, 5       ; ReplicationCount
    mov  bx, 0007h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov  ah, 09h    ; BIOS.WriteCharacterAndAttribute, AL is ASCII ("*")
    mov  al, 2ah
    int  10h
ret 

; start: 
; call printchr

; mov ax, 0x4c00 ; terminate program
; int 0x21
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