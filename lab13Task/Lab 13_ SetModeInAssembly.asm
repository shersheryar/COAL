org 100h

jmp start

; // Set mode 
setmode:
    ;mov  ax, 0003h    ; BIOS.SetVideoMode 80x25 16-color text
    mov al, 03h      ; 03h - text mode. 80x25. 16 colors.
    mov ah, 00h      ; set  mode.
    int  10h    ; interput to BIOS Display memory service to apply changes.
ret


start: 

call setmode

mov ax, 0x4c00 ; terminate program
int 0x21
