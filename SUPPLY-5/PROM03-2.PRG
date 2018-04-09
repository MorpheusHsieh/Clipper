* Program..: 建立列管可修件分檔程式
* Filename.: PROM03-2.PRG
* Auther...: Yun aw
* Date.....: 04/16/1992
* Version..: Clipper Summer 87

store space(1) to nu
store space(4) to d_ontrqty
store space(6) to d_dtno
store space(8) to d_imct,d_imct1
store space(13) to d_imno

*┌────┐
*│主程式區│
*└────┘
@  0,0	clear
@ 21,1	say '現在程式整理中....'
sele c
   private data_name[4],data_type[4],data_lens[4],data_decs[4]
   * field 1
     data_name[1]="imno"
     data_type[1]="c"
     data_lens[1]=13
     data_decs[1]=0
   * field 2
     data_name[2]="ontrqty"
     data_type[2]="n"
     data_lens[2]=4
     data_decs[2]=0
   * field 3
     data_name[3]="num"
     data_type[3]="c"
     data_lens[3]=1
     data_decs[3]=0
   * field 4
     data_name[4]="dtno"
     data_type[4]="c"
     data_lens[4]=6
     data_decs[4]=0
do sub1 with "d:\army\prom03-2",data_name,data_type,data_lens,data_decs
use d:\army\prom03-2
sele b
use d:\army\temp109
index on imctlno to d:\army\temp109.ntx
go top
sele a
use d:\army\tempc
set relation to imctlno into b
go top
do while .t.
   if eof()
      exit
   endif
   @  1,66 say '第          筆'
   @  1,68 say recno()
   d_imct=imctlno
   d_ontrqty=ivqty2
   d_dtno=dtno
   d_imno=b->imno
   d_imct1=b->imctlno
   if d_imct=d_imct1
      sele c
      use d:\army\prom03-2
      append blank
      replace imno with d_imno,ontrqty with d_ontrqty,num with '4',dtno with d_dtno
      sele a
   endif
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