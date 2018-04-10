
@ 21,0	clear
@ 21,1	say '現在整理檔案重覆資料....'
? chr(7)
sele b
   use d:\prom03-3
sele a
   use temp
   index on imno to temp
   go top
   do while .t.
      if eof()
	 exit
      endif
      d_imno=imno
      do while .t.
	 skip
	 d_imno1=imno
	 if d_imno=d_imno1
	    d_basum=d_basum+basum
	    d_basum1=d_basum1+basum1
	    d_basum2=d_basum2+basum2
	    d_basum3=d_basum3+basum3
	    d_basum4=d_basum4+basum4
	 endif
	 if d_imno<>d_imno1.or.eof()
	    exit
	 endif
      enddo
      sele b
	 use d:\prom03-3
	 append blank
	 replace imno with d_imno,basum with d_basum,basum1 with d_basum1,basum2 with d_basum2,basum3 with d_basum3,basum4 with d_basum4
      sele a
      skip
   enddo
