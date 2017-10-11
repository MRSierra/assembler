;19)	Realiza las siguientes rutinas para el manejo de cadenas:
;	Insertar una subcadena (SUB) en una cadena (CAD) a partir de cierta posición (POS).
;	Encontrar una subcadena (SUB) en una cadena (CAD), indicando la posición donde inicia (POS).
;	Borrar una cierta cantidad de caracteres (N) de una cadena (CAD) a partir de una posición (POS).
;	Copiar de una cadena (CAD) una cierta cantidad de caracteres (N) a una subcadena (SUB).
;* Las cadenas terminan con el ASCII 0.
;* La cadena CAD inicia en la localidad 40H de RAM.
;* La cadena SUB inicia en la localidad 45H de RAM
;* El número POS está en el registro R2.
;* El número N está en el registro R3.

DPS EQU 02AH
PCAD EQU 30H			;DIRECCIÓN CADENA
PSUB EQU 31H			;DIRECCIÓN SUBCADENA
NUM EQU 32H				;NUMERO TOTAL


		ORG 0000H
		JMP MAIN
		ORG 0040H

MAIN:		MOV PCAD,#40H		;GUARDAR TODOS LOS APUNTADORES
			MOV PSUB,#45H
			MOV NUM,R2
			
			DJNZ R2,POINT_POS	;SI LA POS NO ES 0 RECORRER
			
POINT_POS:	INC PCAD				;INCREMENTAMOS EL APUNTADOR DE LA CADENA
			DJNZ R2,POINT_POS		;SI NO ES 0 VOLVER A DISMINUIR
			
			MOV R3, PCAD
			MOV A,R3
			MOV R0,A				;COMO SI FUE 0
			MOV A,@R0				;HAY QUE COMPARAR EL DATO EN RAM
			CJNE A,#30H,STACK		;SI NO ES IGUAL QUE 30H = 0 EN ASCII -> METER A STACK
			
STACK:		MOV DPL,A				;MOVERL AL DPL
			PUSH DPL				;METER A LA PILA
			INC R4					;CONTAR CUANTO METES A LA PILA
			
			INC R3					;CONTINUAS CON LA SIGUIENTE POSICIÓN
			MOV A,R3
			MOV R0,A				
			MOV A,@R0				;HAY QUE COMPARAR EL DATO EN RAM
			CJNE A,#30H,STACK		;SI NO ES IGUAL QUE 30H = 0 EN ASCII -> METER A STACK

SUB_CAD:	MOV R1,PSUB				
			MOV A,@R1
			CJNE A,#30H,IN			;SI NO ES EL FINAL DE LA CADENA INSERTAR EL VALOR
			MOV A,R4
			MOV R5,A
			INC R4
			DEC PCAD
			DJNZ R4,MOVE_POINTER		;VOLVER A AGREGAR TODO
			
			JMP $

IN:			MOV R0,PCAD				;EN LA POSICIÓN DE PCAD
			MOV @R0,A				;INSERTAR LO QUE ESTE EN EL ACUMULADOR
			INC PSUB				;INCREMENTAR 1 EN PSUB
			INC PCAD				;INCREMENTAR 1 EN PCAD
			JMP SUB_CAD
			
MOVE_POINTER:	INC PCAD
				DJNZ R5,MOVE_POINTER
			
POPSTACK:	POP DPL
			MOV R0,PCAD
			MOV @R0,DPL
			DEC PCAD
			DJNZ R4,POPSTACK
			
			JMP $
			
			END
			