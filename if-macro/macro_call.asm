; 32 it
SECTION .text

global test ;unix
global _test ; windowns

%macro if 1
    %push if
    j%-1 %$nextif ;jumps must check the condition code given as arg
    ; then jumps to the next block specified
%endmacro

%macro else 0
    %ifctx if
        %repl else ; replace stack name to end correctly
        jmp %$endelse ; if it arived here via the code, then does not execute
        %$nextif:
    %elifctx elif
        %repl else
        jmp %$endelse ; same thing with elifs
        %$nextif:
    %else
        %error "if not defined"
    %endif
%endmacro

%macro endif 0
    %ifctx if
        %$nextif:
        %pop
    %elifctx else
        %$endelse:
        %pop
   %else 
        %error "if not declared"
    %endif
%endmacro

test:
_test:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp+8]
    mov eax, ebx
    cmp eax, 10         ;makes some checking
    if NGE              ;if eax < 10
        cmp eax, 5
        if GE           ; if 5 <= eax < 10
            mov eax, 7000; then eax = 7000
        else            ; if eax < 5
            add eax, eax; then eax += eax
        endif
    else                ; else (eax == 10)
        add eax, 10     ; then eax *= 10
    endif

    pop ebx
    mov esp, ebp
    pop ebp
    ret
