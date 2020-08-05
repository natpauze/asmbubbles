
;basically jsut for a warm up, done in parts, from here https://www.briansteffens.com/introduction-to-64-bit-assembly/01-hello-world/

;define handy macros 
%define sys_write 1
%define stdout 1

%define sys_exit 60
%define success_exit 0

%define nl 10



section .data

    message db "Hello, world!", nl
	messageLen db $-message

section .text	 


; pass pointer in rdi and len in rsi
print:
    mov rdx, rsi
    mov rsi, rdi 
    mov rax, sys_write	 
    mov rdi, stdout		
    syscall
ret


global _start
_start:
    mov rdi, message
    mov rsi, [messageLen]
    call print
    			 
end:
	mov rax, sys_exit	
    mov rdi, success_exit	
    syscall
