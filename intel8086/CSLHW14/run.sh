#!/bin/bash
#nasm -f elf64 asm_io.asm && 
g++ -m64 -no-pie -std=c++17 -c driver.cpp
nasm -f elf64 $1.asm &&
g++ -m64 -no-pie -std=c++17 -o $1 driver.cpp $1.o &&
./$1
