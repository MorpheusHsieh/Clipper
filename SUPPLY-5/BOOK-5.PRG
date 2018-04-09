* Program..: ¦C¦L¯Ê¤Ö®Ñ¥Z¤Àªíµ{¦¡
* Filename.: BOOK-5.PRG
* Printer..: T24W1Z1L2X1G2
* Auther...: Yun aw
* Date.....: 04/06/1992
* Version..: Clipper
set wrap on
set talk off
store 0 to re,r1,r2
store space(1) to choice,pr,ans
store space(6) to d_bkno1,d_bkno2,d_bkno4
store space(6) to d_dtno,menu
store space(13) to d_bknou,d_bknod
store space(26) to d_bkno
store space(40) to d_bkdespu,d_bkdespd
store space(80) to d_bkdesp
aw=replicate('ÿ',40)
menu01='®v³¡³s'
menu02='¤Æ§L³s'
menu03='¸ËÃM³s'
menu04='¤Ï¸Ë¥Ò'
menu05='³q«HÀç'
menu06='¤u§LÀç'
menu07='¤@¤C¤@'
menu08='¤@¤C¤G'
menu09='¤@¤C¤T'
menu10='¤@¤C¥|'
menu11='¤@¤C¤­'
menu12='¤@¤C¤»'
menu13='¤C¤C¥|'
menu14='¤C¤K¤@'
menu15='¤C¤K¤G'
menu16='¥|¤T¤T'
menu17='¥|¤T¥|'
menu18='¥|¤T¤­'
menu19='¥|¤T¤»'
menu20='«O­×Àç'
menu21='¥D¤ä³s'
menu22='«e¤@³s'
menu23='«e¤G³s'
menu24='¸É¹BÀç'
menu25='µ²  §ô'
choice=1
do while .t.
   do while .t.
      @ 21,1 clear
      @ 21,1  say '¬O§_±Ò°Ê¦Lªí¾÷ (Y/N)¡G'get pr
      read
      pr=upper(pr)
      if pr='Y'.or.pr='N'
	exit
      endif
   enddo
   do while choice<>22
      @  0,0  clear
      @  0,0  say '¢z¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{'
      @  1,0  say '¢x                                                                            ¢x'
      @  2,0  say '¢x                                                                            ¢x'
      @  3,0  say '¢x                                                                            ¢x'
      @  4,0  say '¢x                                                                            ¢x'
      @  5,0  say '¢|¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢}'
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
	    menu='®v³¡³s'
	    do sub1
	 case choice=2
	    d_dtno='AB'
	    menu='¤Æ§L³s'
	    do sub1
	 case choice=3
	    d_dtno='AD'
	    menu='¸ËÃM³s'
	    do sub1
	 case choice=4
	    d_dtno='AE'
	    menu='¤Ï¸Ë¥Ò'
	    do sub1
	 case choice=5
	    d_dtno='AF'
	    menu='³q«HÀç'
	    do sub1
	 case choice=6
	    d_dtno='AG'
	    menu='¤u§LÀç'
	    do sub1
	 case choice=7
	    d_dtno='BB'
	    menu='¤@¤C¤@'
	    do sub1
	 case choice=8
	    d_dtno='BC'
	    menu='¤@¤C¤G'
	    do sub1
	 case choice=9
	    d_dtno='BD'
	    menu='¤@¤C¤T'
	    do sub1
	 case choice=10
	    d_dtno='CB'
	    menu='¤@¤C¥|'
	    do sub1
	 case choice=11
	    d_dtno='CC'
	    menu='¤@¤C¤­'
	    do sub1
	 case choice=12
	    d_dtno='CD'
	    menu='¤@¤C¤»'
	    do sub1
	 case choice=13
	    d_dtno='DB'
	    menu='¤C¤C¥|'
	    do sub1
	 case choice=14
	    d_dtno='DC'
	    menu='¤C¤K¤@'
	    do sub1
	 case choice=15
	    d_dtno='DD'
	    menu='¤C¤K¤G'
	    do sub1
	 case choice=16
	    d_dtno='EC'
	    menu='¥|¤T¤T'
	    do sub1
	 case choice=17
	    d_dtno='ED'
	    menu='¥|¤T¥|'
	    do sub1
	 case choice=18
	    d_dtno='EE'
	    menu='¥|¤T¤­'
	    do sub1
	 case choice=19
	    d_dtno='105025'
	    menu='¥|¤T¤»'
	    do sub1
	 case choice=20
	    d_dtno='FC'
	    menu='«O­×Àç'
	    do sub1
	 case choice=21
	    d_dtno='105025'
	    menu='¥D¤ä³s'
	    do sub1
	 case choice=22
	    d_dtno='GA'
	    menu='«e¤@³s'
	    do sub1
	 case choice=23
	    d_dtno='GB'
	    menu='«e¤G³s'
	    do sub1
	 case choice=24
	    d_dtno='FC'
	    menu='¸É¹BÀç'
	    do sub1
	 case choice=25
	    exit
      endcase
   enddo
   do while .t.
      @ 21,1  clear
      @ 21,1  say '¬O§_­nµ²§ô¥»µ{¦¡ (Y/N)¡G'get ans
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
      copy to temp1 for dtno=d_dtno.and.(bkno1<>bkno2)
      use temp1
      if reccount()=0
	 @ 21,1  say '¬dµL³æ¦ì¥N¸¹¬°      ¤§§Þ³N®Ñ¥Z¤§¸ê®Æ'
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
  ³°­x¾÷±ñ¤Æ²Ä¤@¡³¤E®v¤K¤Q¤@¦~«×&menu§L¤uÃþ§Þ³N®Ñ¥Z¯S§O²MÂI³¡¶¤¯Ê¤Ö«Ý¥Ó½Ð®Ñ¥Z²Î­pªí
¢z¢w¢w¢s¢w¢w¢w¢w¢w¢w¢s¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢s¢w¢w¢w¢s¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
¢x¶µ¦¸¢x®Ñ ¥Z ½s ¸¹ ¢x®Ñÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¦W¢x¼Æÿÿ¶q¢x³Æÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¦Ò¢x
	    endtext
	 else
	    text
  ³°­x¾÷±ñ¤Æ²Ä¤@¡³¤E®v¤K¤Q¤@¦~«×&menu§L¤uÃþ§Þ³N®Ñ¥Z¯S§O²MÂI³¡¶¤¯Ê¤Ö«Ý¥Ó½Ð®Ñ¥Z²Î­pªí
¢z¢w¢w¢s¢w¢w¢w¢w¢w¢w¢s¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢s¢w¢w¢w¢s¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
¢x¶µ¦¸¢x®Ñ ¥Z ½s ¸¹ ¢x®Ñÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¦W¢x¼Æÿÿ¶q¢x³Æÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¦Ò¢x
	    endtext
	 endif
	 do while r1<25
	    r1=r1+1
	    r2=r2+1
	    store r2 to re
	    store bkno to d_bkno
	    store b->bkdesp to d_bkdesp
	    d_bkno4=bkno1-bkno2
	    re=left(ltrim(trim(str(re)))+aw,4)
	    d_bknou=left(ltrim(trim(d_bkno))+aw,12)
	    d_bknod=substr(ltrim(trim(d_bkno))+aw,13,12)
	    d_bkdespu=left(ltrim(trim(d_bkdesp))+aw,40)
	    d_bkdespd=substr(d_bkdesp+aw,41,40)
	    d_bkno4=left(ltrim(trim(str(d_bkno4)))+aw,6)
	    if pr='Y'
	       text to print
¢u¢w¢w¢q¢w¢w¢w¢w¢w¢w¢q¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢q¢w¢w¢w¢q¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢t
¢x&re¢x&d_bknou¢x&d_bkdespu¢x&d_bkno4¢xÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¢x
¢x    ¢x&d_bknod¢x&d_bkdespd¢xÿÿÿÿÿÿ¢xÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¢x
	       endtext
	    else
	       text
¢u¢w¢w¢q¢w¢w¢w¢w¢w¢w¢q¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢q¢w¢w¢w¢q¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢t
¢x&re¢x&d_bknou¢x&d_bkdespu¢x&d_bkno4¢xÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¢x
¢x    ¢x&d_bknod¢x&d_bkdespd¢xÿÿÿÿÿÿÿÿ¢xÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ¢x
	       endtext
	    endif
	    skip
	    if eof()
	       exit
	    endif
	 enddo
	 if pr='Y'
	    text to print
¢|¢w¢w¢r¢w¢w¢w¢w¢w¢w¢r¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢r¢w¢w¢w¢r¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢}
	    endtext
	 else
	    text
¢|¢w¢w¢r¢w¢w¢w¢w¢w¢w¢r¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢r¢w¢w¢w¢r¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢}
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