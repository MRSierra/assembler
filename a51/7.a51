;Hacer un programa para separar el contenido del R0 en dos grupos de 4 bits.
;Guardar el grupo de los 4 bits más significativos en los 4 bits menos significativos 
;del registro R1 y los 4 bits menos significativos en los 4 bits menos significativos 
;del registro R2. Los 4 bits más significativos de R1 y R2, deben quedar en cero.

		ORG 0000H
		SJMP MAIN7
		ORG 0040H
MAIN7:	MOV A,R0 ;Primero movemos al acumulador
		RR A ;Recorremos 4 veces para que los bits más significativos se vuelvan los menos significativos
		RR A
		RR A
		RR A
		ANL A,#00001111b
		MOV R1,A
		MOV A,R0
		ANL A,#00001111b
		MOV R2,A
		END