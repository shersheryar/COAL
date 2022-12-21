[org 0x0100]
jmp start
section .data
newLine db 0x0a, '$'
msg db 'Enter the number: $'
output db 'Output: $'   
odd db 'This is an Odd Number: $'
even db 'This is an even number: $'
prime db 'This is a prime number: $'
notPrime db 'This is nott a prime number: $'
num db 4, 0
resb 4


section .text
printf:
    push bp
    mov bp, sp
    mov dx, [bp + 4]
    mov ax, 0
    mov ah, 9
    int 21h
    pop bp
ret 2

getNumber:
    mov dx, num
    mov ah, 0x0a
    int 21h
ret
checkPrime:
    mov dx, 0
    mov ax, 0
    mov bl, 2
    mov al, byte[num + 2]
    sub al, 30h
    loopee:
    cmp  al, bl     
    je isPrime
    div bl
    cmp ah, 0
    je isNotPrime
    add bl,1
    jmp loopee

    isPrime:
        mov ax, prime
        push ax
        call printf
        call goToNewLine
        jmp endd
    isNotPrime:
        mov ax, notPrime
        push ax
        call printf
        call goToNewLine
    endd:
ret
check:
    mov dx, 0
    mov ax, [num + 2]
    mov bx, 2
    div bx
    cmp dx, 0
    je evenMsg
    jmp oddMsg

    evenMsg:
        call goToNewLine
        mov ax, output
        push ax
        call printf
        call goToNewLine 
        mov ax, even
        push ax
        call printf
        jmp end
    oddMsg:
        call goToNewLine
        mov ax, output
        push ax
        call printf
        call goToNewLine 
        mov ax, odd
        push ax
        call printf
    
    end:
    call goToNewLine
    call checkPrime
ret

goToNewLine:
    mov dx, newLine
    mov  ah, 9          ; DOS print-string function
    int  0x21
ret
start:
    mov ax, msg
    push ax
    call printf
    call getNumber
    call check

mov ax, 0x4c00
int 0x21
