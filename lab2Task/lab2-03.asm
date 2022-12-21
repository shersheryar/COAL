;a programme to add three numbers using byte variables
[org 0x0100]
	mov ax, 0x8787
	xor ax, 0	;reset accumulator
	
	mov ax, 0x8787
	xor ax, ax		;reset the accumulator , set change in ZF
 
	mov cx, 3		;set the iterator count
	mov bx, num1		;set the base

	outerloop:
		add ax, [bx]
		add bx, 2
		sub cx, 1
		jnz outerloop ; jump to outerloop lable if zero flag(zf!=1) is not set.
;its means if previous result of Arthematic or logical operatin is not zero
;them move to outer loop otehr wise ignore.

	mov [result], ax

	mov ax, 0x4c00
	int 0x21

	;intel software developer manual - EFLAGS  and Instructions (page 435)

num1: dw 5, 10, 15
result: dw 0