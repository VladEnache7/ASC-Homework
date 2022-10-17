bits 32

global start

extern exit

import exit msvcrt.dll
 
segment data use32 class = data


    
segment code use32 class = code
start:

    mov eax, 5
    mov ax, 6
    mov ah, 7
    mov al, 8
    
    push dword 0
    call [exit]
