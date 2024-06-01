TITLE Programming Exercises Chapter 9 : Improved Str_copy Procedure (Ch9_Ex1_ImprovedStr_copyProcedure.asm)

; Program Desscription: Programming Exercises Chapter 9, Exercise 1
; Author: ezBinary
; Creation Date: 1.june.2024 

INCLUDE Irvine32.inc

.data
SourceString    BYTE    "Hello World",0
SourceStringSize = ($ - SourceString)

.data?
TargetString    BYTE    SourceStringSize DUP(?)

.code
    ;----------------------------------------------------------                       
    ; Str_coptN: Improved Str_copy procedure
    ; 
    ; Receives:    source: PTR BYTE, -> source string pointer
    ;              target: PTR BYTE, -> target string pointer
    ;              MaxNumber: DWORD  -> max num. of bytes to copy
    ;
    ; Returns:     Nothing
    ; Calls:       Str_length
    ;----------------------------------------------------------
    Str_coptN PROC USES esi edi eax ecx,
        source: PTR BYTE,
        target: PTR BYTE,
        MaxNumber: DWORD

        INVOKE Str_length, source
        mov esi,source
        mov edi,target
        cmp eax,MaxNumber
        jb limit
        mov ecx,eax
        limit:
        mov ecx,MaxNumber
        continue:
        cld
        rep movsb
        mov BYTE PTR [edi],0

        ret
    Str_coptN ENDP

    MAIN PROC
        
        INVOKE Str_coptN, ADDR SourceString, ADDR TargetString, 5
        
        mov edx, OFFSET TargetString
        call WriteString  

	    exit
    MAIN ENDP

END main
