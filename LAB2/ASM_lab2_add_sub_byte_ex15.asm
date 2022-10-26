bits 32 ;a-b-d+2+c+(10-b)
        ;10 - 5 - 8 + 2 + 6 + 5
global start

extern exit

import exit msvcrt.dll
 
segment data use32 class = data

    a dw 10
    b dw 5
    c dw 6
    d dw 8
    
segment code use32 class = code
start:

    mov ax, [a] ;ax = ax + a
    sub ax, [b] ;ax = a - b
    sub ax, [d] ;ax = a - b - d
    add ax, 2   ;ax = a - b - d + 2
    add ax, [c] ;ax = a - b - d + 2 + c
    mov bx, 10  ;bx = 10
    sub bx, [b] ;bx = 10 - b
    add ax, bx  ;ax = a - b - d + 2 + c + 10 - b
    
    push dword 0
    call [exit]

