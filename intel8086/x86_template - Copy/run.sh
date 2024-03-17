#!/bin/bash
nasm -f elf64 $1.asm &&
gcc -m64 -no-pie -std=c17 -o $1 $1.o  &&
./$1
