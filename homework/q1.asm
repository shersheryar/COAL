;a programme to add three numbers using byte variables
[org 0x0100]
	;initilize stuff
	mov ax, 0 ; reset the accumulator
	mov cx, 6 ; set the iterator count

	outerloop:
		mov ax, [num1]
		mov bx, [num1+2]
		cmp ax,bx
		jnc nxt
		mov ax, bx
		nxt:sub cx, 1
		jnz outer loop ; 
			
	mov [largest], ax
	mov ax, 0x4c00 	;terminate the program
	int 0x21
 	num1: dw 2,1,8,0,2,7
	largest: dw 0