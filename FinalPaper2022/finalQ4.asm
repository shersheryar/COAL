org 100h

jmp start

prtstring:
	mov ah,9
	int 0x21
    mov ah,00
    int 10h
ret
printD:
    mov ah, 02
    int 21h
ret

swapflag:   db  0
sort:
    mainloop:
        mov si, 0
        mov byte[swapflag], 0
        innerloop:
            mov al,[str1 +si]
            ; sub al, 30h
            mov bl, [str1 + si + 1]
            ; sub bl, 30h
            cmp al, bl
            jg noswap
            ; add al, 30h
            mov [str1 + si + 1], al
            ; add bl, 30h
            mov [str1 + si], bl
            mov byte[swapflag], 1
            noswap:
            add si, 1

            cmp si, 4
            jl innerloop
        cmp byte[swapflag], 1
        je mainloop
ret
check:
    xor cx, cx
    xor dx,dx
    mov dx,0
    mov cx, 4   ;length of first string
    mov si,0
    mov di,0
    mov bx,4       ;lenght of second string
    outerloop:
        pushTostack:
            mov ax,[str1 + si]
            push ax
            add si,1
            loop pushTostack
        
        mov cx, 4
        p:
            ; mov si,2
            pop dx
            call printD
            loop p





        ; mov cl,[answesfd
        ar1+1]
        mov ax,[str1+si]
        innerloop:
            mov bx, [str2+di]
           
            cmp ax,bx
            je okay
            add di,1
            cmp di,4
            jne innerloop

            okay:
            add dx,1
            add si,1
            loop outerloop
    
    cmp dx,4
    je anagram
    notAnagram:
            mov dx,nA
            call prtstring
            jmp done
    anagram:
            mov dx,A
            call prtstring
            jmp done
    done:
ret
start:
    call check
section .data
A db 'yes this is anagram',0x0d,0x0a, '$'
nA db 'no this is no anagram',0x0d,0x0a, '$'
str1: db 'mary$'
str2: db 'army$'