* Program : Create Fix.dbf
* Filename: CFIX.PRG
* Auther  : Avatar
* Date    : 05/17/1995
set wrap on
set scoreboard off

do fixfield

***************
* Sub Program *
***************
procedure fixfield
   private d_names[7], d_types[7], d_lens[7], d_decs[7]
*  field1
   d_names[1]="MCNO"
   d_types[1]="C"
   d_lens[1]=7
   d_decs[1]=0

*  field2
   d_names[2]="CTNO"
   d_types[2]="C"
   d_lens[2]=8
   d_decs[2]=0

*  field3
   d_names[3]="BREAK"
   d_types[3]="C"
   d_lens[3]=50
   d_decs[3]=0

*  field4
   d_names[4]="DTNO"
   d_types[4]="C"
   d_lens[4]=24
   d_decs[4]=0

*  field5
   d_names[5]="ONDATE"
   d_types[5]="D"
   d_lens[5]=8
   d_decs[5]=0

*  field6
   d_names[6]="FXDATE"
   d_types[6]="D"
   d_lens[6]=8
   d_decs[6]=0

*  field7
   d_names[7]="FXQTY"
   d_types[7]="N"
   d_lens[7]=8
   d_decs[7]=0

   do create_dbf with "\temp\fix" ,d_names,d_types,d_lens,d_decs
return
