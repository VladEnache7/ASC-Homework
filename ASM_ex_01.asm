bits 32

global start

extern exit

import exit msvcrt.dll
 
segment data use32 class = data

    a dw 9999h
    b dw 3333h
    
segment code use32 class = code
start:

    mov ax, [b]
    mov bx, [a]
    mul bx
    
    push dword 0
    call [exit]
