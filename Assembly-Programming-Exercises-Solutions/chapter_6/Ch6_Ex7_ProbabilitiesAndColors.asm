TITLE Programming Exercises Chapter 6 : Probabilities and Colors     (Ch6_Ex7_ProbabilitiesAndColors.asm)

; Program Desscription: Programming Exercises Chapter 6, Exercise 7
; Author: ezBinary
; Creation Date: 11.april.2024 

INCLUDE Irvine32.inc


.data
string      BYTE        "Hello World",0Dh,0Ah,0

.code
    ;----------------------------------------------------------                       
    ; PrintString: print a string
    ; 
    ; Receives:  EDX = offset of a string
    ;
    ; Returns:   Nothing
    ; Calls:     RandomRange, SetTextColor, WriteString
    ;----------------------------------------------------------
    PrintString PROC USES eax
        
        mov eax,10
        call RandomRange

        cmp eax,2
        ja EL1
        mov	eax,white + (black * 16)            ; white = 30%
        jmp return

        EL1: cmp eax,3
        jne EL2
        mov	eax,blue + (black * 16)             ; blue = 10% 
        jmp return

        EL2: mov eax,green + (black * 16)    ; gree = 60%

        return:
        call SetTextColor
        call WriteString
        ret
    PrintString ENDP

    MAIN PROC
        call ClrScr
        call Randomize
        mov edx, OFFSET string

        mov ecx,20
        L1:
            call PrintString
        LOOP L1

        mov	eax,lightGray + (black * 16)	; set default color
	    call SetTextColor
        exit
    MAIN ENDP

end MAIN