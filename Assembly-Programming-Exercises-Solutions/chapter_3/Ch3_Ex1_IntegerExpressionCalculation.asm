TITLE Programming Exercises Chapter 3 : Integer Expression Calculation      (Ch3_Ex1_IntegerExpressionCalculation.asm)

; Program Desscription: Programming Exercises Chapter 3, Exercise1
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

.data
    val_A   DWORD   3000h
    val_B   DWORD   1500h
    val_C   DWORD   2000h
    val_D   DWORD   1000h
.code
    MAIN PROc
        ; Expression : val_A = (val_A + val_B) - (val_C + val_D)

        mov eax, [val_A]
        mov ebx, [val_B]
        mov ecx, [val_C]
        mov edx, [val_D]

        ; (val_A + val_B) = eax
        add eax,ebx
        ; (val_C + val_D) = ecx
        add ecx,edx
        ; eax -= ecx
        sub eax,ecx
		
        mov val_A,eax
		
        call DumpRegs

        exit

    MAIN ENDP
end MAIN
