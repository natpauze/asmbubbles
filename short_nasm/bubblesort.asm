
;a simple a naive bubble sort in x86_64

;define handy macros 
%define sys_write 1
%define stdout 1

%define sys_exit 60
%define success_exit 0

%define nl 10

%define toSortLen 32
%define toSortLen_nl 34


section .data
    toSort db "aiuhwgralpiuerhjgo",59,"paidfugaopiger", nl

section .text	 



global _start
_start:
    ;actual sorting

_outerloop:
    ;init
    mov rax, toSort ;pointer to start of array
    mov rcx, toSortLen ; lenght of the array 
    mov rdi, 1 ;swap flag
    

innerloop:
    mov bl,[rax] ;load using pointer
    mov sil,[rax+1] ;load using pointer +1
    cmp sil,bl  ;compare them
    jge dontswap; if greater then other, then we dont swap them 
    ;but other wise go ahead with swap
    ;xchg bx,si
    mov [rax+1],bl 
    mov [rax], sil
    xor rdi, rdi

dontswap:
    inc rax ;move pointer 
    dec rcx  ; decrement inner counter
    jnz innerloop ; do inner loop iteration again 
    ;jmp _end ; exit early for debug

    cmp rdi, 0 ;or or and or test is smaller then cmp
    jnz _end ; go to end if we are done sorting (flag didnt get set)
    jmp _outerloop ;go back to the start 

_end:
    mov rdx, toSortLen_nl
    mov rsi, toSort
    mov rax, sys_write	 
    mov rdi, stdout		
    syscall

	mov rax, sys_exit	
    mov rdi, success_exit	
    syscall
