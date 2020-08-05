#!/bin/bash 


#assemble
echo Assembling $1 
nasm -f elf64 -F dwarf -g $1

#link 
objfile=$1
echo Linking ${objfile/.asm/} 
ld -m elf_x86_64 -o ${objfile/.asm/} ${objfile/.asm/.o}