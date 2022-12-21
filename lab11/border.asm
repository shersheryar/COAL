; [org 0x0100]
; jmp start
; topborder:
;     mov ah, 07h     ;scrool down function
;     xor al, al      ;NUMER OF LINES BY which to scrool up
;     mov ch, 0
;     mov cl, 0      ;upper left corner ch= row cl = c0lumn
;     ; mov dx, 174fh   ;lower ruht corner dh-row dl=column
;     mov dh, 0
;     mov dl, 79
;     mov bh, 70h     ;blackonblack
;     int 10h

; ret
; leftborder:
;     mov ah, 07h     ;scrool down function
;     xor al, al      ;NUMER OF LINES BY which to scrool up
;     mov ch, 0
;     mov cl, 0      ;upper left corner ch= row cl = c0lumn
;     ; mov dx, 174fh   ;lower ruht corner dh-row dl=column
;     mov dh, 24
;     mov dl, 2
;     mov bh, 70h     ;blackonblack
;     int 10h

; ret
; rightborder:
;     mov ah, 07h     ;scrool down function
;     xor al, al      ;NUMER OF LINES BY which to scrool up
;     mov ch, 0
;     mov cl, 78      ;upper left corner ch= row cl = c0lumn
;     ; mov dx, 174fh   ;lower ruht corner dh-row dl=column
;     mov dh, 24
;     mov dl, 79
;     mov bh, 70h     ;blackonblack
;     int 10h

; ret
; bottomborder:
;     mov ah, 07h     ;scrool down function
;     xor al, al      ;NUMER OF LINES BY which to scrool up
;     mov ch, 23
;     mov cl, 0     ;upper left corner ch= row cl = c0lumn
;     ; mov dx, 174fh   ;lower ruht corner dh-row dl=column
;     mov dh, 24
;     mov dl, 79
;     mov bh, 70h     ;blackonblack
;     int 10h

; ret
; box:
;     mov ah, 07h     ;scrool down function
;     xor al, al      ;NUMER OF LINES BY which to scrool up
;     mov ch, 10
;     mov cl, 33     ;upper left corner ch= row cl = c0lumn
;     ; mov dx, 174fh   ;lower left corner dh-row dl=column
;     mov dh, 20
;     mov dl, 50
;     mov bh, 70h     ;blackonblack
;     int 10h

; ret
; start:
; call topborder
; call leftborder
; call rightborder
; call bottomborder
; call box
; mov ax, 0x4c00
; int 0x21
; int 0x21
[org 0x0100]
jmp start

topborder:
    mov ah, 07h
    xor al, al
    mov ch, 0
    mov cl, 0
    mov dh, 0
    mov dl, 79
    mov bh, 60h
    int 10h
ret
leftborder:
    mov ah, 07h
    xor al, al
    mov ch, 1
    mov cl, 0
    mov dh, 24
    mov dl, 1
    mov bh, 50h
    int 10h
ret
bottomborder:
    mov ah, 07h
    xor al, al
    mov ch, 24
    mov cl, 2
    mov dh, 24
    mov dl, 79
    mov bh, 30h
    int 10h
ret
rightborder:
    mov ah, 07h
    xor al, al
    mov ch, 0
    mov cl, 78
    mov dh, 24
    mov dl, 79
    mov bh, 20h
    int 10h
ret

start:
    call topborder
    call leftborder
    call rightborder
    call  bottomborder
    mov ax, 0x4c00
    int 0x21