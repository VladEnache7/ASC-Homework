bits 32 

global start

extern exit

import exit msvcrt.dll
 
segment data use32 class = data
    
    var1 db 11h
    .a db 22h
    .b dw 33h
    .c dd 44h
    var2 dd 1234h
    .a db 13h
    tablou dw 12h, 23h, 45h
           dw 56h, 67h
           dd 17h, 5896h
    
segment code use32 class = code
start: 
    push dword [var1.c]
    push dword [var2]
    
    call [exit]


