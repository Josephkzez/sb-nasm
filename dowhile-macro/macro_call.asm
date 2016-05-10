; 32 it
SECTION .text

global test ;unix
global _test ; windowns

%macro do 0
	%push doctx
	%$do: 
%endmacro

%macro while 1
	j%-1 %$do
	%pop
%endmacro


test:
_test:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp+8]
    mov eax, ebx
    cmp eax, 10         ;makes some checking
    do
		dec eax
		cmp eax, 0
	while Z ; condition code da flag zero
		
    pop ebx
    mov esp, ebp
    pop ebp
    ret
