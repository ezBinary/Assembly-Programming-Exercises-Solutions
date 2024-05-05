TITLE Programming Exercises Chapter 8 : FindLargest Procedure (Ch8_Ex1_FindLargestProcedure.asm)

; Program Desscription: Programming Exercises Chapter 8, Exercise 1
; Author: ezBinary
; Creation Date: 5.may.2024 

INCLUDE Irvine32.inc

    FindLargest PROTO,
            pArray: SDWORD,
            count: DWORD

.data
Array1 SDWORD 23,45,123,4612,-12,54,-5999
Array2 SDWORD -1,-2,-3,-4,-6,-454,-2323,-1233
Array3 SDWORD 0,1,2,3,4,5,6,34,23,1999,5400,6,3000
.code
    MAIN PROC

        INVOKE FindLargest,
            ADDR Array1,
            LENGTHOF Array1

        INVOKE FindLargest,
            ADDR Array2,
            LENGTHOF Array2

        INVOKE FindLargest,
            ADDR Array3,
            LENGTHOF Array3

	    exit
    MAIN ENDP

    ;----------------------------------------------------------                       
    ; FindLargest: Find the largerst array member.
    ; 
    ; Receives:   pArray: SDWORD,
    ;             count: DWORD
    ;
    ; Returns:    EAX= Largest member in the Array
    ; Calls:      Nothing
    ;----------------------------------------------------------
    FindLargest PROC USES ESI ECX,
            pArray: SDWORD,
            count: DWORD

        mov esi,pArray
        mov ecx,count
        L1:
            push ecx
            mov eax,[esi]
            mov ecx,count
            mov edi,pArray
            L2:
                cmp eax,[edi]
                jl SMALLER
                add edi,TYPE pArray
            LOOP L2
            jmp return
            SMALLER:
            add esi,TYPE pArray
            pop ecx
        LOOP L1

        return:
        call WriteInt
        call Crlf

        ret
    FindLargest ENDP

END main
