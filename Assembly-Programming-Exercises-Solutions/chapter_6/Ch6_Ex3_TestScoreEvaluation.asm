TITLE Programming Exercises Chapter 6 : Test Score Evaluation      (Ch6_Ex3_TestScoreEvaluation.asm)

; Program Desscription: Programming Exercises Chapter 6, Exercise 3
; Author: ezBinary
; Creation Date: 10.april.2024 

INCLUDE Irvine32.inc

GCOUNT = 10

.code

    ;----------------------------------------------------------                       
    ; CalcGrafe: Calculate the grade from the score
    ;
    ; Receives:  EAX = Score (0-100)
    ;
    ; Returns:   AL = Letter Grade
    ; Calls:     Nothing
    ;----------------------------------------------------------
    CalcGrafe PROC
        
        cmp eax,90
        jae GradeA

        cmp eax,80
        jae GradeB

        cmp eax,70
        jae GradeC

        cmp eax,60
        jae GradeD
        jmp GradeF

        GradeA: mov	al,'A'
                jmp return

        GradeB: mov	al,'B'
                jmp return

        GradeC: mov	al,'C'
                jmp return

        GradeD: mov	al,'D'
                jmp return

        GradeF: mov	al,'F'

        return:
            ret
    CalcGrafe ENDP

    MAIN PROC
        mov ecx,GCOUNT
        call Randomize
        L1:
            mov eax,100
            call RandomRange
            call WriteDec

            push eax
            mov al,':'
            call WriteChar
            pop eax

            call CalcGrafe
            call WriteChar
            call Crlf

        LOOP L1


        exit
    MAIN ENDP

end MAIN