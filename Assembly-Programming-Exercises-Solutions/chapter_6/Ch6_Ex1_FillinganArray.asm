TITLE Programming Exercises Chapter 6 : Filling an Array      (Ch6_Ex1_FillinganArray.asm)

; Program Desscription: Programming Exercises Chapter 6, Exercise 1
; Author: ezBinary
; Creation Date: 10.april.2024 

INCLUDE Irvine32.inc

N = 40

.data
J           DWORD   5000d
K           DWORD   10000d

.data?
array_DW    DWORD   N DUP(?)

.code

    ;----------------------------------------------------------                       
    ; FillArrayWithRandomValues: Fills an array of DWORD with 
    ;                            N random integers in the range
    ;                            : J < VALUE < K
    ; 
    ; Receives:  ESI = Offset array
    ;            EBX = Type array
    ;            ECX = Length of array (N)
    ;            EDX = J (min value)
    ;            EAX = K (max value)
    ;
    ; Returns:  Nothing
    ; Calls:    RandomRange
    ;----------------------------------------------------------
    FillArrayWithRandomValues PROC
        pushad
        FillArray:
            push eax

            sub eax,edx                 ; K - J
            add eax,1                   

            call RandomRange            ; Generate a random value between 0 and K-J+1
            add eax,edx                 ; Add J to the random value to get a value 
                                        ; within the range J <= VALUE < K

            mov [esi],eax               ; Move random value to the array
            add esi,ebx                 ; Add 4 byte(DWORD)

            pop eax
        LOOP FillArray 
        popad
        ret
    FillArrayWithRandomValues ENDP

    MAIN PROC
        mov esi, OFFSET array_DW
        mov ebx, TYPE array_DW
        mov ecx, LENGTHOF array_DW
        mov edx, [J]
        mov eax, [K]

        call FillArrayWithRandomValues

        mov [K],200
        mov [J],-200
        mov edx, [J]
        mov eax, [K]
		
        call FillArrayWithRandomValues
		
        exit
    MAIN ENDP

end MAIN
