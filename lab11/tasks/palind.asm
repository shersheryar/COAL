org 100h
main:
	mov dx,prompt
	call prtstring
	call getAnswer
	cmp al, dl
	je palindrome
nopalindrome:
	mov dx,pm
	call prtstring
	jmp done
palindrome:
	mov dx,am
	call prtstring
	jmp done

done:
	mov al,0
	mov ah, 0x4c
	int 0x21
prtstring:
	mov ah,9
	int 0x21
	ret
getAnswer:
	mov dx, answer
	mov ah, 0x0a
	int 0x21
	mov al, [answer + 2]
    add al, 30h
    mov dl, [answer + 4]
    add dl, 30h
	ret
section .data
prompt db "insert a number $"
am db 'yes this is palindrome',0x0d,0x0a, '$'
pm db 'no this is no palindrome',0x0d,0x0a, '$'
answer db 20,0
resb 20