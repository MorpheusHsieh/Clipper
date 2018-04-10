*Program..: Directory with epno2
*Auther...: Yun aw
*Date.....: 02/13/1992
*Version..: FoxBase + ET Chines System + Clippr

if file("d:\temp.dbf")=.f.
   do creatbase
endif

store space(2) to d_eppty
store space(3) to d_onidcode
STORE SPACE(4) TO D_ORNO,d_omno,d_ontrqty
STORE SPACE(6) TO D_DTNO,d_date
STORE SPACE(8) TO FN,NU,D_ORDATE,d_onudate
store space(14) to d_imno
store space(30) to d_imdesp

@ 0,0 clear
@ 21,1	SAY '請輸入裝備號碼: 'GET NU
READ

sele a
USE D:\ARMY\ORDER
COPY TO tempr FOR EPNO2=NU
USE tempr
GO TOP
D_DTNO=DTNO

SELE B
USE D:\ARMY\OMTRAN
if file("tempd.dbf")=.f.
   COPY TO TEMPD FOR DTNO=D_DTNO
endif
USE TEMPD
INDEX ON ORNO+dtoc(ordate) TO TEMPD
set index to TEMPD
reindex

sele c
use d:\army\item
if file("d:\army\item.ntx")=.f.
   index on imctlno to item
endif
set index to d:\army\item
reindex

sele d
use d:\army\temp

SELE A
SET RELATION TO ORNO+DTOC(ORDATE) INTO B
go top

DO WHILE .T.
   if eof()
      exit
   end
   D_ORNO=ORNO
   D_ORDATE=ORDATE
   SELE B
   DO WHILE .t.
      IF EOF().or.ordate>d_ordate.or.ordate<d_ordate.or.orno>d_orno
	 EXIT
      ENDIF
      d_onidcode=onidcode
      d_imctlno=imctlno
      d_orno=orno
      d_omno=omno
      d_ordate=dtoc(ordate)
      d_onudate=dtoc(onudate)
      d_eppty=d_eppty
      d_ontrqty=ontrqty
      sele d
      append blank
      replace onidcode with d_onidcode,imctlno with d_imctlno,orno with d_orno,omno with d_omno,ordate with d_ordate,onudate with onudate,eppty with d_eppty,ontrqty with ontrqty
      sele b
      SKIP
   ENDDO
   SELE A
   SKIP
ENDDO

sele d
if file("temp.ntx")=.f.
   index on imctlno to temp
endif
set relation to imctlno into c
do while .t.
   if eof()
      exit
   endif
   d_imctlno=imctlno
   disp onidcode,orno,omno,ordate,onudate,eppty,ontrqty,d->imno,d->imdesp
   skip
   do while .t.
      if eof().or.imctlno>d_imctlno.or.imctlno<d_imctlno
	 exit
      endif
      disp onidcode,orno,omno,ordate,onudate,eppty,ontrqty
   enddo
enddo
erase temp*.*
return

**************************
***  sub of procedure  ***
**************************
procedure creatbase
private d_name[10],d_type[10],d_lens[10],d_decs[10]

d_name[1]="onidcode"
d_type[1]="c"
d_lens[1]= 3
d_decs[1]= 0

d_name[2]="imno"
d_type[2]="c"
d_lens[2]= 14
d_decs[2]= 0

d_name[3]="imdesp"
d_type[3]="c"
d_lens[3]= 30
d_decs[3]= 0

d_name[4]="orno"
d_type[4]="c"
d_lens[4]= 4
d_decs[4]= 0

d_name[5]="omno"
d_type[5]="c"
d_lens[5]= 4
d_decs[5]= 0

d_name[6]="ordate"
d_type[6]="d"
d_lens[6]= 8
d_decs[6]= 0

d_name[7]="onudate"
d_type[7]="d"
d_lens[7]= 8
d_decs[7]= 0

d_name[8]="eppty"
d_type[8]="c"
d_lens[8]= 2
d_decs[8]= 0

d_name[9]="ontrqty"
d_type[9]="n"
d_lens[9]= 4
d_decs[9]= 0

d_name[10]="imctlno"
d_type[10]="c"
d_lens[10]= 8
d_decs[10]= 0

do c_field with "d:\temp",d_name,d_type,d_lens,d_decs

***  sub of creatbase  ***
procedure c_field
parameter filename,f_name,f_type,f_lens,f_decs
private   l_field

	  select 0
	  create tempe
	  l_fields=len(f_name)

	  for i=1 to l_fields

		  append blank
		  replace field_name with f_name[i],field_type with f_type[i],field_len with f_lens[i],field_dec with f_decs[i]

	  next
	  create(filename) from tempe	&& dummy gets closed here
	  erase tempe.dbf


