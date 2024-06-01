
TITLE Programming Exercises Chapter 9 : Str_remove Procedure (Ch9_Ex3_Str_remove_Procedure.asm)

; Program Desscription: Programming Exercises Chapter 9, Exercise 3
; Author: ezBinary
; Creation Date: 1.june.2024 

INCLUDE Irvine32.inc

.data
target  BYTE    "abcxxxxdefghijklmop",0

.code
    ;----------------------------------------------------------                       
    ; Str_remove: removes n chars from string.
    ; 
    ; Receives:    
    ;              pStartPosStr: PTR BYTE,
    ;              NumberOfChar: DWORD
    ; Returns:     Nothing
    ; Calls:       Str_length
    ;----------------------------------------------------------
    Str_remove PROC,
        pStartPosStr: PTR BYTE,
        NumberOfChar: DWORD

        mov esi,pStartPosStr
        add esi,NumberOfChar
        mov edi,pStartPosStr
        INVOKE Str_length,pStartPosStr
        mov ecx,eax
        L1:
            mov al, [esi]
            mov [edi],al
            inc esi
            inc edi
        LOOP L1

        return:
        mov BYTE PTR [edi],0
        ret
    Str_remove ENDP

    MAIN PROC

        INVOKE Str_remove, ADDR [target + 3], 4
        mov edx,OFFSET target
        call WriteString

	    exit
    MAIN ENDP

END main
