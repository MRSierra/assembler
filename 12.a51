; Hacer un programa que multiplique el contenido 
; binario del registro R0 (<20h) por 7 y guarde el 
; resultado en el registro R1. Hacer en dos versiones, 
; con y sin utilizar la instrucción de multiplicación.
		
		ORG 0000H
		JMP MAIN
		ORG 0040H
		
		;Version 1
MAIN:	MOV R2, #7H
CICLO: 	ADD A, R0
		DJNZ R2, CICLO
		MOV R1, A
		
;Version2
		MOV R0, #19H
		MOV R2, #7H
		MOV A, R0
		
		END

