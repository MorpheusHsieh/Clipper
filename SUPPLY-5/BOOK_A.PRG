* Program..: Add record and check
* Auther...: Yun aw
* Date.....: 04/05/1992
* Version..: Clipper
set talk off
store 0 to ans,i,k
store space(2) to d_bkyear,d_bktype
store space(4) to d_bkno1,d_bkno2,d_bkno3,d_bkno4,d_bkno5,d_bkno6,d_bkno7
store space(6) to d_dtno
store space(25) to d_bkno
store space(114) to d_bkdesp
sele a
use d:\tm_book\bookms
index on bkno+dtno to d:\tm_book\bookms.ntx
sele b
use d:\tm_book\bkitem
index on bkno to d:\tm_book\bkitem.ntx
sele a
do while .t.
   do while .t.
      @  0,0  clear
      @ 20,1  say '請輸入要增加記錄的單位代號：'get d_dtno
      read
      d_dtno=upper(d_dtno)
      do sub1
      if ans='1'
	 exit
      endif
   enddo
   do while .t.
      @ 20,0  clear
      @ 20,1  say '請輸入要增加的書刊編號：'get d_bkno
      read
      d_bkno=upper(d_bkno)
      do sub1
      if ans='1'
	 sele b
	 seek ltrim(trim(d_bkno))
	 if eof()
	    do while .t.
	       @ 21,0  clear
	       @ 21,1  say '請建立技術書刊目錄主檔'
	       ? chr(7)
	       i=0
	       do while i=0
		  i=inkey()
	       enddo
	       @  0,0  clear
	       @  5,5  say '書刊編號：'
	       @  5,15 say d_bkno
	       @  6,5  say '書刊名稱：'get d_bkdesp
	       @  9,5  say '書刊類別：'get d_bktype
	       @ 10,5  say '書刊年份：'get d_bkyear
	       read
	       do sub1
	       if ans='1'
		  sele b
		  append blank
		  replace bkno with d_bkno,bkdesp with d_bkdesp,bktype with d_bktype,bkyear with d_bkyear
		  index on bkno to d:\tm_book\bkitem.ntx
		  sele a
		  exit
	       endif
	    enddo
	 endif
	 exit
      endif
   enddo
   sele a
   seek ltrim(trim(d_bkno))
   do while .t.
      if d_bkno<>bkno.or.eof()
	 append blank
	 replace bkno with d_bkno,bkno1 with 0,bkno2 with 0,bkno3 with 0,bkno4 with 0,bkno5 with 0,bkno6 with 0,bkno7 with 0,dtno with d_dtno
      endif
      if d_dtno=dtno
	 store space(4) to d_bkno1,d_bkno2,d_bkno3,d_bkno4,d_bkno5,d_bkno6,d_bkno7
	 d_bkno1=bkno1
	 d_bkno2=bkno2
	 d_bkno3=bkno3
	 d_bkno4=bkno4
	 d_bkno5=bkno5
	 d_bkno6=bkno6
	 d_bkno7=bkno7
	 do sub2
	 replace bkno with d_bkno,bkno1 with d_bkno1,bkno2 with d_bkno2,bkno3 with d_bkno3,bkno4 with d_bkno4,bkno5 with d_bkno5,bkno6 with d_bkno6,bkno7 with d_bkno7,dtno with d_dtno
	 reindex
	 do sub3
	 if ans='Y'
	    return
	 endif
	 exit
      endif
      skip
   enddo
enddo

procedure sub1
   do while .t.
      ans=space(1)
      @ 21,0  clear
      @ 21,1  say '輸入是否正確 (1->Yes/2->No)：'get ans
      read
      if ans='1'.or.ans='2'
	 exit
      endif
   enddo
return

procedure sub2
   @  5,0  clear
   @  5,5  say '書刊編號：'
   @  5,15 say d_bkno
   @  6,5  say '應 有 數：'get d_bkno1
   @  7,5  say '現 有 數：'get d_bkno2
   @  8,5  say '待 繳 數：'get d_bkno3
   @  9,5  say '缺 少 數：'get d_bkno4
   @ 10,5  say '庫 存 數：'get d_bkno5
   @ 11,5  say '破 損 數：'get d_bkno6
   @ 12,5  say '英文書刊：'get d_bkno7
   read
   do sub1
return

procedure sub3
   do while .t.
      @ 21,1  clear
      @ 21,1  say '是否要繼續(1->Yes/2->No)：'get ans
      read
      if ans='1'
	 return
      endif
   enddo
return
