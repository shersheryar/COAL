[org 0x0100]
jmp start
data: db 'Assembly Language - Course, FAST, Fast University Peshawar Campus'
msg1end:

data1: db 'I Love Pakistan'
msg2end:

clearscreen:
    mov ah, 07h     ;scrool down function
    xor al, al      ;NUMER OF LINES BY which to scrool up
    xor cx, cx
    mov dx , 174fh
    mov bh, 00h     ;blackonblack
    int 10h

ret

; print a string on screen

printscr:
    mov cx, msg1end - data ; calculate message size
    mov al, 1
    mov bh, 0
    mov bl, 05  ;color tdatahe test and background

    mov dh, 12  ;row number 5
    mov dl, 10  ;colowm nnumber 12
    push cs
    pop es
    mov bp, data
    mov ah, 13h     ;TO PRINT STRING ON SCREEN WE use 13h function
    int 10h

    ; mov ah, 00h  ;BIOS.WaitKeyBoardKey
    ; int 16h

ret
start:
call clearscreen
call printscr

mov ax, 0x4c00
int 0x21