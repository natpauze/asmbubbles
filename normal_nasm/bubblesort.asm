
;basically jsut for a warm up, done in parts, from here https://www.briansteffens.com/introduction-to-64-bit-assembly/01-hello-world/

;define handy macros 
%define sys_write 1
%define stdout 1

%define sys_exit 60
%define success_exit 0

%define nl 10



section .data

    message db "Hello, world!", nl
	;messageLen dw $-message
    messageLen dw 14

    testmessage db "test", nl
	;messageLen dw $-message
    testmessageLen dw 5

    toSort db "aiuhwgralpiuerhjgo",59,"paidfugaopiger", nl
	;toSortLen dw $-toSort
    toSortLen dw 34

section .text	 


; Printing function jsut for fun, pass pointer in rdi and len in rsi
print:
    mov rdx, rsi
    mov rsi, rdi 
    mov rax, sys_write	 
    mov rdi, stdout		
    syscall
ret


global _start
_start:
    ;ok, why on earth does this first print or the second not show up? 
    ;maybe has to do with output bufffering, and i keep writing over it?
    mov rdi, message
    mov rsi, [messageLen]
    call print

    mov rdi, testmessage
    mov rsi, [testmessageLen]
    call print

    ;actual sorting




    mov rdi, toSort
    mov rsi, [toSortLen]
    call print


    			 
end:
	mov rax, sys_exit	
    mov rdi, success_exit	
    syscall
