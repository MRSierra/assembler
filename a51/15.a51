;Hacer un programa para contar el número de bits con valor 1 que hay en un
;bloque de memoria cuya dirección inicial se encuentra almacenada en las
;localidades 1A00H y 1A01H y cuya dirección final esta almacenada en las
;localidades 1A02H y 1A03H. El número total de unos debe guardarse en las
;localidades 1A04H y 1A05H.
               DPS EQU 0A2H
               ORG 00H
               JMP main
               ORG 40H
main:
               MOV DPTR,#1A00H

               ;Lee la direccion de inicio en forma R0R1
               MOVX A,@DPTR
               MOV R0,A
               INC DPTR
               MOVX A,@DPTR
               MOV R1,A

               ;Lee la direccion de fin en forma R2R3
               INC DPTR
               MOVX A,@DPTR
               MOV R2,A
               INC DPTR
               MOVX A,@DPTR
               MOV R3,A
               INC DPTR

               ;Comienza a leer el bloque de memoria
               MOV DPS,#1
               MOV DPH,R0
               MOV DPL,R1
               ;Conteo unos = R4R5
cicloByte:
               MOVX A,@DPTR
               ;MOV 20H,A ;Mueve el valor a verificar a ubicacion accesible por bits

               JNB ACC.0, bit1;JNB 20H, bit1
               ACALL incCheck
bit1:
               JNB ACC.1,bit2;JNB 21H, bit2
               ACALL incCheck
bit2:
               JNB ACC.2, bit3;JNB 22H, bit3
               ACALL incCheck
bit3:
               JNB ACC.3,bit4;JNB 23H, bit4
               ACALL incCheck
bit4:
               JNB ACC.4, bit5;JNB 24H, bit5
               ACALL incCheck
bit5:
               JNB ACC.5,bit6;JNB 25H, bit6
               ACALL incCheck
bit6:
               JNB ACC.6,bit7;JNB 26H, bit7
               ACALL incCheck
bit7:
               JNB ACC.7, contCiclo;JNB 27H, contCiclo
               ACALL incCheck

contCiclo:
               INC DPTR

               MOV A, DPL
               CJNE A, 03H, cicloByte ;CJNE DPL, R3, cicloByte
               MOV A, DPH
               CJNE A, 02H, cicloByte ;CJNE DPH, R2, cicloByte

               ;Copiar los valores de la cuenta de unos a 1A04H y 1A05H
               MOV DPS,#0
               MOV A,R4
               MOVX @DPTR,A
               INC DPTR
               MOV A,R5
               MOVX @DPTR,A

forceEnd:      SJMP $


incCheck:
               ;Verifica si ya se llenó el byte bajo de conteo R5
               MOV A,R5
               CPL A
               JZ incHP

               INC R5
               JMP incLP
incHP:
               ;Verifica si ya se llenó el byte alto de conteo R4
               MOV A,R4
               CPL A
               JZ forceEnd
               INC R4
incLP:
               RET

               END