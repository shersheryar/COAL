[org 0x0100]

mov ax, 0xb800 ;    video memory base
mov es, ax          ;cannot move to es through  imm
mov di, 0           ;top left location

nextpos:
    mov word[es:di], 0x4276     ;0x20 is the space character

    add di, 2
    cmp di, 4000
    jne nextpos

    mov ax, 0x4c00
    int 0x21