			ORG 0000H
			JMP	MAIN
			ORG 0040H
MAIN:		MOV DPTR,#1900H
			MOVX A,@DPTR
			INC A
			MOVX @DPTR,A
			MOVX A,@DPTR
			MOV DPH,#00H
			MOV DPL,A
			MOVX A,@DPTR
			
			JMP $
			END
			