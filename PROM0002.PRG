* Program..: 欠撥查詢
* Filename.: PROM0002.prg
* Auther...: Yun aw
* Date.....: 03/15/1992
* Version..: Clipper + ET 3.0
set wrap on
set talk off
set date ansi

*┌────┐
*│設定變數│
*└────┘
menu00='0.結    束'
menu01='1.一 戰 群'
menu02='2.砲 指 部'
menu03='3.支 指 部'
menu04='4.直屬營連'
menu05='5.前 一 連'
menu06='6.前 二 連'
menu07='師 部 連'
menu08='化 兵 連'
menu09='裝 騎 連'
menu10='反裝甲連'
menu11='通 信 營'
menu12='工 兵 營'
menu13='一七一營'
menu14='一七二營'
menu15='一七三營'
menu16='四三三營'
menu17='四三四營'
menu18='四三五營'
menu19='四三六營'
menu20='保 修 營'
menu21='補 運 營'
menu22='輪    車'
menu23='履    車'
menu24='兵    器'
menu25='工    兵'
menu26='通    信'
menu27='化    學'
store 0 to i
store 1 to choice,choice1
store space(1) to ans,pr
store space(2) to d_eppty
store space(3) to d_onidcode
store space(4) to d_orno,d_omno,d_ontrqty
store space(6) to d_dtno

*┌────┐
*│主程式區│
*└────┘
do while choice<>7
   @  0,0  clear
   @  0,0  say '┌──────────────────────────────────────┐'
   @  1,0  say '│                                                                            │'
   @  2,0  say '└──────────────────────────────────────┘'
   @  1,2  prompt menu01
   @  1,13 prompt menu02
   @  1,24 prompt menu03
   @  1,35 prompt menu04
   @  1,46 prompt menu05
   @  1,57 prompt menu06
   @  1,68 prompt menu00
   menu to choice
   save screen
   do case
      case choice=1
	 do demo01
      case choice=2
	 do demo02
      case choice=3
	 do demo03
      case choice=4
	 do demo04
      case choice=5
	 d_dtno='GA'
      case choice=6
	 d_dtno='GB'
   endcase
   do demo06
   sele a
   use d:\army\omtran
   copy to temp for d_dtno=dtno.and.dtoc(onudate)<=date2.and.dtoc(onudate)>=date1
   use temp
   copy to temp6 for substr(onidcode,1,2)='C6'
   copy to temp7 for substr(onidcode,1,2)='C7'
   sele c
   use temp7
   index on imctlno+orno+omno to temp7
   sele b
   use temp6
   index on imctlno+orno+omno to temp6
   sele a
   use d:\army\item
   set index to d:\army\item.ntx
   set relation to imctlno into b,to imctlno into c
   do while .t.
      if eof()
	 exit
      endif
      d_imct=imctlno
      d_imct6=b->imctlno
      do while d_imct6=d_imct
	 if eof()
	    exit
	 endif
	 do while .t
	 if imtype=nu1.or.imtype=nu2.or.imtype=nu3
	    d_qty6=b->ontrqty
	    d_qty7=c->ontrqty
	    if d_qty6<>

      enddo

enddo
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
   ans=space(1)
   do while ans<>'Y'
      @ 20,0  clear
      @ 20,1  say '請輸入對下查詢起始日期：'get date1
      @ 21,1  say '請以  年．月．日  的方式輸入'
      read
      do sub2
   enddo
   date2=str(year(date1)+1)+'.'+str(year(date1))+
return

procedure sub4
   do while .t.
      @ 21,1  say'是否啟動印表機 (Y/N)：'get pr
      read
      pr=ltrim(trim(upper(pr)))
      if pr='Y'.or.pr='N'
	 exit
      endif
   enddo
return

procedure demo01
   do while .t.
      @  3,0  say '┌────┐'
      @  4,0  say '│        │'
      @  5,0  say '│        │'
      @  6,0  say '│        │'
      @  7,0  say '└────┘'
      @  4,2  prompt menu13
      @  5,2  prompt menu14
      @  6,2  prompt menu15
      menu to screen
      save screen
      do case
	 case choice1=1
	   d_dtno='BB'
	   exit
	 case choice1=2
	   d_dtno='BC'
	   exit
	 case choice1=3
	   d_dtno='BD'
	   exit
      endcase
   restore screen
   enddo
return

procedure demo02
   do while .t.
      @  3,12 say '┌────┐'
      @  4,12 say '│        │'
      @  5,12 say '│        │'
      @  6,12 say '│        │'
      @  7,12 say '│        │'
      @  8,12 say '└────┘'
      @  4,14 prompt menu16
      @  5,14 prompt menu17
      @  6,14 prompt menu18
      @  7,14 prompt menu19
      menu to screen
      save screen
      do case
	 case choice1=1
	   d_dtno='EC'
	   exit
	 case choice1=2
	   d_dtno='ED'
	   exit
	 case choice1=3
	   d_dtno='EE'
	   exit
	 case choice1=4
	   d_dtno='EF'
	   exit
      endcase
   restore screen
   enddo
return

procedure demo03
   do while .t.
      @  3,23 say '┌────┐'
      @  4,23 say '│        │'
      @  5,23 say '│        │'
      @  6,23 say '└────┘'
      @  4,25 prompt menu20
      @  5,25 prompt menu21
      menu to screen
      save screen
      do case
	 case choice1=1
	   d_dtno='FB'
	   exit
	 case choice1=2
	   d_dtno='FC'
	   exit
      endcase
   restore screen
   enddo
return

procedure demo04
   do while .t.
      @  3,34 say '┌────┐'
      @  4,34 say '│        │'
      @  5,34 say '│        │'
      @  6,34 say '│        │'
      @  7,34 say '│        │'
      @  8,34 say '│        │'
      @  9,34 say '│        │'
      @ 10,34 say '└────┘'
      @  4,36 prompt menu07
      @  5,36 prompt menu08
      @  6,36 prompt menu09
      @  7,36 prompt menu10
      @  8,36 prompt menu11
      @  9,36 prompt menu12
      menu to screen
      save screen
      do case
	 case choice1=1
	   d_dtno='AA'
	   exit
	 case choice1=2
	   d_dtno='AB'
	   exit
	 case choice1=3
	   d_dtno='AD'
	   exit
	 case choice1=4
	   d_dtno='AE'
	   exit
	 case choice1=5
	   d_dtno='AF'
	   exit
	 case choice1=6
	   d_dtno='AG'
	   exit
      endcase
   restore screen
   enddo
return


procedure demo05
   do while .t.
      @ 12,32 say '┌────┐'
      @ 12,32 say '│        │'
      @ 12,32 say '│        │'
      @ 12,32 say '│        │'
      @ 12,32 say '│        │'
      @ 12,32 say '│        │'
      @ 12,32 say '│        │'
      @ 12,32 say '└────┘'
      @ 12,34 prompt menu22
      @ 12,34 prompt menu23
      @ 12,34 prompt menu24
      @ 12,34 prompt menu25
      @ 12,34 prompt menu26
      @ 12,34 prompt menu27
      menu to screen
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

procedure demo06
   @ 21,1  clear
   @ 21,1  say '資料處理中請稍待....'
return
