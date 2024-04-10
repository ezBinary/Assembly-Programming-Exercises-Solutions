TITLE Programming Exercises Chapter 6 : College Registration     (Ch6_Ex4_CollegeRegistration.asm)

; Program Desscription: Programming Exercises Chapter 6, Exercise 4
; Author: ezBinary
; Creation Date: 10.april.2024 

INCLUDE Irvine32.inc

.data
PromptGrade          BYTE        "Enter your grade: ",0
PromptCredit         BYTE        "Enter your credits: ",0
ErrMsg               BYTE        "Error: Invalid Input.",0Dh,0Ah,0
registerAllowed      BYTE        "Register Allowed",0Dh,0Ah,0
registerDenied       BYTE        "Register Denied",0Dh,0Ah,0
boolRegister         BYTE         FALSE
.data?
Grade                DWORD        ?
Credits              DWORD        ?

.code

    ;----------------------------------------------------------                       
    ; PromptGradeCredit: Ask user to input grades and credits.
    ;
    ; Receives:  Nothing
    ;
    ; Returns:   Nothing
    ; Calls:     WriteString, ReadDec
    ;----------------------------------------------------------
    PromptGradeCredit PROC USES EDX EAX
            mov edx, OFFSET PromptGrade
            call WriteString

            call ReadDec
            mov Grade,eax

            mov edx, OFFSET PromptCredit
            call WriteString

            call ReadDec
            mov Credits,eax

            call CheckInput
            ret
    PromptGradeCredit ENDP

    ;----------------------------------------------------------                       
    ; CheckInput: Check if Grades and Credits are valid.
    ;
    ; Receives:  Nothing
    ;
    ; Returns:   Nothing
    ; Calls:     WriteString
    ;----------------------------------------------------------
    CheckInput PROC USES EDX
        cmp Grade,0
        jb error
        cmp Grade,400
        ja error

        cmp Credits,1
        jb error
        cmp Credits,30
        ja error
        jmp return
        error:
        mov edx, OFFSET ErrMsg
        call WriteString
        exit
        return:
        ret
    CheckInput ENDP

    ;----------------------------------------------------------                       
    ; CheckForRegister: Check if grades and credits pass to 
    ;                   allow registration.
    ;
    ; Receives:  Nothing
    ;
    ; Returns:   Nothing
    ; Calls:     Nothing
    ;----------------------------------------------------------
    CheckForRegister PROC
        

        cmp Grade,350
        jbe J1
        jmp bTRUE

        J1:
        cmp Grade,250
        jbe J2
        cmp Credits,16
        ja J2
        jmp bTRUE

        J2:
        cmp Credits,12
        ja return

        bTRUE:
        mov boolRegister,TRUE
        return:
        ret
    CheckForRegister ENDP

    MAIN PROC
        
        call PromptGradeCredit
        call CheckForRegister

        cmp boolRegister,TRUE
        je Allowed

        mov edx, OFFSET registerDenied
        call WriteString
        jmp done

        Allowed:
        mov edx, OFFSET registerAllowed
        call WriteString

        done:
        exit
    MAIN ENDP

end MAIN