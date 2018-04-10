* Program..: 登錄1201卡程式
* Filename.: PROM0001.PRG
* Auther...: Yun aw
* Date.....: 04/01/1992
* Version..: Clipper Summer 87
set wrap on
set talk off
set date ansi

* ┌────┐
* │設定變數│
* └────┘
menu0='0.結    束'
menu1='1.總表查詢'
menu2='2.分表查詢'
menu3='1.車    材'
menu4='2.兵    材'
menu5='3.戰    材'
menu6='4.工    材'
menu7='5.通    材'
menu8='6.化    材'
store 0 to i
store 1 to choice,choice1
store space(1) to ans,pr,d_imcode4
store space(2) to nu1,nu2,nu3
store space(4) to d_ivstd2
store space(8) to date1,date2,d_imct,d_imup,imct1
store space(13) to d_imno
store space(30) to d_desp

* ┌────┐
* │主程式區│
* └────┘
sele c
  do sub5
sele a
do while choice<>3
   do while .t.
      @  0,0  clear
      @ 21,1  say'是否啟動印表機 (Y/N)：'get pr
      read
      pr=ltrim(trim(upper(pr)))
      if pr='Y'.or.pr='N'
	 exit
      endif
   enddo
   @  0,0  clear
   @  0,0  say '┌──────────────────────────────────────┐'
   @  1,0  say '│                                                          資料筆數：        │'
   @  2,0  say '└──────────────────────────────────────┘'
   @  1,2  prompt menu1
   @  1,14 prompt menu2
   @  1,26 prompt menu0
   menu to choice
   save screen
   do case
      case choice=1
	 do sub3
	 do sub4
	 @ 12,30 say '資料處理中請稍待....'
	 sele a
	    use d:\army\omtranu
	    @ 21,1  clear
	    @ 21,1  say '現在處理對上用料檔'
	    ? chr(7)
	    copy to tempu for dtoc(onudate)>=date1.and.dtoc(onudate)<=date2
	    use tempu
	    if file("tempu.ntx")=.f.
	       @ 21,1  clear
	       @ 21,1  say '現在對上用料建立索引'
	       ? chr(7)
	       index on imctlno+dtoc(onudate)+ondate+omno to tempu.ntx
	    endif
	    set index to tempu
	    reindex
	 sele b
	    use d:\army\omtran
	    @ 21,1  clear
	    @ 21,1  say '現在處理對下用料檔'
	    ? chr(7)
	    copy to tempd for dtoc(onudate)>=date1.and.dtoc(onudate)<=date2
	    use tempd
	    if file("tempd.ntx")=.f.
	       @ 21,1  clear
	       @ 21,1  say '現在對下用料建立索引'
	       ? chr(7)
	       index on imctlno+dtoc(onudate)+dtno+dtoc(ordate)+orno+omno to tempd
	    endif
	    set index to tempd
	    reindex
	 sele e
	    use d:\army\iminv
	    @ 21,1  clear
	    @ 21,1  say '現在處理庫存主檔'
	    ? chr(7)
	    copy to tempv for dtno='105025'
	 sele d
	    use d:\army\item
	    set index to d:\army\item
	 sele e
	    @ 21,1  clear
	    @ 21,1  say '現在整合庫存主檔及零附件主檔'
	    ? chr(7)
	    use tempv
	    set relation to imctlno into d
	    do while .t.
	       if eof().or.inkey()=27
		  exit
	       endif
	       if d->imtype=nu1.or.d->imtype=nu2.or.d->imtype=nu3
		  d_imno=d->imno
		  d_imup=d->imup
		  d_imct=imctlno
		  d_ivstd2=ivstd2
		  d_imdesp=d->imdesp
		  d_imcode4=d->imcode4
		  sele c
		  use d:\tempi
		  append blank
		  replace imctlno with d_imct,imno with d_imno,imdesp with d_imdesp,imup with d_imup,ivstd2 with d_ivstd2,imcode4 with imcode4
	       endif
	       sele e
	       skip
	    enddo
	    sele c
	    use tempi
	    index on imno to tempi
	    @  1,70 say ltrim(str(reccount()))
	    go top
	    do while .t.
	       if eof().or.inkey()=27
		  exit
	       endif
	       d_imct=imctlno
	       sele a
	       go top
	       seek d_imct
	       if d_imct=imctlno
		  do while .t.
		     if pr='Y'
			set print on
		     else
			set print off
		     endif
		     ? onidcode,dtno,ondate,omno,ontrqty,onudate,eppty,trxndate
		     set print off
		     skip
		     if d_imct<>imctlno
			exit
		     endif
		  enddo
	       endif
	       sele b
	       go top
	       seek d_imct
	       if d_imct=imctlno
		  do while .t.
		     if pr='Y'
			set print on
		     else
			set print off
		     endif
		     ? onidcode,dtno,ordate,orno,omno,ontrqty,onudate,eppty
		     set print off
		     skip
		     if d_imct<>imctlno
			exit
		     endif
		  enddo
		  if pr='Y'
		     set print on
		  else
		     set print off
		  endif
		  ? c->imno,c->imdesp,c->imup,c->ivstd2,c->imcode4
		  ? ''
		  set print off
	       endif
	       sele c
	       skip
	    enddo
      case choice=2
	 do while .t.
	    @ 20,1  clear
	    @ 20,1  say '請輸入管制序號：'get imct1
	    read
	    imct1=upper(imct1)
	    do sub2
	    if ans='Y'
	       exit
	    endif
	 enddo
	 do sub3
	 @ 12,0  clear
	 @ 12,30 say '資料處理中請稍待....'
	 ? chr(7)
	 sele a
	    use d:\army\omtranu
	    set index to d:\army\omtranu.ntx
	    go top
	    seek imct1
	    if eof()
	       do sub7
	    else
	       do while imct1=imctlno
		  if dtoc(onudate)<=date2.and.dtoc(onudate)>=date1
		     if pr='Y'
			set print on
		     else
			set print off
		     endif
		     ? onidcode,dtno,ondate,omno,ontrqty,onudate,eppty,trxndate
		     set print off
		  endif
		  skip
		  if eof()
		     exit
		  endif
	       enddo
	    endif
	 sele b
	    use d:\army\omtran
	    set index to d:\army\omtran.ntx
	    go top
	    seek imct1
	    if eof()
	       do sub7
	    else
	       do while imct1=imctlno
		  if dtoc(onudate)<=date2.and.dtoc(onudate)>=date1
		     if pr='Y'
			set print on
		     else
			set print off
		     endif
		     ? onidcode,dtno,ordate,orno,omno,ontrqty,onudate,eppty
		     set print off
		  endif
		  skip
		  if eof()
		      exit
		  endif
	       enddo
	    endif
	 sele e
	    use d:\army\iminv
	    set index to d:\army\iminv.ntx
	 sele d
	    use d:\army\item
	    set index to d:\army\item.ntx
	    set relation to imctlno into e
	    seek imct1
	    if pr='Y'
	       set print on
	    else
	       set print off
	    endif
	    ? imno,imdesp,imup,e->ivstd2,imcode4
	    set print off
	 disp
	 disp
	 disp
	 disp
	 disp
	 do sub1
   endcase
   restore screen
