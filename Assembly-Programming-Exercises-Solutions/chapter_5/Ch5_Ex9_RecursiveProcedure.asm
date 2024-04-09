TITLE Programming Exercises Chapter 5 : Recursive Procedure      (Ch5_Ex9_RecursiveProcedure.asm)

; Program Desscription: Programming Exercises Chapter 5, Exercise 9
; Author: ezBinary
; Creation Date: 8.april.2024 

INCLUDE Irvine32.inc
RCOUNT = 10
.code

    ;----------------------------------------------------------                        
    ; Recursive: Recursive procedure using loop instruction to
    ;            control it
    ;
    ; Receives: EAX = 0
    ;           ECX = number of recursion
    ; Returns:  EAX increases recursively n times
    ; Calls:    Nothing
    ;----------------------------------------------------------
    Recursive PROC
        inc eax
        LOOP L1
            ret             ; return if ecx == 0
        L1:                 ; jmp here if ecx > 0
        call Recursive
	    ret
    Recursive ENDP

    MAIN PROC
        mov eax,0
        mov ecx,RCOUNT
        call Recursive

        exit
    MAIN ENDP

end MAIN