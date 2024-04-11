TITLE Programming Exercises Chapter 6 : Message Encryption     (Ch6_Ex8_MessageEncryption.asm)

; Program Desscription: Programming Exercises Chapter 6, Exercise 8
; Author: ezBinary
; Creation Date: 11.april.2024 

INCLUDE Irvine32.inc

BUFMAX = 128                                                    ; maximum buffer size

.data
PromptPlainText     BYTE "Enter the plain text: ",0
PromptCipherText    BYTE "Cipher text:          ",0
PromptDecryptText   BYTE "Decrypted text:       ",0
Key		            BYTE "ABXmv#7",0                            ; symmetric key

PlainTextBuffer	    BYTE BUFMAX+1 DUP(0)                        ; plain text buffer
CipherTextBuffer    BYTE BUFMAX+1 DUP(0)                        ; cipher text buffer
DecryptedTextBuffer	BYTE BUFMAX+1 DUP(0)                        ; decrypted text buffer

.data?
BufferSize         BYTE ?

.code
    ;----------------------------------------------------------                       
    ; EncryptAndDecryptTextWithXor: get string from user and 
    ;                               call other proc to enc &
    ;                               dec the text and print in 
    ;                               cli.
    ; 
    ; Receives:  Nothing
    ;
    ; Returns:   Nothing
    ; Calls:     Crlf, ReadString, WriteString, XorText
    ;----------------------------------------------------------
    EncryptAndDecryptTextWithXor PROC USES EDX ECX EDI EAX
        mov edx, OFFSET PromptPlainText
        call WriteString

        mov	ecx,BUFMAX
        mov	edx, OFFSET PlainTextBuffer
        call ReadString
        mov BufferSize,al

        mov edi, OFFSET CipherTextBuffer
        call XorText                            ; encrypt

        mov edx, OFFSET PromptCipherText
        call WriteString
        mov edx, OFFSET CipherTextBuffer
        call WriteString
        call Crlf

        mov edi, OFFSET DecryptedTextBuffer
        call XorText                            ; decrypt

        mov edx, OFFSET PromptDecryptText
        call WriteString
        mov edx, OFFSET DecryptedTextBuffer
        call WriteString
        call Crlf

        ret
    EncryptAndDecryptTextWithXor ENDP

    ;----------------------------------------------------------                       
    ; XorText:    Encrypt/Decrypt a buffer
    ; 
    ; Receives:   EDI = offset of a variable to write the 
    ;                   encrypted/decrypted msg.
    ;             EDX = offset ofa variable to read the
    ;                   encrypted/decrypted msg.
    ;
    ; Returns:    Nothing
    ; Calls:      Nothing
    ;----------------------------------------------------------
    XorText PROC USES EDX ESI ECX EAX EBX
        mov esi,0
        movzx ecx,BufferSize

        L1:
                mov al,key[esi]
                inc esi
            	cmp	esi,SIZEOF Key - 1
	            jb	J1		
	            sub	esi,SIZEOF Key - 1

                J1:
                    mov bl,[edx]
                    xor	bl,al
                    mov [edi],bl

                    inc edi
                    inc edx
        LOOP L1
        ret
    XorText ENDP

    MAIN PROC
        call ClrScr
        call EncryptAndDecryptTextWithXor
        exit
    MAIN ENDP

end MAIN