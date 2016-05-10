; 32 it
SECTION .text

global test ;unix
global _test ; windowns

%macro endwhile 0
	jmp %$while
	%$endwhile:
	%pop
%endmacro

%macro while 1
	%push whilectx
	%$while:
	j%1 %$endwhile 
%endmacro


test:
_test:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp+8]
    mov eax, ebx
    cmp eax, 42         ;makes some checking
	while Z
		add eax, 1
		cmp eax, 42
	endwhile ; condition code da flag zero
		
    pop ebx
    mov esp, ebp
    pop ebp
    ret
