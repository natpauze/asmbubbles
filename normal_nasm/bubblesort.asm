
;basically jsut for a warm up, done in parts, from here https://www.briansteffens.com/introduction-to-64-bit-assembly/01-hello-world/

;define handy macros 
%define sys_write 1
%define stdout 1

%define sys_exit 60
%define success_exit 0

%define nl 10



section .data

    message db "String to bubblesort", nl
	;messageLen dw $-message
    messageLen dq $-message

    toSort db "aiuhwgralpiuerhjgo",59,"paidfugaopiger", nl
	;toSortLen dw $-toSort
    toSortLen dq 34

section .text	 


; Printing function pass pointer in rdi and len in rsi
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
    
    mov rdi, toSort
    mov rsi, [toSortLen]
    call print

    ;actual sorting

    ;init
    mov rax, toSort ;pointer to start of array
    mov rcx, [toSortLen] ; lenght of the array into outer loop couter
    mov rdx, [toSortLen] ; lenght of the array into inner loop couter
    ;mov rdi, 0 ; swap flag 

innerloop:
    mov bx,[rax] ;load using pointer
    mov si,[rax+1] ;load using pointer +1
    cmp bx,si  ;compare them
    jge dontswap; if greater then other, then we dont swap them 
    ;but other wise go ahead with swap
    ;xchg bx,si
    mov [rax+1],bx 
    mov [rax], si 

dontswap:
    inc rax
    dec rdx  ; decrement inner counter
    jnz innerloop ; do inner loop iteration again 
    dec rcx ;decrement outer loop
    jz _end ; go to end if we are done sorting other wise outer loop logic below makes it go again
    mov rdx,rcx ;set inner loop back to what it was -1 (-1 allready done)
    mov rax, toSort;reset pointer to start of array
    jmp innerloop


;go back to the start 

_end:
    mov rdi, toSort
    mov rsi, [toSortLen]
    call print



    			 
end:
	mov rax, sys_exit	
    mov rdi, success_exit	
    syscall
