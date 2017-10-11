;Hacer un programa para unir dos listas ordenadas 
;ascendentemente en una sola lista ordenada de la 
;misma forma. El registro DPTR contiene la dirección 
;de la localidad de memoria donde está almacenado el 
;número de elementos de la lista 1, y la lista 1 
;comienza en la siguiente localidad. Para la lista 
;2 sucede algo similar, pero con los registros R6 y R7
;Los registros R4y R5 contienen la dirección en donde
;debe comenzar la lista resultante.

L1H EQU 30H
L1L EQU 31H
DPS EQU 0A2H



			ORG 0000H
			JMP MAIN
			ORG 0040H
MAIN:		MOV DPS,#0
			MOVX A,@DPTR			;R0 LOCALIDAD DEL NUMERO L1
			MOV R0,A				
			
			INC DPTR
			MOVX A,@DPTR			;R1 INICIO LISTA L1 
			MOV R1,A
			
			MOV DPS,#1
			MOV A,R6			;OBTENER LA DIRECCIÓN DE MEMORIA
			MOV DPL,A		
			MOVX A,@DPTR		;OBTENER EL DATO EN ESA MEMORIA DEL NUMERO L2
			MOV R6,A
			
			MOV A,R7			;LO MISMO CON EL INICIO DE LA LISTA L2
			MOV DPL,A
			MOVX A,@DPTR
			MOV R7,A
			
			CLR P1.0
			
COMPARAR:	MOV A,R1			;COMPARAR L1 VS L2
			CJNE A,07H,DIFERENTES

DIFERENTES:	JC MENOR
			JMP MAYOR

MENOR:		MOV DPS,#0			;GUARDAR EL DPS # 0 PARA QUE NO SE PIERDA
			MOV L1H,DPH
			MOV L1L,DPL
			
			MOV DPH,R4			;INGRESAR A R4 DIRECCION DEL RES H
			MOV DPL,R5			;RES L
			
			MOV A,R1			;MOVER EL A (R1) A ESA DIRECCION
			MOVX @DPTR,A		;PONERLE A ESA DIRECCIÓN EL VALOR DE LA LISTA MENOR
			
			INC DPTR			;REGRESAR EL DPTR #0 A LA LISTA 1
			MOV R5,DPL
			MOV R4,DPH
			MOV DPH,L1H
			MOV DPL,L1L
			
			DJNZ R0,L1_MOVER
			JB P1.0,FIN
			SETB P1.0
			JMP MAYOR

L1_MOVER:	INC DPTR			;REGRESAR EL R1 AL DATO SIGUIENTE
			MOVX A,@DPTR
			MOV R1,A
			JB P1.0, MENOR
			JMP COMPARAR

MAYOR:		MOV DPS,#1
			MOV L1H,DPH
			MOV L1L,DPL
			
			MOV DPH,R4
			MOV DPL,R5
			
			MOV A,R7
			MOVX @DPTR,A
			
			INC DPTR
			MOV R5,DPL
			MOV R4,DPH
			MOV DPH,L1H
			MOV DPL,L1L
			
			
			DJNZ R6,L2_MOVER
			JB P1.0, FIN 
			SETB P1.0
			JMP MENOR

L2_MOVER:	INC DPTR
			MOVX A,@DPTR
			MOV R7,A
			JB P1.0, MAYOR
			JMP COMPARAR

FIN:		JMP $

			END
			
			