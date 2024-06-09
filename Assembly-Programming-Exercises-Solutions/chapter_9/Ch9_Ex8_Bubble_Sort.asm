
TITLE Programming Exercises Chapter 9 : Bubble Sort (Ch9_Ex8_Bubble_Sort.asm)

; Program Desscription: Programming Exercises Chapter 9, Exercise 8
; Author: ezBinary
; Creation Date: 6.june.2024

INCLUDE Irvine32.inc

.data
Array1 dword 4,3,2,1,5,6,7,8,9

.code
    ;----------------------------------------------------------                       
    ; BubbleSort: Bubble sort with exchange flag
    ; 
    ; Receives:    pArray:PTR DWORD,
    ;              Count: DWORD
    ;
    ; Returns:     Nothing
    ; Calls:       Nothing
    ;----------------------------------------------------------
    BubbleSort PROC,
        pArray:PTR DWORD,
        Count: DWORD

        pushad
        pushf

        mov ecx,Count
        dec ecx

        
        L1:
            push ecx
            mov esi,pArray
            mov ebx,0                           ; exchange flag
            L2:
                mov eax,[esi]
                cmp [esi + TYPE DWORD], eax
                jg  skip
                xchg eax,[esi + TYPE DWORD]
                mov [esi],eax
                mov ebx,1

                skip:
                add esi, TYPE DWORD

            LOOP L2

            pop ecx

            cmp ebx,0
            je quit

        LOOP L1

        quit:
        popf
        popad
        ret
    BubbleSort ENDP

    MAIN PROC

        INVOKE BubbleSort, ADDR Array1, lengthof Array1

	    exit
    MAIN ENDP

END main