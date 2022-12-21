[org 0x0100]
main:
    mov dx, prompt
    call prtstring

    call getAnswer
    cmp al, 'a'
    je amLable

pmLabel:
    mov dx, pm
    call prtstring
    jmp done

amLable:
    mov dx, am
    call prtstring
    jmp done

done:
    mov al, 0
    mov ah, 0x4c
    int 0x21

prtstring:
    mov ah, 9
    int 0x21
    ret

getAnswer:
    mov ax, answer
    mov ah, 0x0a
    int 0x21
    mov al, [answer+2]
    ret

section .data
prompt db " am or pm? $"
am db "Good morning!", 0x0d, 0x0a, '$'
pm db "Good afternoon!", 0x0d, 0x0a, '$'
answer db 20, 0
resb 20
