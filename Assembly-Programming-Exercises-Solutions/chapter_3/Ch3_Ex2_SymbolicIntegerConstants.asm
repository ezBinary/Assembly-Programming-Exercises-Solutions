TITLE Programming Exercises Chapter 3 : Symbolic Integer Constants      (Ch3_Ex2_SymbolicIntegerConstants.asm)

; Program Desscription: Programming Exercises Chapter 3, Exercise 2
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc
; Define the symbolic constants
Monday      EQU     <"Monday">
Tuesday     EQU     <"Tuesday">
Wednesday   EQU     <"Monday">
Thursday    EQU     <"Monday">
Friday      EQU     <"Friday">
Saturday    EQU     <"Saturday">
Sunday      EQU     <"Sunday">

comma       EQU     <,>

.data
    DaysOfTheWeek   BYTE   Monday comma Tuesday comma Wednesday comma Thursday comma
                           Friday comma Saturday comma Sunday
.code
    MAIN PROc
        

        mov esi, OFFSET DaysOfTheWeek

        call DumpRegs

        exit

    MAIN ENDP
end MAIN
