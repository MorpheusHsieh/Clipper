* Program..: 列印待繳書刊分表程式
* Filename.: BOOK-3.PRG
* Printer..: T24W1Z1L2X1G2
* Auther...: Yun aw
* Date.....: 04/06/1992
* Version..: Clipper
set wrap on
set talk off
store 0 to re,r1,r2
store space(1) to choice,pr,ans
store space(2) to d_bkyear
store space(6) to d_bkno2,d_bkno3
store space(6) to d_dtno,menu
store space(13) to d_bknou,d_bknod
store space(26) to d_bkno
store space(40) to d_bkdespu,d_bkdespd,aw
store space(80) to d_bkdesp
aw=replicate("�",40)
menu01='師部連'
menu02='化兵連'
menu03='裝騎連'
menu04='反裝甲'
menu05='通信營'
menu06='工兵營'
menu07='一七一'
menu08='一七二'
menu09='一七三'
menu10='一七四'
menu11='一七五'
menu12='一七六'
menu13='七七四'
menu14='七八一'
menu15='七八二'
menu16='四三三'
menu17='四三四'
menu18='四三五'
menu19='四三六'
menu20='保修營'
menu21='主支連'
menu22='前一連'
menu23='前二連'
menu24='補運營'
menu25='結  束'
choice=1
do while .t.
   do while .t.
      @ 21,1 clear
      @ 21,1  say '是否啟動印表機 (Y/N)：'get pr
      read
      pr=upper(pr)
      if pr='Y'.or.pr='N'
	exit
      endif
   enddo
   do while choice<>22
      @  0,0  clear
      @  0,0  say '┌──────────────────────────────────────┐'
      @  1,0  say '│                                                                            │'
      @  2,0  say '│                                                                            │'
      @  3,0  say '│                                                                            │'
      @  4,0  say '│                                                                            │'
      @  5,0  say '└──────────────────────────────────────┘'
      @  1,2  prompt menu01
      @  1,12 prompt menu02
      @  1,22 prompt menu03
      @  1,32 prompt menu04
      @  1,42 prompt menu05
      @  1,52 prompt menu06
      @  1,62 prompt menu07
      @  1,72 prompt menu08
      @  2,2  prompt menu09
      @  2,12 prompt menu10
      @  2,22 prompt menu11
      @  2,32 prompt menu12
      @  2,42 prompt menu13
      @  2,52 prompt menu14
      @  2,62 prompt menu15
      @  2,72 prompt menu16
      @  3,2  prompt menu17
      @  3,12 prompt menu18
      @  3,22 prompt menu19
      @  3,32 prompt menu20
      @  3,42 prompt menu21
      @  3,52 prompt menu22
      @  3,62 prompt menu23
      @  3,72 prompt menu24
      @  4,2  prompt menu25
      menu to choice
      save screen
      do case
	 case choice=1
	    d_dtno='AA'
	    menu='師 部 連'
	    do sub1
	 case choice=2
	    d_dtno='AB'
	    menu='化 兵 連'
	    do sub1
	 case choice=3
	    d_dtno='AD'
	    menu='裝 騎 連'
	    do sub1
	 case choice=4
	    d_dtno='AE'
	    menu='反 裝 甲'
	    do sub1
	 case choice=5
	    d_dtno='AF'
	    menu='通 信 營'
	    do sub1
	 case choice=6
	    d_dtno='AG'
	    menu='工 兵 營'
	    do sub1
	 case choice=7
	    d_dtno='BB'
	    menu='一 七 一'
	    do sub1
	 case choice=8
	    d_dtno='BC'
	    menu='一 七 二'
	    do sub1
	 case choice=9
	    d_dtno='BD'
	    menu='一 七 三'
	    do sub1
	 case choice=10
	    d_dtno='CB'
	    menu='一 七 四'
	    do sub1
	 case choice=11
	    d_dtno='CC'
	    menu='一 七 五'
	    do sub1
	 case choice=12
	    d_dtno='CD'
	    menu='一 七 六'
	    do sub1
	 case choice=13
	    d_dtno='DB'
	    menu='七 七 四'
	    do sub1
	 case choice=14
	    d_dtno='DC'
	    menu='七 八 一'
	    do sub1
	 case choice=15
	    d_dtno='DD'
	    menu='七 八 二'
	    do sub1
	 case choice=16
	    d_dtno='EC'
	    menu='四 三 三'
	    do sub1
	 case choice=17
	    d_dtno='ED'
	    menu='四 三 四'
	    do sub1
	 case choice=18
	    d_dtno='EE'
	    menu='四 三 五'
	    do sub1
	 case choice=19
	    d_dtno='105025'
	    menu='四 三 六'
	    do sub1
	 case choice=20
	    d_dtno='FC'
	    menu='保 修 營'
	    do sub1
	 case choice=21
	    d_dtno='105025'
	    menu='主 支 連'
	    do sub1
	 case choice=22
	    d_dtno='GA'
	    menu='前 一 連'
	    do sub1
	 case choice=23
	    d_dtno='GB'
	    menu='前 二 連'
	    do sub1
	 case choice=24
	    d_dtno='FC'
	    menu='補 運 營'
	    do sub1
	 case choice=25
	    exit
      endcase
   enddo
   do while .t.
      @ 21,1  clear
      @ 21,1  say '是否要結束本程式 (Y/N)：'get ans
      read
      ans=upper(ans)
      if ans='Y'.or.ans='N'
	 exit
      endif
   enddo
   if ans='Y'
      exit
   endif
