;a programme to add three numbers using byte variables
[org 0x0100]
	mov ax, 0x8787
	xor ax, ax			;check effect on ZF
	
	mov ax, 0x8787
	mov ax, 0			;check effect of ZF(zero flag)
			
	mov bx, num1

	add ax, [bx]
	add bx, 2

	add ax, [bx]
	add bx, 2

	add ax, [bx]
	add bx, 2

	mov [result], ax

	mov ax, 0x4c00
	int 0x21

	;to turn this into an iteration, we need a couple of things
	num1: dw 5, 10, 15
	result: dw 0	