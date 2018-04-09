* Program : Create data.dbf
* Filename: CDATA.PRG
* Auther  : Avatar
* Date    : 05/17/1995
set wrap on
set scoreboard off

do datafield

***************
* Sub Program *
***************
procedure datafield
   private d_names[6], d_types[6], d_lens[6], d_decs[6]
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
   d_names[3]="DTNAME"
   d_types[3]="C"
   d_lens[3]=50
   d_decs[3]=0

*  field4
   d_names[4]="FCNO"
   d_types[4]="C"
   d_lens[4]=6
   d_decs[4]=0

*  field5
   d_names[5]="SCOST"
   d_types[5]="N"
   d_lens[5]=8
   d_decs[5]=0

*  field6
   d_names[6]="ONDATE"
   d_types[6]="D"
   d_lens[6]=8
   d_decs[6]=0

   do create_dbf with "\temp\data" ,d_names,d_types,d_lens,d_decs
return
