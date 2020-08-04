;define handy macros 
%define sys_write 1
%define stdout 1

%define sys_exit 60
%define success 0

%define nl 10



section .data	
    introMessage db "string to bubblesort ",nl
    introMessageLen dw $-introMessage

    message db "aiuhwgralpiuerhjgopaidfugaopiger",nl	; does nasm not have an escape char stop  from being a comment??
	messageLen dw $-message

section .text	 


global _start	
_start:			
    mov rax, sys_write 	 
    mov rdi, stdout	
    mov rsi, introMessage	
    mov rdx, [introMessageLen]		 
    syscall		

    mov rax, sys_write 	 
    mov rdi, stdout		
    mov rsi, message	
    mov rdx, [messageLen]		 
    syscall			




    ;exit cleanly 
	mov rax, sys_exit	
    mov rdi, success	
    syscall