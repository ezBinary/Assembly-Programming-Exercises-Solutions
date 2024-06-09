
TITLE Programming Exercises Chapter 9 : Constructing a Frequency Table (Ch9_Ex6_Constructing_a_Frequency_Table.asm)

; Program Desscription: Programming Exercises Chapter 9, Exercise 6
; Author: ezBinary
; Creation Date: 6.june.2024

INCLUDE Irvine32.inc

.data
target      BYTE    "AAEBDCFBBC",0
freqTable   DWORD   256 DUP(0)

.code
    ;----------------------------------------------------------                       
    ; Get_frequencies: construct a character frequency table.
    ; 
    ; Receives:    pString: PTR BYTE,
    ;              pFreqTable: PTR DWORD
    ;
    ; Returns:     Nothing
    ; Calls:       Nothing
    ;----------------------------------------------------------
    Get_frequencies PROC,
        pString: PTR BYTE,
        pFreqTable: PTR DWORD

        pushad
        pushf

        mov edi,pFreqTable
        mov esi,pString
        L1:
        movzx eax, BYTE PTR[esi]
        cmp eax, 0
        je quit
        shl eax, 2              ; because freqTable array is DWORD -> x * 4
        add eax,pFreqTable
        inc DWORD PTR [eax]
        inc esi
        jmp L1
        quit:

        popf
        popad

        ret
    Get_frequencies ENDP

    MAIN PROC
        INVOKE Get_frequencies, ADDR target, ADDR freqTable
	    exit
    MAIN ENDP

END main