#!/bin/bash 


#assemble
echo Assembling $1 
nasm -f elf64 $1

#link 
objfile=$1
echo Linking ${objfile/.asm/} 
ld -s -o ${objfile/.asm/} ${objfile/.asm/.o}