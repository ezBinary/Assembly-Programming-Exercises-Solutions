
TITLE Programming Exercises Chapter 8 : Counting Near Matching Elements (Ch8_Ex9_CountingNearMatchingElements.asm)

; Program Desscription: Programming Exercises Chapter 8, Exercise 9
; Author: ezBinary
; Creation Date: 1.june.2024 

INCLUDE Irvine32.inc

CountNearMatches PROTO,
        pArray1: PTR SDWORD,
        pArray2: PTR SDWORD,
        LengthArray: DWORD,
        diff: DWORD
.data
Array1  DWORD   1,2,3,4,5,6,7,8
Array2  DWORD   3,4,5,6,7,20,30,50

.code

    MAIN PROC

        INVOKE CountNearMatches,ADDR Array1,ADDR Array2,LENGTHOF Array1,2
        call WriteDec

	    exit
    MAIN ENDP

    ;----------------------------------------------------------                       
    ; CountNearMatches:  Count Nearly Matchin Elements.
    ; 
    ; Receives:    pArray1: PTR SDWORD,
    ;              pArray2: PTR SDWORD,
    ;              LengthArray: DWORD,
    ;              diff: DWORD 
    ;
    ; Returns:     EAX = Count
    ; Calls:       Nothing
    ;----------------------------------------------------------
    CountNearMatches PROC USES esi edi edx,
        pArray1: PTR SDWORD,
        pArray2: PTR SDWORD,
        LengthArray: DWORD,
        diff: DWORD

        mov esi,pArray1
        mov edi,pArray2
        mov ecx,LengthArray
        xor eax,eax

        L1:
        mov ebx,[esi]
        mov edx,[edi]
        cmp ebx,edx
        ja check
        xchg ebx,edx
        check:
        sub ebx,edx
        cmp ebx,diff
        ja continue
        inc eax
        continue:
        add esi,TYPE SDWORD
        add edi,TYPE SDWORD
        LOOP L1
        
        ret
    CountNearMatches ENDP

END main
