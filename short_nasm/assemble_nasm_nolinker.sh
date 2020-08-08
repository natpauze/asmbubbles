#!/bin/bash 

objfile=$1
#assemble
echo Assembling $1 
nasm -f bin -o ${objfile/.asm/} $1

#link 
#echo Linking ${objfile/.asm/} 
#ld -s -m elf_x86_64 -o ${objfile/.asm/} ${objfile/.asm/.o}

#gcc -o -fPIC ${objfile/.asm/} ${objfile/.asm/.o}