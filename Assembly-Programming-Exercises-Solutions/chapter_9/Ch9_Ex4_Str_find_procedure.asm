
TITLE Programming Exercises Chapter 9 : Str_find Procedure (Ch9_Ex4_Str_find_procedure.asm)

; Program Desscription: Programming Exercises Chapter 9, Exercise 4
; Author: ezBinary
; Creation Date: 5.june.2024 

INCLUDE Irvine32.inc

.data
target  BYTE    "123ABC342432",0
source  BYTE    "ABC",0
.data?
pos     dword   ?
.code
    ;----------------------------------------------------------                       
    ; Str_find: find a string from another string
    ; 
    ; Receives:    pTarget: PTR BYTE,
    ;              pSource: PTR BYTE
    ; Returns:     EAX = founded string offset.
    ;              ZF = 1 -> founded 
    ;              ZF = 0 -> not founded
    ; Calls:       Str_length
    ;----------------------------------------------------------
    Str_find PROC USES EDI EBX EDX,
        pSource: PTR BYTE,
        pTarget: PTR BYTE
        
        mov eax, pTarget
        mov edi, pSource
        L1:
            mov bl,BYTE PTR[eax]
            inc eax
            mov dl,BYTE PTR[edi]
            cmp bl,0
            je notfound
        
            cmp dl,0
            je found

            cmp bl,dl
            je FindNext
        
            GoNext:
                mov edi, pSource
                jmp L1
            FindNext:
                inc edi
        jmp L1

        notfound:
        test eax,1
        jmp return
        found:
        push eax
        INVOKE Str_length, pSource
        inc eax
        mov ebx,eax
        pop eax
        sub eax,ebx
        test eax,0
        return:
        
        ret
    Str_find ENDP

    MAIN PROC

        INVOKE Str_find, ADDR source, ADDR target

        jnz notFound
        mov pos,eax
        jmp continue
        notFound:
        mov eax,0
        continue:
        call WriteHex
        call Crlf

	    exit
    MAIN ENDP

END main