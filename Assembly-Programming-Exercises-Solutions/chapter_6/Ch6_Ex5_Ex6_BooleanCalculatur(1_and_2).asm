TITLE Programming Exercises Chapter 6 : Boolean Calculatur     (Ch6_Ex5_Ex6_BooleanCalculatur(1_and_2).asm)

; Program Desscription: Programming Exercises Chapter 6, Exercise 5 & 6
; Author: ezBinary
; Creation Date: 11.april.2024 

INCLUDE Irvine32.inc

CR_LF equ <0Dh,0Ah>

.data

    CaseTable       BYTE    1
                    DWORD   AND_op
    EntrySize   =   ($ - CaseTable)
                    BYTE    2
                    DWORD   OR_op
                    
                    BYTE    3
                    DWORD   NOT_op

                    BYTE    4
                    DWORD   XOR_op
    NumberOfEntries =   ($ - CaseTable) / EntrySize

    Prompt          BYTE    "Options:",CR_LF
    		        BYTE	"1. x AND y",CR_LF
		            BYTE	"2. x OR y",CR_LF
		            BYTE	"3. NOT x",CR_LF
		            BYTE	"4. x XOR y",CR_LF
		            BYTE    "5. Exit program",CR_LF
                    BYTE    "Select: ",0

    AndOP_Msg       BYTE    "[*] AND Operation",CR_LF,0
    OrOp_Msg        BYTE    "[*] OR Operation",CR_LF,0
    NotX_Msg        BYTE    "[*] NOT Operation",CR_LF,0
    XorOp_Msf       BYTE    "[*] XOR Operation",CR_LF,0
    
    PromptX         BYTE    "Enter X(Hex): ",0
    PromptY         BYTE    "Enter Y(Hex): ",0

    Result          BYTE    "Result: ",0

.data?

X                   DWORD   ?
Y                   DWORD   ?

.code
    ;----------------------------------------------------------                       
    ; GetX: Get X from user.
    ; 
    ; Receives:  Nothing
    ;
    ; Returns:   Save the input value in X
    ; Calls:    ReadHex, WriteString
    ;----------------------------------------------------------
    GetX PROC USES EAX EDX
        mov edx,OFFSET PromptX
        call WriteString

        call ReadHex
	    mov	X,eax

        ret
    GetX ENDP

    ;----------------------------------------------------------                       
    ; GetY: Get Y from user.
    ; 
    ; Receives:  Nothing
    ;
    ; Returns:   Save the input value in Y
    ; Calls:    ReadHex, WriteString
    ;----------------------------------------------------------
    GetY PROC USES EAX EDX
        mov edx,OFFSET PromptY
        call WriteString

        call ReadHex
	    mov	Y,eax

        ret
    GetY ENDP

    ;----------------------------------------------------------                       
    ; AND_op: It performs an AND operation between x and y.
    ; 
    ; Receives:  Nothing (Required X and Y)
    ;
    ; Returns:   EAX = X AND Y
    ; Calls:     WriteString, GetX, GetY
    ;----------------------------------------------------------
    AND_op PROC USES EDX
        
        mov edx,OFFSET AndOP_Msg
        call WriteString

        call GetX
        call GetY

        mov eax,X
        and eax,Y

        call Crlf
        ret
    AND_op ENDP

    ;----------------------------------------------------------                       
    ; OR_op: It performs an OR operation between x and y.
    ; 
    ; Receives:  Nothing (Required X and Y)
    ;
    ; Returns:   EAX = X OR Y
    ; Calls:     WriteString, GetX, GetY
    ;----------------------------------------------------------
    OR_op PROC USES EDX

        mov edx,OFFSET OrOp_Msg
        call WriteString

        call GetX
        call GetY

        mov eax,X
        or eax,Y

        call Crlf
        ret
    OR_op ENDP

    ;----------------------------------------------------------                       
    ; NOT_op: It performs a NOT operation on x
    ; 
    ; Receives:  Nothing (Required X)
    ;
    ; Returns:   EAX = NOT X
    ; Calls:     WriteString, GetX
    ;----------------------------------------------------------
    NOT_op PROC USES EDX

        mov edx,OFFSET NotX_Msg
        call WriteString

        call GetX
        
        mov eax,X
        NOT eax

        call Crlf
        ret
    NOT_op ENDP

    ;----------------------------------------------------------                       
    ; XOR_op: It performs a XOR operation between x and y.
    ; 
    ; Receives:  Nothing (Required X and Y)
    ;
    ; Returns:   EAX = X XOR Y
    ; Calls:     WriteString, GetX, GetY
    ;----------------------------------------------------------
    XOR_op PROC USES EDX

        mov edx,OFFSET XorOp_Msf
        call WriteString

        call GetX
        call GetY

        mov eax,X
        xor eax,Y

        call Crlf
        ret
    XOR_op ENDP

    ;----------------------------------------------------------                       
    ; PromptInput: Print the options
    ; 
    ; Receives:  Nothing
    ;
    ; Returns:   Nothing
    ; Calls:     WriteString,Crlf
    ;----------------------------------------------------------
    PromptInput PROC USES EDX

        mov edx,OFFSET Prompt
        call WriteString

        call Crlf
        ret
    PromptInput ENDP

    ;----------------------------------------------------------                       
    ; PrintResult: Print the results
    ; 
    ; Receives:  EAX = the result.
    ;
    ; Returns:   Nothing
    ; Calls:     WriteString, WriteHex
    ;----------------------------------------------------------
    PrintResult PROC USES EDX
        mov edx,OFFSET Result
        call WriteString
        call WriteHex

        call Crlf
        ret
    PrintResult ENDP

    MAIN PROC
        call ClrScr

        call PromptInput

        xor eax,eax
        call ReadDec
        cmp eax,5
        jae returnMain

        mov ebx,OFFSET CaseTable
        mov ecx,NumberOfEntries
        L1:
            cmp al,[ebx]
            jne L2
            call NEAR PTR [ebx+1]
            call PrintResult
            jmp returnMain
        L2:
            add ebx,EntrySize
        LOOP L1

        
        returnMain:
        exit
    MAIN ENDP

end MAIN