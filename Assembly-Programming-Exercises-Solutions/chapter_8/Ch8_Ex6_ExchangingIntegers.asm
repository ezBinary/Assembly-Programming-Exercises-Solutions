
TITLE Programming Exercises Chapter 8 : Exchanging Integers (Ch8_Ex6_ExchangingIntegers.asm)

; Program Desscription: Programming Exercises Chapter 8, Exercise 6
; Author: ezBinary
; Creation Date: 5.may.2024 

INCLUDE Irvine32.inc

Swap PROTO pValue1:DWORD,pValue2: DWORD

.data?
Array1      DWORD       10 DUP(?)
.code

    MAIN PROC
        
        push OFFSET Array1
        push LENGTHOF Array1
        call CreateArray
        mov ecx,LENGTHOF Array1

        mov esi,OFFSET Array1
        mov edi,OFFSET Array1 + 4
        mov ecx,LENGTHOF Array1
        shr ecx,1       ; ecx/2

        L1:
            INVOKE Swap, esi, edi
            add esi,2 * TYPE DWORD
            add edi,2 * TYPE DWORD
        LOOP L1

	    exit
    MAIN ENDP

    ;----------------------------------------------------------                       
    ; CreateArray:  Create an array using randomly integers.
    ; 
    ; Receives:     Offset array,length of array
    ;
    ; Returns:      Nothing
    ; Calls:        Randomize, RandomRange
    ;----------------------------------------------------------
    CreateArray PROC
        push ebp
        mov ebp,esp

        pushad

        mov esi,[ebp + 12]
        mov ecx,[ebp + 8]

        call Randomize
        L1:
            mov eax,10
            call RandomRange
            mov [esi],eax
            add esi,TYPE DWORD
        LOOP L1

        popad

        pop ebp

        ret 8
    CreateArray ENDP

    ;----------------------------------------------------------                       
    ; Swap:  Swap two value
    ; 
    ; Receives:     Pointer value1,Pointer value2
    ;
    ; Returns:      Nothing
    ; Calls:        Nothing
    ;----------------------------------------------------------
    Swap PROC USES EAX pValue1:DWORD,pValue2: DWORD
        
        mov eax,[pValue1]
        xchg eax,[pValue2]
        mov [pValue1],eax
        ret
    Swap ENDP


END main