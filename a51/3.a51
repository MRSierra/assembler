	ORG 0000H
	SJMP MAIN1
		ORG 0040H
MAIN1:	ADD A,#1H
		ADD A,#1H
		ADD A,#1H
		ADD A,#1H
		ADD A,#1H
		ADD A,#1H
		ADD A,#1H
		ADD A,#1H
		ADD A,#1H
		ADD A,#1H
		SJMP MAIN1
		END
