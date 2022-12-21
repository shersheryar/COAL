org 100h

jmp start

setcursor:
    ;mov  dx, 0C23h    ; DH is Row (12), DL is Column (35)
    mov dh, 20         ; Row number 12
    mov dl , 35        ; Column No 35
    mov  bh, 0        ; DisplayPage
    mov  ah, 02h      ; BIOS.SetCursorPosition (set cursor position function)
    int  10h   ; interput to BIOS Display memory service to apply changes.
    
    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret 


start: 

call setcursor

mov ax, 0x4c00 ; terminate program
int 0x21
