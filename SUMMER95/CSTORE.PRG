* Program : Create store.dbf
* Filename: CSTORE.PRG
* Auther  : Avatar
* Date    : 05/17/1995
clear
set wrap on
set scoreboard off

if .not.file("\temp\store.dbf")
   do allfield
endif
close

***************
* Sub Program *
***************
procedure allfield
   private d_names[7], d_types[7], d_lens[7], d_decs[7]
*  field1
   d_names[1]="IMNO"
   d_types[1]="C"
   d_lens[1]=8
   d_decs[1]=0

*  field2
   d_names[2]="DTNO"
   d_types[2]="C"
   d_lens[2]=24
   d_decs[2]=0

*  field3
   d_names[3]="SCOST"
   d_types[3]="N"
   d_lens[3]=4
   d_decs[3]=0

*  field4
   d_names[4]="LOCAL"
   d_types[4]="C"
   d_lens[4]=3
   d_decs[4]=0

*  field5
   d_names[5]="QTY1"
   d_types[5]="N"
   d_lens[5]=4
   d_decs[5]=0

*  field6
   d_names[6]="QTY2"
   d_types[6]="N"
   d_lens[6]=4
   d_decs[6]=0

*  field7
   d_names[7]="ONDATE"
   d_types[7]="D"
   d_lens[7]=6
   d_decs[7]=0

   do create_dbf with "\temp\store" ,d_names,d_types,d_lens,d_decs
return

procedure create_dbf
   parameter file_name,f_names,f_types,f_lens,f_decs
   private num_fields,i
      select 0
      create dummy
      num_fields=len(f_names)
      for i=1 to num_fields
         append blank
         replace field_name with f_names[i],field_type with f_types[i],field_len with f_lens[i],field_dec with f_decs[i]
      next
      create(file_name) from dummy   && dummy gets closed here
      erase dummy.dbf
   return
