;Hacer un programa para unir dos listas ordenadas 
;ascendentemente en una sola lista ordenada de la 
;misma forma. El registro DPTR contiene la dirección 
;de la localidad de memoria donde está almacenado el 
;número de elementos de la lista 1, y la lista 1 
;comienza en la siguiente localidad. Para la lista 
;2 sucede algo similar, pero con los registros R6 y R7
;Los registros R4y R5 contienen la dirección en donde
;debe comenzar la lista resultante.

L1H	EQU #30H
L1R EQU #31H	

			ORG 0000H
			JMP MAIN
			ORG 0040H
MAIN:		MOV R0,DPH			;R0 HIGH DEL NUMERO L1
			MOV R1,DPL			;R1 LOW DEL NUMERO L1
			
			INC DPTR
			MOV LIH,DPH
			MOV LIR,DPL
			
			