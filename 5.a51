
		;Hacer un programa que sume 10 datos que están en la RAM interna a partir de la dirección 30H 
		;y guarde el resultado en la dirección 40H.

		DA0 EQU 30H
		DA1 EQU 31H
		DA2 EQU 32H
		DA3 EQU 33H
		DA4 EQU 34H
		DA5 EQU 35H
		DA6 EQU 36H
		DA7 EQU 37H
		DA8 EQU 38H
		DA9 EQU 39H
		RES EQU 40H	

		ORG 0000H
        SJMP INICIO
        ORG 0040H
			INICIO: MOV DA0, #05H
			MOV DA1, #06H
			MOV DA2, #10H
			MOV DA3, #02H
			MOV DA4, #08H
			MOV DA5, #15H
			MOV DA6, #34H
			MOV DA7, #67H
			MOV DA8, #23H
			MOV DA9, #11H
			MOV A, DA0
			ADD A,DA1
			ADD A,DA2
			ADD A,DA3
			ADD A,DA4
			ADD A,DA5
			ADD A,DA6
			ADD A,DA7
			ADD A,DA8
			ADD A,DA9
			MOV RES, A
			
			END