enddo
clear memory
erase d:\temp*.*
use
close all


* ┌────┐
* │副程式區│
* └────┘
procedure sub1
   @ 20,1  clear
   @ 21,1  say '請按任何一鍵繼續'
   i=0
   do while i=0
      i=inkey()
   enddo
return

procedure sub2
   do while .t.
      ans=space(1)
      @ 21,0  clear
      @ 21,1  say '輸入是否正確 (Y/N)：'get ans
      read
      ans=ltrim(trim(upper(ans)))
      if ans='Y'.or.ans='N'
	 exit
      endif
   enddo
return

procedure sub3
   ans=' '
   do while ans<>'Y'
      @ 20,0  clear
      @ 20,1  say '請輸入起始日期：'get date1
      @ 21,1  say '請以  年．月．日  的方式輸入'
      read
      do sub2
   enddo
   ans=' '
   do while ans<>'Y'
      @ 20,1  clear
      @ 20,1  say '請輸入結束日期：'get date2
      @ 21,1  say '請以  年．月．日  的方式輸入'
      read
      do sub2
   enddo
return

procedure sub4
   do while .t.
      @  3,2  say '┌─────┐'
      @  4,2  say '│          │'
      @  5,2  say '│          │'
      @  6,2  say '│          │'
      @  7,2  say '│          │'
      @  8,2  say '│          │'
      @  9,2  say '│          │'
      @ 10,2  say '└─────┘'
      @  4,4  prompt menu3
      @  5,4  prompt menu4
      @  6,4  prompt menu5
      @  7,4  prompt menu6
      @  8,4  prompt menu7
      @  9,4  prompt menu8
      do case
	 case choice1=1
	    nu1='41'
	    nu2='46'
	    nu3='00'
	    exit
	 case choice1=2
	    nu1='47'
	    nu2='49'
	    nu3='00'
	    exit
	 case choice1=3
	    nu1='48'
	    nu2='00'
	    nu3='00'
	    exit
	 case choice1=4
	    nu1='22'
	    nu2='24'
	    nu3='73'
	    exit
	 case choice1=5
	    nu1='62'
	    nu2='91'
	    nu3='00'
	    exit
	 case choice1=6
	    nu1='12'
	    nu2='00'
	    nu3='00'
	    exit
      endcase
   enddo
return

procedure sub5
   private data_name[6],data_type[6],data_lens[6],data_decs[6]
   * field 1
     data_name[1]="imctlno"
     data_type[1]="c"
     data_lens[1]=8
     data_decs[1]=0
   * field 2
     data_name[2]="imno"
     data_type[2]="c"
     data_lens[2]=13
     data_decs[2]=0
   * field 3
     data_name[3]="imdesp"
     data_type[3]="c"
     data_lens[3]=30
     data_decs[3]=0
   * field 4
     data_name[4]="imup"
     data_type[4]="n"
     data_lens[4]=8
     data_decs[4]=0
   * field 5
     data_name[5]="imcode4"
     data_type[5]="c"
     data_lens[5]=1
     data_decs[5]=0
   * field 6
     data_name[6]="ivstd2"
     data_type[6]="n"
     data_lens[6]=4
     data_decs[6]=0
   do sub6 with "d:\tempi",data_name,data_type,data_lens,data_decs
return

procedure sub6
   parameter file_name,f_name,f_type,f_lens,f_decs
   private num_field,i
   select 0
   create dummy
   num_field=len(f_name)
   for i=1 to num_field
      append blank
      replace field_name with f_name[i],field_type with f_type[i],field_len with f_lens[i],field_dec with f_decs[i]
   next
   create(file_name) from dummy   && dummy gets closed here
   erase dummy.dbf
return

procedure sub7
   @ 21,1  clear
   @ 21,1  say '查無管制序號為        之資料'
   @ 21,15 say imct1
   @ 21,29
   i=0
   do while i=0
      i=inkey()
   enddo
return
