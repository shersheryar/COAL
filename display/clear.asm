[org 0x0100]
    jmp start
clrscr:
    push es
    push ax
    push cx
    push di

    mov ax, 0xb800
    mov es, ax

    xor di, di                  ;starting at index 0
    mov ax, 0x0720              ;what t0 write
    mov cx, 2000                ;how many times to write
                                ;holds the counts, not bytes


    cld                 ;auto increment
    rep stosw            ;automatically write starting from  [es:di]
    pop di
    pop cx
    pop ax
    pop es
    ret
start:
    call clrscr
    mov ax, 0x4c00
    int 0x21
