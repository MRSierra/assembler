;Hacer un programa para que encuentre el elemento más pequeño de 
;una lista de números de 16 bits sin signo que están en localidades 
;consecutivas de memoria. La dirección del primer elemento de la lista 
;se encuentra en las localidades 1900H y 1901H, el número de elementos
;del arreglo está en la localidad 1902H. El elemento más pequeño
;encontrado debe guardarse en la localidad 1903H.

DPS EQU 0A2H
			ORG 0000H
			JMP BEGIN
			ORG 0040H
BEGIN:		MOV DPTR,#1902H				;GUARDAR CANTIDAD DE DATOS EN LA LISTA R2
			MOVX A,@DPTR
			MOV R2,A
			
			MOV DPS,#0					;VERSION 0 DIRECCIONES
			MOV DPTR,#1900H				;GUARDAR LA DIRECCIÓN DEL INICIO DE LA LISTA
			MOVX A,@DPTR
			MOV R3,A					;R3 DIRECCIÓN HIGH DEL APUNTADOR A LA LISTA
			INC DPTR
			MOVX A,@DPTR				;R4 DIRECCIÓN LOW DEL APUNTADOR A LA LISTA
			MOV R4,A
			DEC DPL
			SETB AC
			
DATOS:		MOV DPS,#1
			MOV DPL,R3					;OBTENER EL DATO
			MOVX A,@DPTR
			MOV R5,A					;R5 DATO HIGH DEL APUNTADOR A LA LISTA
			MOV DPL,R4
			MOVX A,@DPTR
			MOV R6,A					;R6 DATO LOW DEL APUNTADOR A LA LISTA
			
			
			JB AC,SETMENOR
			MOV A,R5
			CJNE A,00H,COMPARAR		;SI EL DE LA LISTA ES MENOR AL GUARDADO COMO MENOR
			
			MOV A, R6
			CJNE A,01H,COMPARAR
			
			
					
SUM:		INC R3
			INC R3
			INC R4
			INC R4					;CAMBIA LAS DIRECCIONES DEL APUNTADOR ACTUAL
			DJNZ R2,DATOS			;SI AÚN NO ES CERO REPITE EL PROCESO
			MOV DPTR,#1903H
			MOV A,R0
			MOVX @DPTR,A
			MOV A,R1
			INC DPTR
			MOVX @DPTR,A
			
			JMP $
			
			
SETMENOR:	MOV PSW, #00H			;PASA EL MENOR A MEMORIA
			MOV DPS,#0
			MOV DPTR,#1903H
			MOVX A,@DPTR
			MOV DPS,#1
			MOV DPL,A
			MOV A,R5
			MOVX @DPTR,A
			MOV A,R6
			INC DPTR
			MOVX @DPTR,A
			MOV A,R5				;R0R1 MENOR
			MOV R0,A
			MOV A,R6
			MOV R1,A
			JMP SUM

COMPARAR: 	JC SETMENOR
			JMP SUM
			
			END