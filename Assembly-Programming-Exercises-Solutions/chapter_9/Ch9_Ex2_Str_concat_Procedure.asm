
TITLE Programming Exercises Chapter 9 : Str_concat Procedure (Ch9_Ex2_Str_concat_Procedure.asm)

; Program Desscription: Programming Exercises Chapter 9, Exercise 2
; Author: ezBinary
; Creation Date: 1.june.2024 

INCLUDE Irvine32.inc

.data
targetStr   BYTE    "ABCDE",10 DUP (0)
sourceStr   BYTE    "FGH",0

.code
    ;----------------------------------------------------------                       
    ; Str_concat: concatenates a source string to the end 
    ;             target string.
    ; 
    ; Receives:    pTargetString: PTR BYTE
    ;              pSourceString: PTR BYTE
    ;
    ; Returns:     Nothing
    ; Calls:       Str_length
    ;----------------------------------------------------------
    Str_concat PROC,
        pTargetString: PTR BYTE,
        pSourceString: PTR BYTE

        INVOKE Str_length, pTargetString
        mov edi,pTargetString
        add edi,eax
        mov esi,pSourceString
        INVOKE Str_length, pSourceString
        mov ecx,eax
        cld
        rep movsb

        ret
    Str_concat ENDP

    MAIN PROC
        
        INVOKE Str_concat   , ADDR targetStr, ADDR sourceStr
        mov edx, OFFSET targetStr
        call WriteString

	    exit
    MAIN ENDP

END main
