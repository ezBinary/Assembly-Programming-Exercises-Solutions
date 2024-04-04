TITLE Programming Exercises Chapter 3 : Data Definitions      (Ch3_Ex3_DataDefinitions.asm)

; Program Desscription: Programming Exercises Chapter 3, Exercise 3
; Author: ezBinary
; Creation Date: 3.april.2024 

INCLUDE Irvine32.inc

.data
    val_byte        BYTE        0FFh                    ; 255d unsigned value
    val_sbyte       SBYTE       0FFh                    ; -1d  signed value
    val_word        WORD        19A0h                   ; 6560d unsigned value
    val_sword       SWORD       19A0h                   ; 6560d signed value
    val_dword       DWORD       80000000h               ; 2,147,483,648d unsigned value
    val_sdword      SDWORD      80000000h               ; -2,147,483,648d signed value
    val_fword       FWORD       1 DUP(0h)               ; (48 bit) 0d signed/unsigned value
    val_qword       QWORD       1 DUP(1h)               ; (64 bit) 1,229,782,938,247,303,441d signed/unsigned value
    val_tbyte       TBYTE       34120000000000000000h   ; (80 bit) 1234d signed/unsigned value
    val_real4       REAL4       -2.2                    ; -2.2
    val_real8       REAL8       6.92E-100               ; 6.9  * 10^(-100)
    val_real10      REAL10      3.45E+4000              ; 3.45 * 10^(4000)

    val_db          DB          0FFh                    ; 255d unsigned value / -1d  signed value
    val_dw          DW          19A0h                   ; 6560d signed/unsigned value
    val_dd          DD          80000000h               ; 2,147,483,648d unsigned value / -2,147,483,648d signed value
    val_dq          DQ          1 DUP(1h)
    val_dt          DT          34120000000000000000h   ; (80 bit) 1234d signed/unsigned value

.code
    MAIN PROc
        
        call DumpRegs
        exit

    MAIN ENDP
end MAIN
