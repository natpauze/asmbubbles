#!/bin/bash

fileIn=$1

#assemble
echo Assembling $fileIn
as -gstabs -o ${fileIn/.s/.o} $1

#link 

echo Linking ${fileIn/.s/.o} 
ld -o ${fileIn/.s/} ${fileIn/.s/.o}