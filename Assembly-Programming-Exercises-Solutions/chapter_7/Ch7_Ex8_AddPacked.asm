TITLE Programming Exercises Chapter 7 : Add Packed  (Ch7_Ex8_AddPacked.asm)

; Program Desscription: Programming Exercises Chapter 7, Exercise 8
; Author: ezBinary
; Creation Date: 25.april.2024 

INCLUDE Irvine32.inc
.data

val1_4B         DWORD       12345678h
val2_4B         DWORD       76543322h

val1_8B         BYTE        88h,54h,23h,12h,54h,23h,12h,66h
val2_8B         BYTE        32h,32h,32h,32h,32h,32h,32h,11h

val1_16B        BYTE        88h,54h,23h,12h,54h,23h,12h,66h,88h,54h,23h,12h,54h,23h,12h,66h
val2_16B        BYTE        32h,32h,32h,32h,32h,32h,32h,11h,32h,32h,32h,32h,32h,32h,32h,11h

sum_4B          BYTE        TYPE DWORD DUP (0)
sum_8B          BYTE        TYPE QWORD DUP (0)
sum_16B         BYTE        16 DUP (0)

.code


    ;----------------------------------------------------------                       
    ; AddPacked: Add two packed decimal integers.
    ; 
    ; Receives:  ESI = Pointer to the first number
    ;            EDI = Pointer to the second number 
    ;            EDX = Pointer to the sum
    ;            ECX = Number of Bytes to add
    ;
    ; Returns:    Nothing
    ; Calls:      Nothing
    ;----------------------------------------------------------
    AddPacked PROC 
        pushad
        clc
        pushfd
        L1:
            mov al,[esi]
            mov bl,[edi]

            popfd
            jnc continue
            add al,1
            daa

            continue:
            add al,bl     
            daa
            pushfd
            mov [edx],al

            add esi,1
            add edi,1
            add edx,1
        LOOP L1
        daa

        popad
        ret
    AddPacked ENDP

    MAIN PROC
	    xor eax,eax
        xor ebx,ebx
        xor edx,edx

        mov esi,OFFSET val1_4B
        mov edi,OFFSET val2_4B
        mov edx,OFFSET sum_4B
        mov ecx,TYPE val1_4B
        call AddPacked 

        mov esi,OFFSET val1_8B
        mov edi,OFFSET val2_8B
        mov edx,OFFSET sum_8B
        mov ecx,TYPE val1_8B
        call AddPacked 

        mov esi,OFFSET val1_16B
        mov edi,OFFSET val2_16B
        mov edx,OFFSET sum_16B
        mov ecx,16
        call AddPacked 

	    exit
    MAIN ENDP

END main