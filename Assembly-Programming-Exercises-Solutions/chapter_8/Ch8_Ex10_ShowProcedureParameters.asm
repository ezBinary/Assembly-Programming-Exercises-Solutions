
TITLE Programming Exercises Chapter 8 : Show Procedure Parameters (Ch8_Ex10_ShowProcedureParameters.asm)

; Program Desscription: Programming Exercises Chapter 8, Exercise 10
; Author: ezBinary
; Creation Date: 1.june.2024 

INCLUDE Irvine32.inc

MySample PROTO,
        val1:DWORD,
        val2:DWORD,
        val3:DWORD

.data
InfoStr     BYTE    "Stack Parameters:",0
MinusStr    BYTE    "-------------------------",0
AddressStr  BYTE    "Address: ",0
isStr       BYTE    " = ",0
.code
    ;----------------------------------------------------------                       
    ; ShowParams:  Display the address and hex value of 32-bit 
    ; parameters on the stack of the procedure that called it.
    ; 
    ; Receives:    paramCount: DWORD -> numbers of parameters 
    ;
    ; Returns:     Nothing
    ; Calls:       Nothing
    ;----------------------------------------------------------
    ShowParams PROC
        
        push ebp
        mov ebp,esp

        mov edx,OFFSET InfoStr
        call WriteString
        call Crlf

        mov edx,OFFSET MinusStr
        call WriteString
        call Crlf

        mov ecx,[ebp + 8]
        push ebp
        add ebp, 20
        L1:
        mov edx,OFFSET AddressStr
        call WriteString

        mov eax,ebp
        call WriteHex

        mov edx,OFFSET isStr
        call WriteString

        mov eax,[ebp]
        call WriteHex
        call Crlf
        add ebp,4
        LOOP L1
        pop ebp
        pop ebp

        ret 4
    ShowParams ENDP

    MAIN PROC

        INVOKE MySample, 1234h, 5000h, 6543h

	    exit
    MAIN ENDP

    ;----------------------------------------------------------                       
    ; MySample:  Test Function
    ; 
    ; Receives:    val1:DWORD,
    ;              val2:DWORD,
    ;              val3:DWORD 
    ;
    ; Returns:     Nothing
    ; Calls:       Nothing
    ;----------------------------------------------------------
    MySample PROC,
        val1:DWORD,
        val2:DWORD,
        val3:DWORD

        paramCount = 3

        push paramCount
        call ShowParams

        ret
    MySample ENDP

END main
