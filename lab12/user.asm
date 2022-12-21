[org 0x0100]
jmp start
Section .data
endms db 'wrong input: $'
endmsg db 'press z to quit: $'
exitt db 3, 0
resb 3 
newLine db 0x0a, '$'
msg2 db 'logged: $'
user db 'ali : $'
password db '123$'
msg db 'Enter username:  $'
name db 5, 0
resb 5
msg1 db 'Enter password: $'
pass db 6, 0   
resb 6



getExit:
    mov dx, exitt
    mov ah, 0x0a
    int 0x21
    ; mov al, [exitt+2]
ret
printf:
    push bp;
    mov bp, sp;
    mov dx , [bp+ 4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp;

ret 2
getName:
    mov dx, name
    mov ah, 0x0a
    int 0x21
ret
getPass:
    mov dx, pass
    mov ah, 0x0a
     int 0x21
ret

checkuser:

;       check user
    mov al, [name +2]
    mov bl, [user]
    cmp al , bl
    jne endprog
    mov al, [name + 3]
    mov bl, [user + 1]
    cmp al, bl
    jne endprog
    mov al, [name + 4]
    mov bl, [user + 2]
    cmp al, bl
    jne endprog
;   CHECK PASSWORD
    mov al, [pass +2]
    mov bl, [password]
    cmp al , bl
    jne endprog
    mov al, [pass + 3]
    mov bl, [password + 1]
    cmp al, bl
    jne endprog
    mov al, [pass + 4]
    mov bl, [password + 2]
    cmp al, bl
    jne endprog


    mov ax, msg2
    push ax
    call printf
        
ret
goToNewLine:
    mov dx, newLine
    mov  ah, 9          ; DOS print-string function
    int  0x21
ret
printscr:
    mov cx, 3; calculate message size
    mov al, 1
    mov bh, 0
    mov bl, 05  ;color tdatahe test and background

    mov dh, 24  ;row number 5
    mov dl, 0  ;colowm nnumber 12
    push cs
    pop es
    mov bp, name + 2
    mov ah, 13h     ;TO PRINT STRING ON SCREEN WE use 13h function
    int 10h
ret

endprog:
    ; get eXIT MODE
    mov ax, endms
    push ax
    call printf
    call goToNewLine
    mov ax, endmsg
    push ax
    call printf
    call getExit
    cmp byte[exitt+2] , 'z'
    je end
    call goToNewLine
start:
;  get user name
    mov ax, msg
    push ax
    call printf
    call getName
    call goToNewLine
; GET PASS WORD
    mov ax, msg1
    push ax
    call printf
    call getPass
    call goToNewLine


    call checkuser
    
    end:
    mov ax, 0x4c00
    int 0x21