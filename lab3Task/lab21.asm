;a programme to add three numbers using byte variables
[org 0x0100]
	;initilize stuff
	xor al,al ; reset the accumulator
	xor bl, bl ; set the iterator count
    mov cl, 5

    mov bx,rollNum

    outerloop:
        add al, [bx]
		add bx, 2
        sub cl,1
        jnz outerloop

	mov [result], al
	mov ax, 0x4c00 	;terminate the program
	int 0x21


 	rollNum: db 1,2,3,1,2
	result: db 0