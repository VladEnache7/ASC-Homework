bits 32 

global start

extern exit

import exit msvcrt.dll
 
segment data use32 class = data
    
    a dd 1000
    b db 100
    c dw 4
    d db 10
    e dq 300
    two db 2
    
segment code use32 class = code
start: ;a + b / c - d * 2 - e
    mov AL, [b]     ;AL = b
    mov AH, 0       ;AL -> AX (unsigned)
    mov DX, 0       ;AX -> DX:AX (unsigned) DX:AX = b
    
    div WORD [c]    ;AX = b / c
    mov BX, AX      ;BX = AX = b / c
    mov AL, [d]     ;AL = d
    mul BYTE [two]  ;AX = d * 2
    sub BX, AX      ;BX = b / c - d * 2
    
    push WORD 0
    push BX         ;stack = 00 00 BX = EBX
    pop EBX         ;EBX = b / c - d * 2
    
    mov EAX, [a]    ;EAX = a
    add EAX, EBX    ;EAX = a + b / c - d * 2
    
    mov EDX, 0      ;EDX:EAX = a + b / c - d * 2
    sub EAX, [e]    ;EAX = lower dword of e
    sbb EDX, [e + 4];EDX = subtract with CF the high part of e
    push dword 0
    call [exit]


