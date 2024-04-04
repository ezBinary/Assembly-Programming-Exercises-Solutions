TITLE Programming Exercises Chapter 3 : AddVariables Program using 64-bit Variables      (Ch3_Ex5_AddVariablesProgramUsing64-bitVariables.asm)

; Program Desscription: Programming Exercises Chapter 3, Exercise 6
; Author: ezBinary
; Creation Date: 3.april.2024 

ExitProcess PROTO
.data?
    sum             QWORD       ?
.data

    first_val       QWORD       20002000h
    second_val      QWORD       11111111h
    third_val       QWORD       22222222h

.code
    MAIN PROC
        
        mov rax, [first_val]
        add rax, [second_val]
        add rax, [third_val]
        mov [sum], rax

        mov rcx,0
        call ExitProcess

    MAIN ENDP
end