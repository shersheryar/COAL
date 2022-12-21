
org 100h

jmp start
data: db 'Assembly Language - Course, FAST University Peshawar Campus'
msg1end:

data1: db 'I Love Pakistan'
msg2end:

clrscr:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nextloc:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  nextloc

    pop  di 
    pop  ax
    pop  es
    ret
clearscreen:
    MOV AH, 07h    ; Scroll up function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    MOV DX, 174FH  ; lower right corner DH=row, DL=column 
    MOV BH, 00h    ; BlackOnBlack
    INT 10H
ret

setBlinking:
    mov ah,06h          ;scroll up window.
    mov al,14          ;number of lines by which to scrol
    mov ch,0ch          ;row, column of window's upper left corner.
    mov cl,00h          ;row, column of window's upper left corner.
    mov Dh,19h          ;row, column of window's lower right corner.
    mov dl,50h          ;row, column of window's lower right corner.
    mov bh,0dfh         ;used to write blank lines at bottom of window 
    int 10h                            ; call BIOS video service
ret
; // Set mode 
setmode:
    ;mov  ax, 0003h    ; BIOS.SetVideoMode 80x25 16-color text
    mov al, 03h      ; 03h - text mode. 80x25. 16 colors.
    mov ah, 00h      ; set  mode.
    int  10h    ; interput to BIOS Display memory service to apply changes.
ret


; // Set Cursor Positions
setcursor:
    ;mov  dx, 0C23h    ; DH is Row (12), DL is Column (35)
    mov dh, 13         ; Row number 12
    mov dl , 35        ; Column No 35
    mov  bh, 0        ; DisplayPage
    mov  ah, 02h      ; BIOS.SetCursorPosition (set cursor position function)
    int  10h   ; interput to BIOS Display memory service to apply changes.
    mov ah, 00
    int 16h
    ret

; // Print a string on screen 
printstr:

    mov cx, msg1end - data ; calculate message size.
    ;mov  bx, 0001h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov al, 1    
    mov bh, 0
    mov bl, 07  ; color the text and background
    
    mov dh, 5         ; Row number 5
    mov dl , 13        ; Column No 13
    push cs
    pop es
    mov bp,  data
    mov ah , 13h      ; To print string on screen we use 13h function
    int  10h
    
    ; mov  ah, 00h      ; BIOS.WaitKeyboardKey
    ; int  16h          ; -> AX
ret 

; // Print the a character on screen 
printchr:
    mov  cx, 5       ; ReplicationCount
    mov bh, 0 ; page no n
    mov bl, 07 ; color scheme
    mov  bx, 0007h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov  ah, 09h    ; BIOS.WriteCharacterAndAttribute, AL is ASCII ("*")
    mov  al, 2ah
    int  10h
ret 


setBorderColor:
;// Left side column
    MOV AH, 06h    ; Scroll up function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    MOV DX, 3501H  ; lower right corner DH=row, DL=column 
    MOV BH, 05fh    ; WhiteOnMageta
    INT 10H
;// Right side column
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    ;XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov ch, 00
    mov cl, 78
    MOV DX, 2475H  ; lower right corner DH=row, DL=column 
    MOV BH, 05fh    ; WhiteOnMageta
    INT 10H
;// Top Row
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    ;XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov ch, 00h
    mov cl, 00h
    MOV DX, 0179H  ; lower right corner DH=row, DL=column 
    MOV BH, 05fh   ; WhiteOnMageta
    INT 10H

;// Bottom Row
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    ;XOR CX, CX     ; Upper left corner CH=row, CL=column
    mov ch, 18h ; 24= 18 hex
    mov cl, 00h 
    MOV DX, 1879H  ; lower right corner DH=row, DL=column 
    MOV BH, 05fh    ; WhiteOnMageta
    INT 10H
    ; mov  ah, 00h      ; BIOS.WaitKeyboardKey
    ; int  16h          ; -> AX
ret
drawPakistaniFlag:
;; Flag White portion
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)

    mov ch, 7      ; Upper left corner CH=row
    mov cl, 20 ; Upper left corner CL=column
    mov dh, 15 ; lower right corner DH=row
    MOV dl, 30  ; lower right corner DL=column 
    MOV BH, 7fh    ; white

    INT 10H

; flag green portion
    MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)

    mov ch, 7      ; Upper left corner CH=row
    mov cl, 30 ; Upper left corner CL=column
    mov dh, 15 ; lower right corner DH=row
    MOV dl, 60  ; lower right corner DL=column 
    MOV BH, 0AAh    ; 
    INT 10H

    ;// print msg in rectangle.
    mov cx, msg2end - data1 ; calculate message size.
      ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov al, 1    
    mov bh, 0
    mov bl, 0fh  ; color the text and background
    
    mov dh, 11         ; Row number 12
    mov dl , 35        ; Column No 20
    push cs
    pop es
    mov bp,  data1
    mov ah , 13h      ; To print string on screen we use 13h function
    int  10h

ret
drawRectangular:
   MOV AH, 06h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)

    mov ch, 7      ; Upper left corner CH=row
    mov cl, 20 ; Upper left corner CL=column
    mov dh, 15 ; lower right corner DH=row
    MOV dl, 60  ; lower right corner DL=column 
    MOV BH, 0dfh    ; 
    INT 10H
    ;// print msg in rectangle.
    mov cx, msg2end - data1 ; calculate message size.
      ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov al, 1    
    mov bh, 0
    mov bl, 07  ; color the text and background
    
    mov dh, 11         ; Row number 12
    mov dl , 31        ; Column No 20
    push cs
    pop es
    mov bp,  data1
    mov ah , 13h      ; To print string on screen we use 13h function
    int  10h


    ; mov  ah, 00h      ; BIOS.WaitKeyboardKey
    ; int  16h          ; -> AX
ret
start: 
call clearscreen
;call setBlinking
;call setmode
;call setcursor
call printstr
call setBorderColor 
call drawRectangular

; call clearscreen
mov ax, 0x4c00 ; terminate program
int 0x21
