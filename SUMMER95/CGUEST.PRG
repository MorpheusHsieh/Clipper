* Program : Create Guest.dbf
* Filename: CGUEST.PRG
* Auther  : Avatar
* Date    : 05/17/1995

if .not.file("\temp\guest.dbf")
   do guestfield
endif

procedure guestfield
   private d_names[14], d_types[14], d_lens[14], d_decs[14]
*  field1
   d_names[1]="imno"
   d_types[1]="C"
   d_lens[1]=8
   d_decs[1]=0

*  field2
   d_names[2]="MCNO"
   d_types[2]="C"
   d_lens[2]=7
   d_decs[2]=0

*  field3
   d_names[3]="MASTER"
   d_types[3]="C"
   d_lens[3]=8
   d_decs[3]=0

*  field4
   d_names[4]="HAREA"
   d_types[4]="C"
   d_lens[4]=2
   d_decs[4]=0

*  field5
   d_names[5]="HTEL"
   d_types[5]="C"
   d_lens[5]=8
   d_decs[5]=0

*  field6
   d_names[6]="HADR"
   d_types[6]="C"
   d_lens[6]=50
   d_decs[6]=0

*  field7
   d_names[7]="WAREA"
   d_types[7]="C"
   d_lens[7]=2
   d_decs[7]=0

*  field8
   d_names[8]="WTEL"
   d_types[8]="C"
   d_lens[8]=16
   d_decs[8]=0

*  field9
   d_names[9]="WADR"
   d_types[9]="C"
   d_lens[9]=50
   d_decs[9]=0

*  field10
   d_names[10]="NAME2"
   d_types[10]="C"
   d_lens[10]=8
   d_decs[10]=0

*  field11
   d_names[11]="EGNO"
   d_types[11]="C"
   d_lens[11]=10
   d_decs[11]=0

*  field12
   d_names[12]="IDNO"
   d_types[12]="C"
   d_lens[12]=10
   d_decs[12]=0

*  field13
   d_names[13]="BBCALL"
   d_types[13]="C"
   d_lens[13]=12
   d_decs[13]=0

*  field14
   d_names[14]="SDATE"
   d_types[14]="D"
   d_lens[14]=8
   d_decs[14]=0

   do create_dbf with "\temp\guest" ,d_names,d_types,d_lens,d_decs
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
