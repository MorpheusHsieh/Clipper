* Program : Create Updaata.dbf
* Filename: CUPDATA.PRG
* Auther  : Avatar
* Date    : 05/17/1995
clear
set wrap on
set scoreboard off

if .not.file("\temp\updata.dbf")
   do allfield
endif

***************
* Sub Program *
***************
procedure allfield
   private d_names[9], d_types[9], d_lens[9], d_decs[9]
*  field1
   d_names[1]="ORNO"
   d_types[1]="C"
   d_lens[1]=8
   d_decs[1]=0

*  field2
   d_names[2]="IMNO"
   d_types[2]="C"
   d_lens[2]=8
   d_decs[2]=0

*  field3
   d_names[3]="DTNO"
   d_types[3]="C"
   d_lens[3]=24
   d_decs[3]=0

*  field4
   d_names[4]="FCNO"
   d_types[4]="C"
   d_lens[4]=6
   d_decs[4]=0

*  field5
   d_names[5]="IVSTD1"
   d_types[5]="N"
   d_lens[5]=4
   d_decs[5]=0

*  field6
   d_names[6]="IVSTD2"
   d_types[6]="N"
   d_lens[6]=4
   d_decs[6]=0

*  field7
   d_names[7]="IVSTD3"
   d_types[7]="N"
   d_lens[7]=4
   d_decs[7]=0

*  field8
   d_names[8]="IVSSTD4"
   d_types[8]="N"
   d_lens[8]=4
   d_decs[8]=0

*  field9
   d_names[9]="ONDATE"
   d_types[9]="D"
   d_lens[9]=6
   d_decs[9]=0

   do create_dbf with "\temp\updata" ,d_names,d_types,d_lens,d_decs
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
