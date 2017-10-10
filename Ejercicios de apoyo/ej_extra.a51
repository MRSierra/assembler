; MOVER TABLAS
; R0 SERA EL APUTNADOR QUE RECORRE LA PAGINA 
; R1 ES LA PAGINA FUENTE
; R2 ES LA PAGINA DESTINO


	   ORG 0000H
	   SJMP MAIN
	   ORG 0040H
MAIN:  MOV R0,#00H  ; cARGA EL APUNTADOR
       MOV R1,#03H
	   MOV R2,#05H	; ______________
SALT0: MOV DPL, R0
       MOV DPH,R1 
	   MOVX A,@DPTR ; LEE DATO DE FUENTE 
	   MOV DPH,R2   ; ______________    
	   MOVX @DPTR,A ; ______________
	   INC R0	    ; ______________
	   MOV A,R0     ; ______________
	   JNZ SALT0     ;
	   SJMP $ 
	   END
