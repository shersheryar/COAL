org 100h


jmp start



section.data
   
    num dw 0

section.code
printf:
    mov dx , num  
    mov ah ,9
    int 21h

ret

scanchr:
    
    ;Take input   character
    mov ah ,7
    int 21h

    mov byte[num] , al   ;hexa value will be stored in al automatically must stored in memory for use        
    mov byte[num+1] ,'$' 
   
   call printf       ;print the Entered character
    ret

 

scanstring:

    ;Take input
    mov dx , answer
    mov ah , 0x0a
    int 21h               ;input character will be stored in al
    xor bx , bx
    mov bl, [answer + 1]        ; buffer size
    mov word[answer + bx + 2], '$'
    mov ax , 0

   
    mov dx , answer+2

    ;mov ah ,9
    ;int 21h

ret




scanstring1:

    ;Take input
    mov dx , answer1
    mov ah , 0x0a
    int 21h               ;input character will be stored in al
    xor bx , bx
    mov bl, [answer1 + 1]        ; buffer size
    mov word[answer1 + bx + 2], '$'
    mov ax , 0

   
    mov dx , answer1+2


ret


clearscreen:

    mov ah ,06h
    xor al , al
    mov ch , 0
    mov cl , 0
    mov dh , 24
    mov dl , 79
    mov bh , 07h
    int 10h 
    ret

setCursor:
     ; mov dx , 0c23h
     mov dh , 22
     mov dl , 10
     mov bh , 0
     mov ah , 02h 
     int 10h 
     ret


setCursor1:
     ; mov dx , 0c23h
     mov dh , 16
     mov dl , 26
     mov bh , 0
     mov ah , 02h 
     int 10h 
     ret


setCursor2:
     ; mov dx , 0c23h
     mov dh , 10
     mov dl , 40
     mov bh , 0
     mov ah , 02h 
     int 10h 
     ret


setBox:

    mov ah ,06h
    xor al , al
    mov ch , 18
    mov cl , 2
    mov dh , 26
    mov dl , 19
    mov bh , 70h
    int 10h



    mov ah ,06h
    xor al , al
    mov ch ,12
    mov cl , 20
    mov dh , 19
    mov dl , 34
    mov bh , 70h
    int 10h 


    mov ah ,06h
    xor al , al
    mov ch ,6
    mov cl , 34
    mov dh , 14
    mov dl , 54
    mov bh , 70h
    int 10h 
   
   
    ret


start:

    call clearscreen


    call setBox

    ; call setCursor
    ; call scanchr
    ; call setCursor1
    ; call scanstring
    ; call setCursor2
    ; call scanstring1


    

   mov ax , 0x4c00
int 0x21
answer: db 20, 0    ; 0 is for used len in buffer



answer1: db 20, 0    ; 0 is for used len in buffer