enddo

procedure sub1
   sele a
      use d:\tm_book\bookms
      copy to temp1 for dtno=d_dtno.and.bkno3<>0
      use temp1
      if reccount()=0
	 @ 21,1  say '查無單位代號為      之技術書刊之資料'
	 @ 21,15 say d_dtno
	 @ 21,37 say ''
	 i=0
	 do while i=0
	    i=inkey()
	 enddo
      endif
      index on bkno to temp
   sele b
      use d:\tm_book\bkitem
      index on bkno to d:\tm_book\bkitem
   sele a
   set relation to bkno into b
   go top
   r2=0
   do while .t.
      if eof()
	 exit
      endif
      do while .t.
	 if pr='Y'
	    text to print
  陸 軍 機 械 化 第 一 ○ 九 師 八 十 一 年 度 兵 工 類 技 術 書 刊 特 別 清 點 無 需 求 待 繳 回 書 刊 統 計 表
┌──┬──────┬─────────────────────┬──┬───┬────┬─────────────┐
│項次│書 刊 編 號 │書��������������������������������������名│版期│現有數│待繳回數│備����������������������考│
	    endtext
	 else
	    text
  陸 軍 機 械 化 第 一 ○ 九 師 八 十 一 年 度 兵 工 類 技 術 書 刊 特 別 清 點 無 需 求 待 繳 回 書 刊 統 計 表
┌──┬──────┬─────────────────────┬──┬───┬────┬─────────────┐
│項次│書 刊 編 號 │書��������������������������������������名│版期│現有數│待繳回數│備����������������������考│
	    endtext
	 endif
	 do while r1<40
	    r1=r1+1
	    r2=r2+1
	    store r2 to re
	    store bkno to d_bkno
	    store b->bkdesp to d_bkdesp
	    store b->bkyear to d_bkyear
	    store bkno2 to d_bkno2
	    store bkno3 to d_bkno3
	    re=left(ltrim(trim(str(re)))+aw,4)
	    d_bknou=left(ltrim(trim(d_bkno))+aw,12)
	    d_bknod=substr(ltrim(trim(d_bkno))+aw,13,12)
	    d_bkdespu=left(d_bkdesp+aw,42)
	    d_bkdespd=substr(d_bkdesp+aw,43,42)
	    d_bkyear=left(ltrim(trim(d_bkyear))+aw,4)
	    d_bkno2=left(ltrim(trim(str(d_bkno2)))+aw,6)
	    d_bkno3=left(ltrim(trim(str(d_bkno3)))+aw,8)
	    if pr='Y'
	       text to print
├──┼──────┼─────────────────────┼──┼───┼────┼─────────────┤
│&re│&d_bknou│&d_bkdespu│&d_bkyear│&d_bkno2│&d_bkno3│��������������������������│
│����│&d_bknod│&d_bkdespd│����│������│��������│��������������������������│
	       endtext
	    else
	       text
├──┼──────┼─────────────────────┼──┼───┼────┼─────────────┤
│&re│&d_bknou│&d_bkdespu│&d_bkyear│&d_bkno2│&d_bkno3│��������������������������│
│����│&d_bknod│&d_bkdespd│����│������│��������│��������������������������│
	       endtext
	    endif
	    skip
	    if eof()
	       exit
	    endif
	 enddo
	 if pr='Y'
	    text to print
└──┴──────┴─────────────────────┴──┴───┴────┴─────────────┘
	    endtext
	 else
	    text
└──┴──────┴─────────────────────┴──┴───┴────┴─────────────┘
	    endtext
	 endif
	 if pr='Y'
	    set print on
	 else
	    set print off
	 endif
	 ?
	 set print off
	 r1=0
	 exit
      enddo
      i=0
      do while i=0
	 i=inkey()
      enddo
   enddo
return
