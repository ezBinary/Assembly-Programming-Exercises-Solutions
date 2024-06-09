
TITLE Programming Exercises Chapter 9 : Str_nextWord Procedure (Ch9_Ex5_Str_nextWord_procedure.asm)

; Program Desscription: Programming Exercises Chapter 9, Exercise 5
; Author: ezBinary
; Creation Date: 5.june.2024 

INCLUDE Irvine32.inc

.data
target      BYTE    "Johnson,Calvin",0

.code
    ;----------------------------------------------------------                       
    ; Str_nextWord: find next word using delimiter char.
    ; 
    ; Receives:    pTarget: PTR BYTE,
    ;              DelimiterChar: BYTE
    ; Returns:     EAX = founded next word offset.
    ;              ZF = 1 -> founded 
    ;              ZF = 0 -> not founded
    ; Calls:       Nothing
    ;----------------------------------------------------------
    Str_nextWord PROC USES ebx edx,
        pString: PTR BYTE,
        DelimiterChar: BYTE

        mov eax,pString
        movzx ebx,DelimiterChar
        L1:
        movzx edx,BYTE PTR[eax]
        inc eax
        cmp edx,0
        je notfound
        cmp edx,ebx
        je found
        jmp L1

        notfound:
        or edx,1
        jmp return
        found:
        test eax,0
        return:
        ret
    Str_nextWord ENDP

    MAIN PROC

        INVOKE Str_nextWord, ADDR target, ','

        jz continue
        notFound:
        mov eax,0
        continue:
        call WriteHex
        call Crlf

	    exit
    MAIN ENDP

END main