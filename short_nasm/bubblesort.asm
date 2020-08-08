
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
    mov r9d,eax
    inc r9d
    mov cx, toSortLen ; lenght of the array 
    inc dil;swap flag
    

innerloop:
    mov bl,[eax] ;load using pointer
    mov sil,[r9d] ;load using pointer +1
    mov r10b, sil
    cmp sil,bl  ;compare them

    ;conditional swapping, has to do it on 16 bit reg
    cmovl si,bx 
    cmovl bx, r10w
    cmovl di,r11w ; it should be inititlized to 0 

    ;xor dil, dil

    ;jge dontswap; if greater then other, then we dont swap them 
    ;but other wise go ahead with swap
    ;xchg bx,si
    ;mov [eax+1],bl 
    ;mov [eax], sil
    

dontswap:
    inc eax ;move pointer 
    inc r9d
    dec cx  ; decrement inner counter
    jnz innerloop ; do inner loop iteration again 
    ;jmp _end ; exit early for debug

    and dil, dil ;or or and or test is smaller then cmp
    jnz _end ; go to end if we are done sorting (flag didnt get set)
    jmp _outerloop ;go back to the start 

_end:
    mov dl, toSortLen_nl
    mov rsi, toSort
    mov eax, sys_write	 
    mov rdi, stdout		
    syscall

	mov eax, sys_exit	
    mov rdi, success_exit	
    syscall
