#!/bin/bash

fileIn=$1

#assemble
echo Assembling $fileIn
as -gstabs -msyntax=intel -mnaked-reg -o ${fileIn/.asm/.o} $1

#link 

echo Linking ${fileIn/.asm/.o} 
ld -m elf_x86_64 -o ${fileIn/.asm/.o} ${fileIn/.asm/.o}