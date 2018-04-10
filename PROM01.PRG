* Program..: PROGRAM 001
* Auther...: Yun aw
* Date.....: 01/30/1992

set talk off

DEMO97='請輸入要查詢的        ：'
DEMO10='管制序號'
DEMO17='起始日期'
DEMO18='終止日期'
STORE SPACE(8) TO DATE,DATE1,DATE2
STORE SPACE(8) TO IM1
@ 0,0 clear
@ 18,2	SAY DEMO97
@ 18,16 SAY DEMO10
@ 18,26 GET IM1
@ 19,2	SAY DEMO97
@ 19,16 SAY DEMO17
@ 19,26 GET DATE1
@ 20,2	SAY DEMO97
@ 20,16 SAY DEMO18
@ 20,26 GET DATE2
READ

im1=upper(im1)
if im1=space(8).or.date1=space(8).or.date2=space(8)
   return
endif

sele b
use d:\army\iminv
copy to tempv for imctlno=im1
use tempv
if file("tempv.ntx")=.f.
   index on imctlno to tempv
endif
reindex

sele c
use d:\army\item
if file("d:\army\item.ntx")=.f.
   index on imctlno to d:\army\item
endif
set index to d:\army\item
reindex

sele d
USE D:\ARMY\OMTRAN
COPY TO TEMPD FOR IMCTLNO=IM1.and.onudate>=ctod(date1).and.onudate<=ctod(date2)
USE TEMPd
if file("tempd.ntx")=.f.
   index on imctlno+dtos(onudate)+dtno+dtos(ordate)+orno+omno to tempd
endif
reindex
copy to tempd1 field imctlno

sele e
use d:\army\omtranu
COPY TO TEMPu FOR IMCTLNO=IM1.and.onudate>=ctod(date1).and.onudate<=ctod(date2)
use tempu
if file("tempu.ntx")=.f.
   index on imctlno+dtos(onudate)+ONDATE+OMNO to tempu
endif
reindex
copy to tempu1 field imctlno

sele d
USE tempd1
copy to temp
use temp
append from tempu1
if file("temp.ntx")=.f.
   index on imctlno to temp
endif
set index to temp
reindex
set relation to imctlno into b,to imctlno into c
