;a programme to add three numbers using byte variables
[org 0x0100]
	;initilize stuff
	xor al,al 	; reset the accumulator	; set the iterator count
	xor ah,ah
    mov ah,0 	

	mov ah, [num1]
	mov al, [num2]

	add ah,al

	mov al, [num3]
	add ah,al

	mov al,[num4]
	add ah,al


	mov [result], al
	mov ax , 0x4c00 		;terminate the program
	int 0x21
 	num1: dw 2
    num2: dw 3
	num3: db 1
    num4: db 2
    result: db 0