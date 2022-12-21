
section .text
    org 0x100
main:                   ; this label is documentary only

; call clearscreenc
    mov  dx, prompt
    call prtstring      ; a very minor subroutine
    call getArray1
    mov  dx, prompt2
    call prtstring      ; a very minor subroutine
    call getArray2
    call goToNewLine
	call unique
    call printArray
done:
    mov  al, 0          ; return code
    mov  ah, 0x4c       ; Alternatively:  "mov ax, 0x4c00"
    int  0x21


unique:
    xor ax,ax
    xor cx,cx
    xor dx,dx
    xor bx,bx
    ; mov dl,2
    mov si,2
    mov di,2
    mov cl,[answer1+1]
    pushTostack:
        mov ax,[answer1 + si]
        push ax
        add si,1
        loop pushTostack
	
	mov cl,[answer1+1]
	p:
		mov si,2
		pop bx
		inner:
                mov ax,[answer2+di]
                cmp ax,bx
            	jne pass
                mov [answer3 + si],bx
                mov dx,[answer3 + si]
				call prt
				pop bx
				sub cl,1
				add si,1
                pass:
                add di,1
                cmp di,6
                jne inner
		; call prt
		loop p
		
ret

clearscreen:
    MOV AH, 07h    ; Scroll down function
    XOR AL, AL     ; number of lines by which to scroll up (00h = clear entire window)
    XOR CX, CX     ; Upper left corner CH=row, CL=column
    MOV DX, 184FH  ; lower right corner DH=row, DL=column 
    MOV BH, 07h    ; BlackOnBlack
    INT 10H
ret

getArray1:
    mov  dx, answer1     ; a structured input buffer - see below
    mov  ah, 0x0a       ; DOS input-string function
    int  0x21           ; DOS services interrupt
    mov  al, [answer1+2] ; al <-- 3rd position/1st character of buffer
    ret
getArray2:
    mov  dx, answer2     ; a structured input buffer - see below
    mov  ah, 0x0a       ; DOS input-string function
    int  0x21           ; DOS services interrupt
    mov  al, [answer2+2] ; al <-- 3rd position/1st character of buffer
    ret
prtstring:
    mov  ah, 9          ; DOS print-string function
    int  0x21
ret
prt:
    mov  ah, 2          ; DOS print-string function
    int  0x21
ret
goToNewLine:
	mov dx, newLine
	mov  ah, 9          ; DOS print-string function
	int  0x21
    ret

printArray:
	mov cx,0;
    mov cl, 4; calculate message size.
    ; mov cl, [answer3+1]; calculate message size.
    ;mov  bx, 0001h    ; BH is DisplayPage (0) , BL is Attribute (BrightWhiteOnGreen)
    mov al, 1    
    mov bh, 0
    mov bl, 07  ; color the text and background
    
    mov dh, 24         ; Row number 12
    mov dl , 0        ; Column No 20
    push cs
    pop es
    mov bp,  answer3+2
    mov ah , 13h      ; To print string on screen we use 13h function
    int  10h


    mov  ah, 00h      ; BIOS.WaitKeyboardKey
    int  16h          ; -> AX
ret

    section .data
prompt  db "Enter your first Array: ", 0x0d, 0x0a, '$'
prompt2  db "Enter your second Array : ", 0x0d, 0x0a, '$'
newLine db 0x0a, '$'

answer1  db 20, 0
resb  20
answer2  db 20, 0
resb  20
answer3  db 40, 0
resb  40
