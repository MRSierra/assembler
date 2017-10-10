            DPS EQU 0A2H
            CEROS EQU R3
            POS EQU R4
            NEGS EQU R5
            ORG 00H
            JMP main
            ORG 40H

            ;Mueve la longitud del bloque de mem ext a R0
main:       MOV DPTR, #1942H
            MOVX A,@DPTR
            MOV R0, A

            ;Establece los cuatro bytes de la dir de inicio en mem ext al DPTR
            MOV DPTR, #1940H ;DPTR 0 parte alta direcciones
            MOV DPS, #1
            MOV DPTR, #1941H ;DPTR 1 parte baja direcciones

            ;Copia los valores de lo que apunta DPTR en mem ext de forma R2R1H
            MOVX A, @DPTR
            MOV R1,A ;parte baja
            MOV DPS, #0 ;cambia el DPTR
            MOVX A, @DPTR
            MOV R2,A ; parte alta

            ;Mueve la direccion inicial del bloque ya leida desde la mem ext
            ;al DPTR0
            MOV 82H,R1
            MOV 83H,R2
            ;DPTR0 = R2R1

            ;Lee cada valor del bloque de mem ext y verifica si es cero,
            ;num negativo, o num positivo
read:       MOVX A, @DPTR
            JNZ num ;Si es cualquier numero distinto de cero
            INC CEROS
            JMP resumeRead

num:     	JB 0E7H, negInc ;Si el numero es negativo
            INC POS
            JMP resumeRead

negInc:     INC NEGS

resumeRead: INC DPTR
            DJNZ R0,read ;controla el ciclo

            ;Mueve los resultados de las cuentas a la mem ext en sus dir
            ;correspondientes
            MOV A, NEGS
            MOV DPTR, #1943H
            MOVX @DPTR, A

            MOV A, CEROS
            MOV DPTR, #1944H
            MOVX @DPTR, A

            MOV A, POS
            MOV DPTR, #1945H
            MOVX @DPTR, A

            END
