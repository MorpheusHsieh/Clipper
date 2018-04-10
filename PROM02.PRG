
STORE SPACE(4) TO D_ORNO
STORE SPACE(6) TO D_DTNO,d_date
STORE SPACE(8) TO NU,D_ORDATE
@ 21,1  SAY '請輸入裝備號碼: 'GET NU
READ
USE D:\ARMY\ORDER
COPY TO &FN FOR EPNO2=NU
USE &FN
GO TOP
D_DTNO=DTNO

SELE B
USE D:\ARMY\OMTRAN
COPY TO TEMPD FOR DTNO=D_DTNO
USE TEMPD
IF FILE("TEMPD.IDX")=.F.
   INDEX ON ORNO+dtoc(ordate) TO TEMPD
endif
set index to TEMPD
reindex

SELE A
SET RELATION TO ORNO+DTOC(ORDATE) INTO B
go top
DO WHILE .T.
   if eof()
      exit
   end
   D_ORNO=ORNO
   D_ORDATE=ORDATE
   disp nu
   SELE B
   DO WHILE .t.
      IF EOF().or.ordate>d_ordate.or.ordate<d_ordate.or.orno>d_orno
	 EXIT
      ENDIF
      set print off
      DISP FIELD onidcode,imctlno,ORNO,omno,ordate,onudate,eppty,ontrqty
      set print off
      SKIP
   ENDDO
   SELE A
   SKIP
ENDDO
