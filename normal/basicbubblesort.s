
.set sys_write, 1
.set stdout, 1

.set sys_exit, 60
.set success, 0

#  define nl 10



.section .data	
    introMessage:
     .asciz "string to bubblesort "
    introMessageLen:
        .int 14

   # message db "aiuhwgralpiuerhjgopaidfugaopiger",nl	# does nasm not have an escape char stop  from being a comment??
   # 	messageLen dw $-message

.section .text	 


.globl _start	
_start:		
    mov $sys_write, %rax  	 
    mov $stdout,%rdi 	
    mov introMessage, %rsi	
    mov introMessageLen, %rdx		 
    syscall		

    # exit cleanly 
	mov sys_exit, %rax   	
    mov success, %rdi 	
    syscall

