* Program..: 庫存檔列管可修件轉換分檔程式
* Filename.: PROM03-3.PRG
* Auther...: Yun aw
* Date.....: 04/16/1992
* Version..: Clipper
store 0 to r
store space(4) to d_basum1,d_basum2,d_basum3,d_basum4
store space(6) to d_basum
store space(13) to d_imno,d_imno1
@  0,0	clear
sele a
   @ 21,0  clear
   @ 21,1  say '現在建立空檔....'
   private data_name[6],data_type[6],data_lens[6],data_decs[6]
   * field 1
     data_name[1]="imno"
     data_type[1]="c"
     data_lens[1]=13
     data_decs[1]=0
   * field 2
     data_name[2]="basum"
     data_type[2]="n"
     data_lens[2]=6
     data_decs[2]=0
   * field 3
     data_name[3]="basum1"
     data_type[3]="n"
     data_lens[3]=4
     data_decs[3]=0
   * field 4
     data_name[4]="basum2"
     data_type[4]="n"
     data_lens[4]=4
     data_decs[4]=0
   * field 5
     data_name[5]="basum3"
     data_type[5]="n"
     data_lens[5]=4
     data_decs[5]=0
   * field 6
     data_name[6]="basum4"
     data_type[6]="n"
     data_lens[6]=4
     data_decs[6]=0
do sub1 with "d:\temp",data_name,data_type,data_lens,data_decs
copy stru to d:\army\prom03-3
@ 21,0	clear
@ 21,1	say '現在轉換資料主檔....'
? chr(7)
use d:\army\prom03-2
do while .t.
   @  1,66 say '第          筆'
   @  1,68 say recno()
   d_imno=imno
   store 0 to d_basum,d_basum1,d_basum2,d_basum3,d_basum4
   if eof()
      exit
   endif
   do case
      case dtno='105025'.or.dtno='GA'.or.dtno='105027'
	 d_basum1=ontrqty
	 d_basum=ontrqty
      case dtno='GD'
	 d_basum3=ontrqty
	 d_basum=ontrqty
      case dtno='GC'.or.dtno='105026'
	 d_basum4=ontrqty
	 d_basum=ontrqty
      otherwise
	 d_basum2=ontrqty
	 d_basum=ontrqty
   endcase
   sele b
      use d:\temp
      append blank
      replace imno with d_imno,basum with d_basum,basum1 with d_basum1,basum2 with d_basum2,basum3 with d_basum3,basum4 with d_basum4
   sele a
   skip
enddo
@ 21,0	clear
@ 21,1	say '現在整理檔案重覆資料....'
? chr(7)
sele c
   use d:\army\prom03-3
sele b
   use d:\temp
   index on imno to d:\temp.ntx
   go top
   do while .t.
      if eof()
	 exit
      endif
      d_imno=imno
      d_basum=basum
      d_basum1=basum1
      d_basum2=basum2
      d_basum3=basum3
      d_basum4=basum4
      do while .t.
	 skip
	 d_imno1=imno
	 if d_imno1<>d_imno
	    exit
	 endif
	 d_basum=d_basum+basum
	 d_basum1=d_basum1+basum1
	 d_basum2=d_basum2+basum2
	 d_basum3=d_basum3+basum3
	 d_basum4=d_basum4+basum4
      enddo
      sele c
	 use d:\army\prom03-3
	 append blank
	 replace imno with d_imno,basum with d_basum,basum1 with d_basum1,basum2 with d_basum2,basum3 with d_basum3,basum4 with d_basum4
      sele b
      store 0 to d_basum,d_basum1,d_basum2,d_basum3,d_basum4
      skip
   enddo

*┌────┐
*│建檔程式│
*└────┘
procedure sub1
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
