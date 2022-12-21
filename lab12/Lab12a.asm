[org 0x0100]
                        
mov  ax, 0xb800         ; video memory base
mov  es, ax             ; cannot move to es through IMM
mov  di, 0              ; top left location 

nextpos: 

    mov  word [es:di], 0x0020     ;; 00 for balck, 20 for space
    ;mov  word [es:di], 0x7461       ; 04 mean red color:  ASCII of + is : 2B ; 
                                    ; 0x20 is the space character
    ; [es:di] its mean move the operands(0x042B) from es to di location of video memory. 
    
    add  di, 2
    cmp  di, 4000
    jne  nextpos

    ; wait for keypress 
    mov ah, 0x1        ; input char is 0x1 in ah 
    int 0x21 

    mov  ax, 0x4c00
    int  0x21