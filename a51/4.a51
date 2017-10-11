;Hacer un programa que sume el contenido de R4 y R6 y lo ponga en R2

		ORG 0000H
		SJMP MAIN4
		ORG 0040H
MAIN4:	MOV A,R4
		ADD A,R6
		MOV R2,A
		END