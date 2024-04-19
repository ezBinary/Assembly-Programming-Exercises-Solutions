TITLE Programming Exercises Chapter 7 : Encryption Using Rotation Opreration  (Ch7_Ex4_EncryptionUsingRotationOpreration.asm)

; Program Desscription: Programming Exercises Chapter 7, Exercise 4
; Author: ezBinary
; Creation Date: 17.april.2024 

INCLUDE Irvine32.inc

.data
key             BYTE    -2,4,1,0,-3,5,2,-4,-4,6
KEYSIZE = ($ - key)

plainText1       BYTE    "Hello World",0
cipherText1      BYTE    SIZEOF plainText1 DUP(0)

plainText2       BYTE    "Meow Meow",0
cipherText2      BYTE    SIZEOF plainText2 DUP(0)

strPlainText    BYTE    "Plain Text: ",0
strCipherText   BYTE    "Cipher Text: ",0
.code

    ;----------------------------------------------------------                       
    ; EncryptUsingRotation: Simple encryption by rotating 
    ;                       each plaintext byte using keys.
    ; 
    ; Receives:   ESI = Offset of plain text
    ;             EDI = Offset of cipher text to save the output
    ;             EBX = Offset of key array
    ;             ECX = Length of the plain terxt string
    ;             EDX = Key Size
    ;
    ; Returns:    EDI = Offset of Encrypted String Array
    ; Calls:      Nothing
    ;----------------------------------------------------------
    EncryptUsingRotation PROC
        pushad

        xor eax,eax
        L1:
            push ecx
            mov cl,[ebx+eax]            ; copy the current key in to the cl
            inc eax
            cmp eax,edx
            jb DoRot
            sub eax,edx
            DoRot:
                or cl,cl                ; change zf and sf flags to find out the key is neg or pos or zero
                push eax
                mov al,BYTE PTR[esi]
                js RotationLeft
                ror al,cl
                jmp GoLoopAfterRot

                RotationLeft:
                    neg cl
                    rol al,cl

                GoLoopAfterRot:
                    mov [edi],al
                    pop eax
                GoLoop:
                    inc esi
                    inc edi
                    pop ecx
        LOOP L1

        popad
        ret
    EncryptUsingRotation ENDP

    ;----------------------------------------------------------                       
    ; DisplayTwoStrings: Display two strings
    ; 
    ; Receives:   EDX = first string
    ;             ESI = second string
    ;
    ; Returns:    Nothing
    ; Calls:      WriteString,Crlf
    ;----------------------------------------------------------
    DisplayTwoStrings PROC USES ESI EDX
        call WriteString
        mov edx,esi
        call WriteString
        call Crlf
        ret
    DisplayTwoStrings ENDP

    MAIN PROC
        call Clrscr
        mov edx,OFFSET strPlainText
        mov esi,OFFSET plainText1
        call DisplayTwoStrings             ; display plaintext

        mov esi,OFFSET plainText1
        mov edi,OFFSET cipherText1
        mov ecx,SIZEOF plainText1 -1
        mov ebx,OFFSET key
        mov edx,KEYSIZE
        call EncryptUsingRotation

        mov edx,OFFSET strCipherText
        mov esi,OFFSET cipherText1
        call DisplayTwoStrings             ; display ciphertext
        ;----------------------------------------------------------------------
        call Crlf
        ;-------------- new data sets -----------------------------------------
        mov edx,OFFSET strPlainText
        mov esi,OFFSET plainText2
        call DisplayTwoStrings             

        mov esi,OFFSET plainText2
        mov edi,OFFSET cipherText2
        mov ecx,SIZEOF plainText2 -1
        mov ebx,OFFSET key
        mov edx,KEYSIZE
        call EncryptUsingRotation

        mov edx,OFFSET strCipherText
        mov esi,OFFSET cipherText2
        call DisplayTwoStrings            
        exit
    MAIN ENDP

end MAIN