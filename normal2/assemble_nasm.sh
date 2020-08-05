#!/bin/bash 

objfile=$1
#assemble
echo Assembling $1 
nasm -f elf64 -l ${objfile/.asm/.lst} $1

#link 
echo Linking ${objfile/.asm/} 
ld -m elf_x86_64 -o ${objfile/.asm/} ${objfile/.asm/.o}

#gcc -o -fPIC ${objfile/.asm/} ${objfile/.asm/.o}