;Write 64/32 Bit Assembly Code..?
	This for Linux Base OS.

;Install Nasm 
	sudo apt update
	sudo apt install nasm
	nasm -v
;Install gcc 
	sudo apt update
	sudo apt install gcc
	gcc -v
;Write C and Assembly Code and compile them  it.
	;#for Assembly code: First do it
	nasm -felf64 hello.asm && ld hello.o && ./a.out ;Assemble and Run Assembly Code
	nasm -felf64 hello.asm && ld hello.o ; Assemble the Assembly Code
	nasm -f elf64 Lab14c.asm -o Lab14c.o ; generate object file
	
	;#for C code: After Assembly then complie C code
	gcc -no-pie Lab14c.c Lab14c.o -o hello
	; Run the Code:
	; ./hello
