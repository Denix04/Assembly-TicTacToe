#!/bin/bash

echo "Compiling Board:"
nasm -f elf32 board.asm -F dwarf &&
echo -e "\e[32mSUCCESS\e[0m"

echo "Compiling Aux:"
nasm -f elf32 aux.asm -F dwarf &&
echo -e "\e[32mSUCCESS\e[0m"

echo -e "\nCompiling Main:"
nasm -f elf32 main.asm -F dwarf &&
echo -e "\e[32mSUCCESS\e[0m"

echo -e "\nLinking:"
gcc -m32 -o TicTacToe compile/driver.c compile/asm_io.o main.o board.o aux.o &&
echo -e "\e[32mSUCCESS\e[0m"

echo -e "\nRunning:"
./TicTacToe
