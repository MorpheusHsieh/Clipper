* Program..: Book massage
* Auther...: Yun aw
* Date.....: 03/25/1992
* Version..: Clipper
STORE 0 TO K,I,PAGE
STORE SPACE(1) TO CH,PR
STORE SPACE(2) TO D_BKTYPE,D_BKYEAR
STORE SPACE(4) TO D_BKNO1,D_BKNO2,D_BKNO3,D_BKNO4,D_BKNO5,D_BKNO6,D_BKNO7
STORE SPACE(6) TO D_DTNO
STORE SPACE(25) TO D_BKNO,D_BKNU
STORE SPACE(114) TO D_BKDESP
DO WHILE .T.
   @  0,0  CLEAR
   @  5,10 SAY '[1]....總    表'
   @  6,10 SAY '[2]....分    表'
   @  7,10 SAY '[0]....結束程式'
   @ 21,1  SAY '請選擇一項功能 (0-2):'GET CH
   READ
   IF CH='0'
      RETURN
   ENDIF
   DO WHILE .T.
      @ 21,1  CLEAR
      @ 21,1  SAY '是否啟動印表機 (Y/N)：'GET PR
      READ
      IF PR='Y'.OR.PR='N'
	 EXIT
      ENDIF
   ENDDO
   DO CASE
      CASE CH='1'
	 SELE 1
	 USE D:\TM_BOOK\BOOKMS
	 INDEX ON BKNO TO D:\TM_BOOK\BOOKMS.NTX
	 COPY STRU TO BOOKMS1
	 SELE 2
	 USE BOOKMS1
	 SELE 1
	 GO TOP
	 DO WHILE .T.
	    IF EOF()
	       EXIT
	    ENDIF
	    D_BKNO=BKNO
	    D_BKNO1=BKNO1
	    D_BKNO2=BKNO2
	    D_BKNO3=BKNO3
	    D_BKNO5=BKNO5
	    D_BKNO6=BKNO6
	    D_BKNO7=BKNO7
	    DO WHILE .T.
	       SKIP
	       D_BKNU=BKNO
	       IF D_BKNU<>D_BKNO
		  EXIT
	       ENDIF
	       D_BKNO1=D_BKNO1+BKNO1
	       D_BKNO2=D_BKNO2+BKNO2
	       D_BKNO3=D_BKNO3+BKNO3
	       D_BKNO5=D_BKNO5+BKNO5
	       D_BKNO6=D_BKNO6+BKNO6
	       D_BKNO7=D_BKNO7+BKNO7
	    ENDDO
	       D_BKNO4=D_BKNO1-D_BKNO2-D_BKNO5
	       IF D_BKNO1<D_BKNO2
		  D_BKNO3=D_BKNO3-D_BKNO1+D_BKNO2
	       ENDIF
	    SELE 2
	    APPEND BLANK
	    REPLACE BKNO WITH D_BKNO,BKNO1 WITH D_BKNO1,BKNO2 WITH D_BKNO2,BKNO3 WITH D_BKNO3,BKNO4 WITH D_BKNO4,BKNO5 WITH D_BKNO5,BKNO6 WITH D_BKNO6,BKNO7 WITH D_BKNO7
	    SELE 1
	    SKIP
	 ENDDO
      CASE CH='2'
	 @ 21,0  CLEAR
	 @ 21,1  SAY '請輸入單位代號：'GET D_DTNO
	 READ
	 SELE 1
	 USE D:\TM_BOOK\BOOKMS
	 COPY TO BOOKMS1 FOR DTNO=D_DTNO
	 SELE 2
	 USE BOOKMS1
	 IF RECCOUNT()=0
	    @ 21,1  SAY '查無單位代號為      之技術書刊之資料'
	    @ 21,15 SAY D_DTNO
	    @ 21,37 SAY ''
	    I=0
	    DO WHILE I=0
	       I=INKEY()
	    ENDDO
	    EXIT
	 ENDIF
	 INDEX ON BKNO TO BOOKMS1
   ENDCASE
   SELE 3
   USE D:\TM_BOOK\BKITEM
   INDEX ON BKNO TO D:\TM_BOOK\BKITEM
   SELE 2
   GO TOP
   USE BOOKMS1
   SET RELATION TO BKNO INTO C
   @  0,0  CLEAR
   @  0,0  SAY '書刊編號                  應有 原有 待繳 缺少 庫存 破損 英文          資料：    '
   @  1,0  SAY '書刊名稱                                                              頁次：    '
   @  2,0  SAY '--------------------------------------------------------------------------------'
   K=1
   PAGE=1
   @  0,76 SAY LTRIM(TRIM(STR(RECCOUNT())))
   DO WHILE I<>27
   @  1,76 SAY LTRIM(TRIM(STR(PAGE)))
      K=K+2
      D_BKDESP=C->BKDESP
      IF EOF()
	 @ 23,0  SAY '--------------------------------------------------------------------------------'
	 I=0
	 DO WHILE I=0
	    I=INKEY()
	 ENDDO
	 EXIT
      ENDIF
      IF K>=22
	 @ 23,0  SAY '--------------------------------------------------------------------------------'
	 I=0
	 DO WHILE I=0
	    I=INKEY()
	 ENDDO
	 PAGE=PAGE+1
	 K=3
	 @  3,0  CLEAR
      ENDIF
      @ K,0  SAY BKNO
      @ K,27 SAY BKNO1
      @ K,32 SAY BKNO2
      @ K,37 SAY BKNO3
      @ K,42 SAY BKNO4
      @ K,47 SAY BKNO5
      @ K,52 SAY BKNO6
      @ K,57 SAY BKNO7
      @ K+1,0 SAY D_BKDESP
      IF PR='Y'
	 SET PRINT ON
	 ? bkno,bkno1,bkno2,bkno3,bkno4,bkno5,bkno6,bkno7
	 SET PRINT OFF
      ENDIF
      SKIP
   ENDDO
   IF I<>27
      DO WHILE I=0
	 I=INKEY()
      ENDDO
   ENDIF
ENDDO
