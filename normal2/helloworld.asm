
;basically jsut for a warm up, done in parts, from here https://www.briansteffens.com/introduction-to-64-bit-assembly/01-hello-world/

;define handy macros 
%define sys_write 1
%define stdout 1

%define sys_exit 60
%define success 0

%define nl 10



section .data	; data section

    message db "Hello, world!", nl	; the hello world string and a LF char
	;messageLen db 14
	messageLen db $-message

section .text	 ; test section

;global main	; gcc requires main as a start point
;main:
global _start
_start:

    mov rax, sys_write 	; syscall to make, 1 is sys write 
    mov rdi, stdout	; file to print to, 1 is STDOUT
    mov rsi, message	; mem location of buffer to print 
    mov rdx, [messageLen]		; moves size in bytes of strign to print to rdx 
    syscall			; does call ( x64 uses syscal isntead of the old interupt on 0x80) 

	mov rax, sys_exit	; sys_exit to exit program
    mov rdi, success	;with exit call 0
    syscall
