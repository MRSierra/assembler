;Hacer un programa para que encuentre el elemento más pequeño de una lista de
;números de 16 bits sin signo que están en localidades consecutivas de memoria.
;La dirección del primer elemento de la lista se encuentra en las localidades
;1900H y 1901H, el número de elementos del arreglo está en la localidad 1902H.
;El elemento más pequeño encontrado debe guardarse en la localidad 1903H.
               DPS EQU 0A2H
               ORG 00H
               JMP main
					ORG 40H
main:
               ;Guarda direccion de guardado del dato menor en la lista
               MOV DPS,#1
               MOV DPTR, #1903H
               MOV DPS,#0
               ;Obtiene la direccion de inicio de la lista de numeros
               MOV DPTR, #1900H
               MOVX A, @DPTR
               MOV R0,A

               INC DPTR ;=1901H
               MOVX A, @DPTR
               MOV R1,A
               ;Direccion de inicio de la lista = R0R1 H

               ;Obtiene el numero de elementos en la lista
               INC DPTR ;=1902H
               MOVX A, @DPTR
               MOV R2,A
               ;Numero de elementos = R2H

               ;Establece la direccion de inicio de lectura de la lista
               MOV DPH, R0
               MOV DPL, R1


               ;Primer ciclo, se guarda el primer valor de la lista como mayor
               SETB AC
lectura:
               MOV DPS,#0
               MOVX A, @DPTR
               MOV R3,A
               INC DPTR
               MOVX A, @DPTR
               MOV R4,A
               INC DPTR
               ;Numero leido de la lista = R3R4H

               MOV DPS,#1
               MOVX A, @DPTR
               MOV R5,A
               INC DPTR
               MOVX A, @DPTR
               MOV R6,A
               DEC DPL

               ;Numero leido de la localidad de num menor = R5R6H

               JBC AC, cambioMenor ;Solo si es el primer ciclo

               MOV A, R4
					     CJNE A,06H,compararL ;CJNE R4,R6,compararL

               ;Si el nuevo numero (en la parte baja) es menor al guardado(en
               ;la parte baja), se prende el CY

compararL:
					JC compararH
               SETB AC

compararH:
               CLR C
					MOV A,R3
					CJNE A,05H,nuevoMenor ;CJNE R3,R5,nuevoMenor
               ;Si el nuevo numero (en la parte alta) es menor al guardado (en
               ;la parte alta), se prende el CY

nuevoMenor:
					     JC cambioMenor

               ;Son ceros (las partes altas) u otro caso
               MOV A,R3
               JZ cero1
               SETB AC
cero1:
               MOV A,R5
               JZ cero2
               JMP contCiclo

cero2:
               JBC AC, contCiclo
               ;JMP cambioMenor
cambioMenor:
               CLR C
					     MOV A, R3
               MOVX @DPTR,A
               INC DPTR
               MOV A, R4
               MOVX @DPTR,A
               DEC DPL

contCiclo:
               DJNZ R2, lectura ;Ciclo para leer

					     JMP $

               END
