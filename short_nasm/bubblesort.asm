
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
    mov eax, toSort ;pointer to start of array
    mov cx, toSortLen ; lenght of the array 
    mov dil, 1 ;swap flag
    

innerloop:
    mov bl,[eax] ;load using pointer
    mov sil,[eax+1] ;load using pointer +1
    cmp sil,bl  ;compare them
    jge dontswap; if greater then other, then we dont swap them 
    ;but other wise go ahead with swap
    ;xchg bx,si
    mov [eax+1],bl 
    mov [eax], sil
    xor dil, dil

dontswap:
    inc eax ;move pointer 
    dec cx  ; decrement inner counter
    jnz innerloop ; do inner loop iteration again 
    ;jmp _end ; exit early for debug

    and dil, dil ;or or and or test is smaller then cmp
    jnz _end ; go to end if we are done sorting (flag didnt get set)
    jmp _outerloop ;go back to the start 

_end:
    mov rdx, toSortLen_nl
    mov rsi, toSort
    mov eax, sys_write	 
    mov rdi, stdout		
    syscall

	mov eax, sys_exit	
    mov rdi, success_exit	
    syscall
