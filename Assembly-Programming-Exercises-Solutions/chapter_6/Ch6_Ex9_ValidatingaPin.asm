TITLE Programming Exercises Chapter 6 : Validating a Pin     (Ch6_Ex9_ValidatingaPin.asm)

; Program Desscription: Programming Exercises Chapter 6, Exercise 9
; Author: ezBinary
; Creation Date: 11.april.2024 

INCLUDE Irvine32.inc



.data
minVals			BYTE	5,2,4,1,3
maxVals			BYTE	9,5,8,4,6

DigitPin1		BYTE	5,2,4,1,3		; valid
DigitPin2		BYTE	4,3,5,3,4		; not valid
DigitPin3		BYTE	6,4,5,3,7		; not valid
	

Valid_Str		BYTE	"Valid",0
NotValid_Str	BYTE	" not invalid",0
.code
    ;----------------------------------------------------------                       
    ; Validate_PIN: Check whether each digit of the PIN is
	;				valid or not. 
    ; 
    ; Receives:  Nothing
    ;
    ; Returns:   Nothing
    ; Calls:     Crlf, WriteString, WriteDec
    ;----------------------------------------------------------
    Validate_PIN PROC
		PUSHAD

		mov edi,0				
		mov ecx,5
		L1:
			mov al,[esi]

			cmp al,minVals[edi]
			jb invalid

			cmp al,maxVals[edi]
			jbe valid

			invalid:
				mov eax,edi
				inc eax
				jmp PrintResult

			valid:
				inc	esi
				inc	edi
		LOOP L1

		mov	eax,0						; if valid => eax = 0

		PrintResult:
			or eax,eax						; if zf = 0 => valid 
			jnz NotValid

		mov	edx,OFFSET Valid_Str
		call WriteString

		jmp	return

		NotValid:
			call WriteDec
			mov edx,OFFSET NotValid_Str
			call WriteString

		return:
			call	Crlf
			POPAD	
			ret
	Validate_PIN ENDP

    MAIN PROC
        call ClrScr

        mov	esi,OFFSET DigitPin1
	    call	Validate_PIN

	    mov	esi,OFFSET DigitPin2
	    call	Validate_PIN

	    mov	esi,OFFSET DigitPin3
	    call	Validate_PIN

        exit
    MAIN ENDP

end MAIN