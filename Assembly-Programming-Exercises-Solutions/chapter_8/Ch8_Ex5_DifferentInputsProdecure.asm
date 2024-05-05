
TITLE Programming Exercises Chapter 8 : DifferentInputs Prodecure (Ch8_Ex5_DifferentInputsProdecure.asm)

; Program Desscription: Programming Exercises Chapter 8, Exercise 5
; Author: ezBinary
; Creation Date: 5.may.2024 

INCLUDE Irvine32.inc
DifferentInputs PROTO,
            value1: DWORD,
            value2: DWORD,
            value3: DWORD
.data

.code

    MAIN PROC

        INVOKE DifferentInputs,2,3,4
        call WriteDec
        call Crlf

        INVOKE DifferentInputs,1111,111,11
        call WriteDec
        call Crlf

        INVOKE DifferentInputs,0,0,0
        call WriteDec
        call Crlf

        INVOKE DifferentInputs,23,23,12
        call WriteDec
        call Crlf

        INVOKE DifferentInputs,4,999,0999
        call WriteDec
        call Crlf

	    exit
    MAIN ENDP

    ;----------------------------------------------------------                       
    ; DifferentInputs: 
    ; 
    ; Receives:   
    ;
    ; Returns:    
    ; Calls:      Nothing
    ;----------------------------------------------------------
    DifferentInputs PROC USES ECX,
                    value1: DWORD,
                    value2: DWORD,
                    value3: DWORD

        mov ebx,value1
        cmp ebx,value2
        jz NotDifferent
        ; &&
        cmp ebx,value3
        jz NotDifferent
        ; &&
        mov ebx,value2
        cmp ebx,value3
        jz NotDifferent

        mov eax,1
        jmp return

        NotDifferent:
            mov eax,0

        return:

        ret
    DifferentInputs ENDP

END main