* Program..: ¦C¦LÁ`ªíµ{¦¡
* Filename.: BOOK1.PRG
* Printer..: T24W1Z1L4X8G2
* Auther...: Yun aw
* Date.....: 04/05/1992
* Version..: Clipper
set talk off
store 0 to re,r1,r2
store space(1) to choice,pr
store space(2) to d_bktype
store space(6) to bkn1,bkn2
store space(6) to d_dtno,menu
store space(12) to d_bknou,d_bknod
store space(26) to d_bkno
store space(40) to d_bkdespu,d_bkdespd
store space(80) to d_bkdesp
aw=replicate('ÿ',80)
menu26='§L  ¤u'
menu27='¤u  §L'
menu28='³q  «H'
menu29='¤Æ  ¾Ç'
do while .t.
   @  0,0  clear
   @ 21,1  say '¬O§_±Ò°Ê¦Lªí¾÷ (Y/N)¡G'get pr
   read
   pr=upper(pr)
   if pr='Y'.or.pr='N'
      exit
   endif
enddo
do while .t.
   @  6,12 say '¢z¢w¢w¢w¢{'
   @  7,12 say '¢x      ¢x'
   @  8,12 say '¢x      ¢x'
   @  9,12 say '¢x      ¢x'
   @ 10,12 say '¢x      ¢x'
   @ 11,12 say '¢|¢w¢w¢w¢}'
   @  7,14 prompt menu26
   @  8,14 prompt menu27
   @  9,14 prompt menu28
   @ 10,14 prompt menu29
   menu to choice1
   save screen
   do case
      case choice1=1
	 key='4'
	 exit
      case choice1=2
	 key='2'
	 exit
      case choice1=3
	 key='6'
	 exit
      case choice1=4
	 key='1'
	 exit
   endcase
enddo
sele a
use d:\tm_book\bookms
index on bkno to d:\tm_book\bookms.ntx
copy stru to temp
sele b
use temp
sele a
go top
do while .t.
   if eof()
      exit
   endif
   d_bkno=bkno
   d_bkno1=bkno1
   d_bkno2=bkno2
   do while .t.
      skip
      d_bknu=bkno
      if d_bknu<>d_bkno
	 exit
      endif
      d_bkno1=d_bkno1+bkno1
      d_bkno2=d_bkno2+bkno2
   enddo
   sele b
   append blank
   replace bkno with d_bkno,bkno1 with d_bkno1,bkno2 with d_bkno2
   sele a
   skip
enddo
menu='¥þ    ®v'
sele c
use d:\tm_book\bkitem
set index to d:\tm_book\bkitem.ntx
sele b
   use temp
   index on bkno to temp
   set relation to bkno into c
   go top
   r2=0
   do while .t.
      if eof()
	 exit
      endif
      do while .t.
	 if pr='Y'
	    text to print
¢z¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
¢x³° ­x ¾÷ ±ñ ¤Æ ²Ä ¤@ ¡³ ¤E ®vÿ&menu §Þ ³N ®Ñ ¥Z ²Î ­p ªíÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¢x
¢u¢w¢w¢s¢w¢w¢w¢w¢w¢w¢s¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢s¢w¢w¢w¢s¢w¢w¢w¢s¢w¢w¢w¢w¢w¢{
¢x¶µ¦¸¢x®Ñÿ¥Zÿ½sÿ¸¹ÿ¢x®Ñÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¦W¢xÀ³¦³¼Æ¢x²{¦³¼Æ¢x³Æÿÿÿÿÿÿ¦Ò¢x
	    endtext
	    set print off
	 else
	    text
¢z¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
¢x³° ­x ¾÷ ±ñ ¤Æ ²Ä ¤@ ¡³ ¤E ®vÿ&menu §Þ ³N ®Ñ ¥Z ²Î ­p ªíÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¢x
¢u¢w¢w¢s¢w¢w¢w¢w¢w¢w¢s¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢s¢w¢w¢w¢s¢w¢w¢w¢s¢w¢w¢w¢w¢w¢{
¢x¶µ¦¸¢x®Ñÿ¥Zÿ½sÿ¸¹ÿ¢x®Ñÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¦W¢xÀ³¦³¼Æ¢x²{¦³¼Æ¢x³Æÿÿÿÿÿÿ¦Ò¢x
	    endtext
	 endif
	 do while r1<30
	    d_bktype=c->bktype
	    if substr(d_bktype,1,1)=key
	       r1=r1+1
	       r2=r2+1
	       store r2 to re
	       store bkno to d_bkno
	       store c->bkdesp to d_bkdesp
	       store bkno1 to bkn1
	       store bkno2 to bkn2
	       re=left(ltrim(trim(str(re)))+aw,4)
	       bkn1=right(aw+ltrim(trim(str(bkn1))),6)
	       bkn2=right(aw+ltrim(trim(str(bkn2))),6)
	       d_bknou=left(ltrim(trim(d_bkno))+aw,12)
	       d_bknod=substr(ltrim(trim(d_bkno))+aw,13,12)
	       d_bkdespu=left(ltrim(trim(d_bkdesp))+aw,40)
	       d_bkdespd=substr(ltrim(trim(d_bkdesp))+aw,41,40)
	       if pr='Y'
		  text to print
¢u¢w¢w¢q¢w¢w¢w¢w¢w¢w¢q¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢q¢w¢w¢w¢q¢w¢w¢w¢q¢w¢w¢w¢w¢w¢t
¢x&re¢x&d_bknou¢x&d_bkdespu¢x&bkn1¢x&bkn2¢xÿÿÿÿÿÿÿÿÿÿ¢x
¢xÿÿÿÿ¢x&d_bknod¢x&d_bkdespd¢xÿÿÿÿÿÿ¢xÿÿÿÿÿÿ¢xÿÿÿÿÿÿÿÿÿÿ¢x
		  endtext
	       else
		  text
¢u¢w¢w¢q¢w¢w¢w¢w¢w¢w¢q¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢q¢w¢w¢w¢q¢w¢w¢w¢q¢w¢w¢w¢w¢w¢t
¢x&re¢x&d_bknou¢x&d_bkdespu¢x&bkn1¢x&bkn2¢xÿÿÿÿÿÿÿÿÿÿ¢x
¢xÿÿÿÿ¢x&d_bknod¢x&d_bkdespd¢xÿÿÿÿÿÿ¢xÿÿÿÿÿÿ¢xÿÿÿÿÿÿÿÿÿÿ¢x
		  endtext
	       endif
	    endif
	    skip
	    if eof()
	       exit
	    endif
	 enddo
	 if pr='Y'
	    text to print
¢|¢w¢w¢r¢w¢w¢w¢w¢w¢w¢r¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢r¢w¢w¢w¢r¢w¢w¢w¢r¢w¢w¢w¢w¢w¢}
	    endtext
	 else
	    text
¢|¢w¢w¢r¢w¢w¢w¢w¢w¢w¢r¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢r¢w¢w¢w¢r¢w¢w¢w¢r¢w¢w¢w¢w¢w¢}
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
