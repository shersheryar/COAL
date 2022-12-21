[org 0x0100]
	mov ax, [temp]
	mov bx, [temp+2]
	add ax,bx
	
	mov bx,[temp+4]
	add ax,bx
	
	mov bx,[temp+6]
	add ax,bx

	mov bx,[temp+8]
	add ax,bx

	mov bx,[temp+10]
	add ax,bx

	mov bx,[temp+12]
	add ax,bx
	mov [result],ax

	mov ax, 0x4c00
	int 0x21

temp: dw 2,4,5,5,6,3,6
result:dw 0