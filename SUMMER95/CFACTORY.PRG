* Program : Create factory.dbf
* Filename: CFACTORY.PRG
* Auther  : Avatar
* Date    : 05/17/1995
set wrap on
set scoreboard off

do fcfield

***************
* Sub Program *
***************
procedure fcfield
   private d_names[7], d_types[7], d_lens[7], d_decs[7]
*  field1
   d_names[1]="FCNO"
   d_types[1]="C"
   d_lens[1]=8
   d_decs[1]=0

*  field2
   d_names[2]="FCNAME"
   d_types[2]="C"
   d_lens[2]=50
   d_decs[2]=0

*  field3
   d_names[3]="FCAREA"
   d_types[3]="C"
   d_lens[3]=2
   d_decs[3]=0

*  field4
   d_names[4]="FCTEL"
   d_types[4]="C"
   d_lens[4]=16
   d_decs[4]=0

*  field5
   d_names[5]="FCADR"
   d_types[5]="C"
   d_lens[5]=50
   d_decs[5]=0

*  field6
   d_names[6]="FCONET"
   d_types[6]="C"
   d_lens[6]=8
   d_decs[6]=0

*  field7
   d_names[7]="ONDATE"
   d_types[7]="D"
   d_lens[7]=8
   d_decs[7]=0

   do create_dbf with "\temp\factory" ,d_names,d_types,d_lens,d_decs
return
