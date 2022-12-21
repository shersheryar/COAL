[org 0x0100]
jmp start

data: db 'Kashmir'
msg1end:


printscr:
    mov cx, msg1end - data ; calculate message size
    mov al, 1
    mov bh, 20h
    mov bl, 67h  ;color tdatahe test and background

    mov dh,3  ;row number 5
    mov dl, 3  ;colowm nnumber 12
    push cs
    pop es
    mov bp, data
    mov ah, 13h     ;TO PRINT STRING ON SCREEN WE use 13h function
    int 10h

    ; mov ah, 00h  ;BIOS.WaitKeyBoardKey
    ; int 16h

ret
flagbox:
    mov ah, 07h
    xor al, al
    mov ch, 0
    mov cl, 0
    mov dh, 16
    mov dl, 40
    mov bh, 20h
    int 10h
ret
smallbox:
    mov ah, 07h
    xor al, al
    mov ch, 0
    mov cl, 0
    mov dh, 7
    mov dl, 20
    mov bh, 60h
    int 10h
ret

line:
    mov ah, 07h
    xor al, al
    mov ch, 9
    mov cl, 0
    mov dh, 9
    mov dl, 40
    mov bh, 70h
    int 10h
ret 
line1:
    mov ah, 07h
    xor al, al
    mov ch, 11
    mov cl, 0
    mov dh, 11
    mov dl, 40
    mov bh, 70h
    int 10h
ret 
line2:
    mov ah, 07h
    xor al, al
    mov ch, 13
    mov cl, 0
    mov dh, 13
    mov dl, 40
    mov bh, 70h
    int 10h
ret 
line3:
    mov ah, 07h
    xor al, al
    mov ch, 15
    mov cl, 0
    mov dh, 15
    mov dl, 40
    mov bh, 70h
    int 10h
ret 
s

start:
    call flagbox
    call smallbox
    call line
    call line1
    call line2
    call line3
    call printscr
    mov ax, 0x4c00
    int 0x21