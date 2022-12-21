[org 0x0100]

mov cx, 4

outerloop:

mov bx,0

innerloop:

mov ax,[data+bx]

cmp ax ,[data+bx+2]

jna donothing

mov dx, [data+bx+2]

mov [data+bx+2], ax

mov [data+bx], dx

mov byte [swap], 1

donothing:

mov byte [swap],0

add bx,2

cmp bx,6

jne innerloop

cmp byte [swap], 0

je exit

loop outerloop

exit:

mov ax,0x4c00

int 0x21

data: dw 6, 2, 4, 5

swap: db 0