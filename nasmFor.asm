SECTION .data
	msg db 'Hello World',10,0
	fmt db '%d'
	valor db 0x41

SECTION .text

extern _printf
global _WinMain@16
_WinMain@16:
		%macro forLTloop 2
			mov eax, %1
			mov ebx, %2
			%push forLTloop	;LT = less than
			%$inicioLoop:
			cmp eax, ebx
			jge %$fimLoop	;se %1 < %2, 
		%endmacro			;caso contrario, segue o codigo entre for-end
		
		%macro endforLTloop 1
			add eax, %1		;incrementa o contador
			jmp %$inicioLoop
			%$fimLoop:
			%pop forLTloop
		%endmacro
		
		push ebp
		mov ebp, esp
		;incremento eax
		forLTloop 1, 4
			call _printf
		endforLTloop 1
		pop ebp
		ret