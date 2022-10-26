bits 32 

global start

extern exit

import exit msvcrt.dll
 
segment data use32 class = data
    
    string db 'Yess I am better now'
    strLen equ $-string
    var1 db 1
    var1Len equ $-var1
    
segment code use32 class = code
start:
    mov eax, 4
    mov ebx, 1
    mov ecx, string
    mov edx, strLen
    
    push dword 0
    call [exit]


