CONTN EQU R3
CONTP EQU R4
CONT0 EQU R5

ORG 00H
JMP main
ORG 40H

main: 	MOV DPTR, #1940H
		MOVX A, @DPTR
		MOV R0, A
		INC DPTR
		MOVX A, @DPTR
		MOV R1, A
		INC DPTR
		MOVX A, @DPTR
		MOV R2, A
		MOV DPH, R0
		MOV DPL, R1

CICLO:	MOVX A, @DPTR
		JNZ CHECAR
		INC CONT0
		JMP REGRESO

CHECAR: 
		JB 0E7H, CHECAR
		INC CONTP
		JMP REGRESO

SUMAN:
		INC CONTN

REGRESO: 	INC DPTR
			DJNZ R2, CICLO

			MOV A, CONTN
			MOV DPTR, #1943H
			MOVX @DPTR, A

			MOV A, CONT0
			MOV DPTR, #1944H
			MOVX @DPTR, A

        	MOV A, CONTP
			MOV DPTR, #1945H
			MOVX @DPTR, A

			END