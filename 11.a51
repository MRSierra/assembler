;Hacer un programa para mover el bloque de memoria que comienza en la dirección 1A00H 
;y termina en la dirección 1BFFH, a la sección de memoria que comienza en la 1C00H.
;El programa debe terminar cuando se haya transferido todo el bloque  o cuando se encuentre un dato con valor FFH.
	
	CONTADOR EQU 20H
	CONTADOR2 EQU 21H
	INICIO1 EQU 1AH
	INICIO2 EQU 1BH
	FIN1 EQU 1CH
	FIN2 EQU 1DH
	ORG 0000H
	SJMP INICIO
	ORG 0040H
		
		INICIO:	MOV CONTADOR2, #1H
				MOV CONTADOR, #00H
				MOV R0, #1AH
				MOV R1, #00H
				MOV R2, #1CH
				MOV R3, #00H
				SJMP ESCRITURA
ESCRITURA:		MOV DPH, R0
				MOV DPL, R1
				MOVX A, @DPTR
				MOV DPH, R2
				MOV DPL, R3
				MOVX @DPTR, A
				CJNE A, #0FFH, KEEP
				SJMP $

KEEP:			CJNE R1, #0FFH, AUMENTAR
				CJNE R0, #1AH, FIN
				INC R0
				MOV R1, #00H
				INC R2
				MOV R3, #00H
				SJMP ESCRITURA
AUMENTAR:		INC R1
				INC R3
				SJMP ESCRITURA
FIN:            SJMP $
				END		