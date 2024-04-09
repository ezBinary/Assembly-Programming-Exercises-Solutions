TITLE Programming Exercises Chapter 5 : BetterRandomRange Procedure      (Ch5_Ex5_BetterRandomRangeProcedure.asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 5
; Author: ezBinary
; Creation Date: 8.april.2024 

INCLUDE Irvine32.inc
LCOUNT = 50
.data
M   DWORD   -300d
N   DWORD   +100d

.code

    ;----------------------------------------------------------                        
    ; BetterRandomRange: improved version of the RandomRange 
    ;                    procedure.
    ;
    ; Receives: EBX = lower bound (M)
    ;           EAX = upper bound (N-1)
    ; Returns:  EAX = Generated value
    ; Calls:    RandomRange
    ;----------------------------------------------------------
    BetterRandomRange PROC
    push ebx
        sub eax,ebx
        call RandomRange
        add eax,ebx  
    pop ebx
    ret
    BetterRandomRange ENDP

    MAIN PROC
        mov ebx, [M]                ; set lower bound

        mov	ecx,LCOUNT
        L1:
            mov eax, [N]            ; set upper bound
	        call BetterRandomRange  ; return generated value in eax
            call WriteInt           ; print eax as 32-bit int
            call Crlf
        loop L1
        exit
    MAIN ENDP

end MAIN
