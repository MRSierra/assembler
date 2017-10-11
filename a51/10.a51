;Hacer un programa que calcule la suma de los N primeros números pares. El rango de N es de 1 a 15. 
;El número N se encuentra en el registro R0. El resultado debe guardarse en R1.			
		
		CONT EQU 21H

		
		ORG 0000H
		SJMP MAIN10
		ORG 0040H
MAIN10:		MOV CONT,R0	;Mover del registro 0 el número a evaluar
BEGIN:		JB CONT.0, CONTINUE 
			ADD A,CONT
CONTINUE:	DJNZ CONT, BEGIN
			MOV R1,A
			END;
			
		