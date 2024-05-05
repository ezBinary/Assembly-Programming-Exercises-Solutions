
TITLE Programming Exercises Chapter 8 : Chess Board with Alternating Colors (Ch8_Ex3_ChessBoardwithAlternatingColors.asm)

; Program Desscription: Programming Exercises Chapter 8, Exercise 3
; Author: ezBinary
; Creation Date: 5.may.2024 

INCLUDE Irvine32.inc

.data

.code
    ;----------------------------------------------------------                       
    ; DrawChessBoard: Draw a Chess Board (X*X).
    ; 
    ; Receives:   Size -> Stack Argument (ebp-8)
    ;             colour -> StackArgument (ebp-12)
    ;
    ; Returns:    Nothing
    ; Calls:      DrawWhiteBackGround, GotoXY, SetTextColor
    ;             WriteChar.
    ;----------------------------------------------------------
    DrawChessBoard PROC 
        push ebp
        mov ebp,esp

        pushad

        push [ebp + 8]
        call DrawWhiteBackGround

        mov ecx,[ebp + 8]
        mov dl,0
        mov dh,0

        L1:
            push ecx
            mov ecx,[ebp + 8]   ; read argument (size)
            shr ecx,1
            xor dl,1            ; toggle dl between 0 and 1
            push edx
            shl dl,1            ; dl*2
            mov eax, [ebp + 12]
            call SetTextColor
            PrintGraySquares:
                call GotoXY
                mov al, 20h
                call WriteChar
                call WriteChar
                add dl,4
            LOOP PrintGraySquares

            pop edx
            inc dh
            pop ecx

        LOOP L1

        popad

        pop ebp

        ret 8
    DrawChessBoard ENDP

    ;----------------------------------------------------------                       
    ; DrawWhiteBackGround: Draw a White Background (X*X)
    ; 
    ; Receives:   Size -> Stack Argument
    ;
    ; Returns:    Nothing
    ; Calls:      SetTextColor, WriteChar, GotoXY
    ;----------------------------------------------------------
    DrawWhiteBackGround PROC
        push ebp
        mov ebp,esp
        pushad

        xor edx,edx
        mov ecx,[ebp + 8]
        mov eax, 0F0h
        call SetTextColor
        mov al,20h
        L1:
        push ecx
            mov ecx,[ebp + 8]
            mov dl,0
            L2:
                call GotoXY

                call WriteChar
                call WriteChar
                add dl,2
            LOOP L2
            inc dh
            pop ecx
        LOOP L1
        mov eax,0Fh
        call SetTextColor
        popad
        pop ebp
        ret 4
    DrawWhiteBackGround ENDP

    MAIN PROC
        
        CHESS_BOARD_SIZE = 8
        COLOR = 010h
        mov ebx, COLOR
        mov ecx,16
        L1:

            push ebx
            push CHESS_BOARD_SIZE
            call DrawChessBoard
            add bl,20
            mov dh,CHESS_BOARD_SIZE + 1
            mov dl,0
            call GotoXY

            mov eax,500
            call Delay

        LOOP L1

        ; set the default color
        mov eax,0Fh
        call SetTextColor

	    exit
    MAIN ENDP

END main