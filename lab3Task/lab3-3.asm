;a programme to add three numbers using byte variables
[org 0x0100]
	;initilize stuff
	mov ax, 0 	; reset the accumulator
	mov cx, 10 	; set the iterator count
	mov bx, 0 	; set the base
    mov dx,2

	outerloop:

		cmp dx, [num1 + bx]
		je pass

        add ax, [num1+bx]

        pass:
        add bx,2

        
        sub cx,1
		jnz outerloop
	mov [result], ax
	mov ax, 0x4c00 		;terminate the program
	int 0x21
 	num1: dw 1,2,3,2,1,2,3,0,1,2

	result: dw 0