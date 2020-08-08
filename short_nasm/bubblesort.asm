
;a simple a naive bubble sort in x86_64

;define handy macros 
%define sys_write 1
%define stdout 1

%define sys_exit 60
%define success_exit 0

%define nl 10

%define toSortLen 32
%define toSortLen_nl 34


bits 64

    org    0x00400000      ;Program load offset

;64-bit ELF header
ehdr:
    ;ELF Magic + 2 (64-bit), 1 (LSB), 1 (ELF ver. 1), 0 (ABI ver.)
    db 0x7F, "ELF", 2, 1, 1, 0             ;e_ident
    
    times 8 db 0                           ;reserved (zeroes)
    
    dw 2                    ;e_type:       Executable file
    dw 0x3e                 ;e_machine:    AMD64
    dd 1                    ;e_version:    current version
    dq _start               ;e_entry:      program entry address (0x78)
    dq phdr - $$            ;e_phoff       program header offset (0x40)
    dq 0                    ;e_shoff       no section headers
    dd 0                    ;e_flags       no flags
    dw ehdrsize             ;e_ehsize:     ELF header size (0x40)
    dw phdrsize             ;e_phentsize:  program header size (0x38)
    dw 1                    ;e_phnum:      one program header
    dw 0                    ;e_shentsize
    dw 0                    ;e_shnum
    dw 0                    ;e_shstrndx

ehdrsize equ $ - ehdr

;64-bit ELF program header
phdr:
    dd 1                    ;p_type:       loadable segment
    dd 5                    ;p_flags       read and execute
    dq 0                    ;p_offset
    dq $$                   ;p_vaddr:      start of the current section
    dq $$                   ;p_paddr:      
    dq filesize             ;p_filesz
    dq filesize             ;p_memsz
    dq 0x200000             ;p_align:      2^11=200000=11 bit boundaries

;program header size
phdrsize equ $ - phdr




section .text	 



global _start
_start:
    ;first call mprotect to get write for the string
    mov rax, 10 ;its call 10
    mov rdi, toSort;start address
    mov rsi, toSortLen_nl;lenght
    mov rdx, 0b00001110;permisions flags
    syscall


_outerloop:
    ;init
    mov eax, toSort ;pointer to start of array
    mov cx, toSortLen ; lenght of the array 
    inc dil;swap flag
    

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
    mov dl, toSortLen_nl
    mov rsi, toSort
    mov eax, sys_write	 
    mov rdi, stdout		
    syscall

	mov eax, sys_exit	
    mov rdi, success_exit	
    syscall


    toSort db "aiuhwgralpiuerhjgo",59,"paidfugaopiger", nl


filesize      equ     $ - $$