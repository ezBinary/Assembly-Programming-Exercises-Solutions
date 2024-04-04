TITLE Programming Exercises Chapter 3 : Symbolic Text Constants       (Ch3_Ex4_SymbolicTextConstants.asm)

; Program Desscription: Programming Exercises Chapter 3, Exercise 4
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

equ_symbol      EQU         <"EQU symbol">
textequ_symbol  TEXTEQU     <"TEXTEQU symbol">
endline_symbol  TEXTEQU     <0Dh,0Ah>

.data

string_1    BYTE    equ_symbol       ,   endline_symbol      ; EQU symbol
string_2    BYTE    textequ_symbol   ,   endline_symbol      ; TEXTEQU symbol
equalsign_symbol_1 = 'A'
equalsign_symbol_2 = 'B'
string_3    BYTE    equalsign_symbol_1, equalsign_symbol_2 , endline_symbol      ; Equal-Sign symbol

.code
    MAIN PROc
        
        call DumpRegs
        exit

    MAIN ENDP
end MAIN
