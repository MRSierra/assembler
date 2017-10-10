;Hacer un programa que justifique una fracción binaria de 16 bits 
;que se encuentra en las localidades 1C00H y 1C01H desplazando el
;número hacia la izquierda hasta que el bit más significativo sea 
;1. Guardar el resultado en las direcciones 1C02H y 1C03H y 
;el número de desplazamientos en la dirección 1C04H. Si el contendido de las
;direcciones 1C00H y 1C01H es cero, entonces escribir ceros en las direcciones 
;1C02H, 1C03H y 1C04H. Este proceso se utiliza para convertir un número a notación científica

		ORG 0000H
		JMP MAIN
		ORG 0040H
MAIN:	MOV DPTR,#1C00H		;Guardar el número a evaluar
		MOVX A, @DPTR
		MOV R0,A			;R0R1
		INC DPTR
		MOVX A, @DPTR
		MOV R1,A
		
		MOV A,R0
		JZ CERO_L
		
CONTINUE:	MOV A, R0		;PRIMERO REVISAMOS SI EL BIT MÁS SIGNIFICATIVO ES 1
			RLC A
			MOV P1.0,C
			RRC A
			JB P1.0,RES		;SI ES UNO MANDA EL RESULTADO
			MOV A, R1		;SI NO, DESPLAZAMOS EL LOW
			RLC A
			MOV R1,A
			MOV A, R0		;DESPLAZAMOS EL HIGH
			RLC A
			MOV R0,A
			INC R2
			JMP CONTINUE

RES:		MOV DPTR,#1C02H
			MOV A,R0
			MOVX @DPTR,A
			INC DPTR
			MOV A,R1
			MOVX @DPTR,A
			INC DPTR
			MOV A,R2
			MOVX @DPTR,A
			
			JMP $
		
		
CERO_L:		MOV A,R1
			JZ CERO_RES
			JMP CONTINUE
			
CERO_RES:	MOV DPTR,#1C02H		;el resultado = 0
			MOV A,#00H
			MOVX @DPTR,A
			INC DPTR			;el resultado_low = 0
			MOVX @DPTR,A
			INC DPTR			;desplazamientos = 0
			MOVX @DPTR,A
			
			JMP $
				
			END
			
			
