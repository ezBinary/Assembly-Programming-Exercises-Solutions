
TITLE Programming Exercises Chapter 8 : FindThrees Procedure (Ch8_Ex4_FindThreesProcedure.asm)

; Program Desscription: Programming Exercises Chapter 8, Exercise 4
; Author: ezBinary
; Creation Date: 5.may.2024 

INCLUDE Irvine32.inc

.data
Array1  DWORD   1,2,3,4,5,6,7,8,9
Array2  DWORD   2,3,3,3,3,4,5,6,3
.code

    ;----------------------------------------------------------                       
    ; FindThrees: Search array for three consecutive of 3 in 
    ;             array.
    ; 
    ; Receives:   pArray: DWORD -> pointer to array
    ;             Count:  DWORD -> Length of array
    ;
    ; Returns:    EAX = 1 -> true & EAX = 0 -> false
    ; Calls:      Nothing
    ;----------------------------------------------------------
    FindThrees PROC USES EBX ECX EDX ESI, 
        pArray: DWORD,
        Count: DWORD

        mov esi,pArray
        mov ecx,Count
        mov eax,0
        mov edx,0
        L1:
            mov ebx,[esi]

            cmp ebx,3
            jnz NotConsecutive
            inc edx

            cmp edx,3
            jnz continue
            mov eax,1
            jmp return

            NotConsecutive:
                mov eax,0
                mov edx,0

            continue:
                add esi,TYPE pArray
        LOOP L1

        return:
        
        ret
    FindThrees ENDP
    MAIN PROC

        INVOKE FindThrees, 
            ADDR Array1,
            LENGTHOF Array1
        call WriteDec

        call Crlf

        INVOKE FindThrees, 
            ADDR Array2,
            LENGTHOF Array2
            
        call WriteDec
        
        call Crlf

	    exit
    MAIN ENDP

END main