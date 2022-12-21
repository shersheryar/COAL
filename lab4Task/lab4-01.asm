; a programme to understand the difference between (jz, jnz, je, jne)
[org 0x0100]
    mov cx, 2   ;set the iterator count
    ;zf = 1 mean set
    ;zf = 0 mean not set or reset

    l1:
        cmp cx, 0
        jz l1
    l2:
        sub cx,1
        cmp cx, 1
        je l4
    l3:
        cmp cx, 0
        jne l4
    l4:
        cmp cx, 1
        je l3
    
    mov ax, 0x4c00
    int 0x21