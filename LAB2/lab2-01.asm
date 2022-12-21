;a programme to add three numbers using byte varible
[org 0x0100]
	mov ax, 0x8787
	xor ax, ax	 ;we need to make sure AX is empty! or do we?
	mov ah, [num1] !intel software developer manual - figure 3-5 (page 76)
	mov b1, [num1+1]
	add ah, bh
	mov bh, [num1 + 2]
	add ah, bh
	mob [num1 + 3], ah
	mov ax, 0x4c00
	int 0x21
	num1: dw 5, 10, 15, 0