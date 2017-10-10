;Hacer un programa para que encuentre el elemento más pequeño de 
;una lista de números de 16 bits sin signo que están en localidades 
;consecutivas de memoria. La dirección del primer elemento de la lista 
;se encuentra en las localidades 1900H y 1901H, el número de elementos
;del arreglo está en la localidad 1902H. El elemento más pequeño
;encontrado debe guardarse en la localidad 1903H.

DPS EQU 0A2H

			ORG 0000H
			SJMP PREPARACION
			ORG 0040H
			; primero hay que guardar todas las posciones con el DPS
PREPARACION:	MOV DPS, #0			;en el DPTR version 0 se guardará el elemento más pequeño
				MOV DPTR, #1903H
				
				MOV DPS, #1
				MOV DPTR, #1900H	;en el DPTR version 1 se guardará el elemento de la lista, el apuntador
				
				MOVX A,@DPTR			;por ser la primera vez
				MOV R0, A			;guardar en el R0 el valor a comparar HIGH
				INC DPTR
				MOVX A,@DPTR
				MOV R1, A			;guardar en el R1 el valor a comparar LOW, R0R1
				
				INC DPTR
				MOVX A,@DPTR
				MOV R2, A			;guardar el número de elementos de la lista
				
				DEC DPL
				DEC DPL				;regresar al punto donde empieza la lista

SETMENOR:		MOV DPS,#0			;accedemos a la version del DPTR donde esta el más pequeño
				MOV A, R0
				MOVX @DPTR,A
				INC DPTR			;guardamos parte alta
				MOV A, R1
				MOVX @DPTR,A		;guardamos parte baja
				DEC DPL				;apuntamos a parte alta
				
CONTINUAR:		DJNZ R2,MOVER		;ciclo, si el R2 donde guardamos el más pequeño NO es cero (aún hay elementos) salta
				JMP $
					
MOVER:			MOV DPS,#1			;apuntar al siguiente de la lista
				INC DPTR
				INC DPTR
				
				MOV DPS,#0			;variable flotante para comparar, R3R4 menor
				MOVX A,@DPTR
				MOV R3,A
				INC DPTR
				MOVX A,@DPTR
				MOV R4,A
				DEC DPL
				
				MOV A,R0			;comparar el menor
				
				CJNE A,03H, COMPARAR	;si el de la lista (R0) es menor que el menor guardaro (R3) comparar

COMPARAR:		JC	COMPARARH

COMPARARH:		MOV A,R1			;comparar parte alta
				CJNE A,04H, SETMENOR
				JMP CONTINUAR
				
				END
				