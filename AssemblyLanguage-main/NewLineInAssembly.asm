section .text
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
