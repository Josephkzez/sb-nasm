all: default
default:
	nasm -felf macro_call.asm
	gcc -m32 -c call_test.c
	gcc -m32 -o funCall macro_call.o call_test.o
