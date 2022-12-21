[org 0x0100]
	mov ax, [temp]
	mov bx, [temp+2]
	add ax,bx
	
	mov bx,[temp+4]
	add ax,bx

	mov ax, 0x4c00
	int 0x21

temp: dw 2,4,5