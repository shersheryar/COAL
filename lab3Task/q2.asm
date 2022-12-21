;a programme to add three numbers using byte variables
[org 0x0100]
	;initilize stuff
	mov ax, 0 ; reset the accumulator
	mov cx, 6 ; set the iterator count


    outerloop:
        mov bx, 0
        innerloop:
            mov ax, [rollNum + bx]
            cmp ax, [rollNum + bx + 2]

            jae noExchange

                ;the exchange portion
                mov dx, [rollNum + bx + 2]
                mov [rollNum + bx + 2], ax
                mov [rollNum + bx], dx    

            noExchange:
                add bx,2 
                cmp bx, 10
                jne innerloop
        ;Outerloop
        sub cx,1
        jnz outerloop
	mov ax, 0x4c00 	;terminate the program
	int 0x21


 	rollNum: dw 2,1,8,0,2,7