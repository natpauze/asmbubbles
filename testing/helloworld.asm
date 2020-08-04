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