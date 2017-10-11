		
		;Hacer un programa para combinar los 4 bits menos significativos del registro R2 
		;y los 4 bits menos significativos del registro R1 en una sola localidad de 8 bits 
		;y guardarla en el registro R0. 
		;Los 4 bits menos significativos de R2 deberán ocupar los 4 bits menos significativos de R0.
		TEMP EQU 50H
		RES EQU 51H
			
		ORG 0000H
        SJMP INICIO
        ORG 0040H
			
			INICIO: MOV A, R2
			ANL A, #00001111b
			MOV TEMP, A
			MOV A, R1
			ANL A,#00001111b
			RR A 
			RR A
			RR A
			RR A
			ORL TEMP, A
			MOV R0, TEMP
			END