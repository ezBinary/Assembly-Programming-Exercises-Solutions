
TITLE Programming Exercises Chapter 8 : Counting Matching Elements (Ch8_Ex8_CountingMatchingElements.asm)

; Program Desscription: Programming Exercises Chapter 8, Exercise 8
; Author: ezBinary
; Creation Date: 1.june.2024 

INCLUDE Irvine32.inc

CountMatches PROTO, 
        pArray1: PTR SDWORD,
        pArray2: PTR SDWORD,
        LengthArray: DWORD

.data
Array1  SDWORD   -1,2,4,5,60,-54,10
Array2  SDWORD    1,2,3,4,5 , 6 ,7

.code

    MAIN PROC

        INVOKE CountMatches,ADDR Array1,ADDR Array2,LENGTHOF Array1
        call WriteDec

	    exit
    MAIN ENDP

    ;----------------------------------------------------------                       
    ; CountMatches:  Count Matchin Elements.
    ; 
    ; Receives:    pArray1: PTR SDWORD,
    ;              pArray2: PTR SDWORD,
    ;              LengthArray: DWORD
    ;
    ; Returns:     EAX = Count
    ; Calls:       Nothing
    ;----------------------------------------------------------
    CountMatches PROC USES esi edi edx,
        pArray1: PTR SDWORD,
        pArray2: PTR SDWORD,
        LengthArray: DWORD

        mov esi,pArray1
        mov edi,pArray2
        mov ecx,LengthArray
        xor eax,eax

        L1:
            mov edx,[esi]
            cmp edx,[edi]
            jne continue
            inc eax
            continue:
            add esi,TYPE DWORD
            add edi,TYPE DWORD
        LOOP L1
        
        ret
    CountMatches ENDP

END main
