
;basically jsut for a warm up, done in parts, from here https://www.briansteffens.com/introduction-to-64-bit-assembly/01-hello-world/

section .data	; data section

    message db "Hello, world!", 10	; the hello world string and a LF char
	messageLen db 14

section .text	 ; test section

global _start	; code section 
_start:			
    mov rax, 1	; syscall to make, 1 is sys write 
    mov rdi, 1	; file to print to, 1 is STDOUT
    mov rsi, message	; mem location of buffer to print 
    mov rdx, [messageLen]		; moves size in bytes of strign to print to rdx 
    syscall			; does call ( x64 uses syscal isntead of the old interupt on 0x80) 

	mov rax, 60	; sys_exit to exit program
    mov rdi, 0	;with exit call 0
    syscall
