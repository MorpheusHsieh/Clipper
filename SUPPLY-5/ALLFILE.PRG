***************************
* «ØÀÉµ{¦¡ * ALLFIELD.DBF *
***************************
procedure allfielddbf
private data_names[22],data_types[22],data_lens[22],data_decs[22]

data_names[1]="DTNO"
data_types[1]="C"
data_lens[1]=6
data_decs[1]=0

data_names[2]="ORDATE"
data_types[2]="D"
data_lens[2]=8
data_decs[2]=0

data_names[3]="ORNO"
data_types[3]="C"
data_lens[3]=4
data_decs[3]=0

data_names[4]="OMNO"
data_types[4]="C"
data_lens[4]=4
data_decs[4]=0

data_names[5]="IMCTLNO"
data_types[5]="C"
data_lens[5]=8
data_decs[5]=0

data_names[6]="IMNO"
data_types[6]="C"
data_lens[6]=13
data_decs[6]=0

data_names[7]="EPNO2"
data_types[7]="C"
data_lens[7]=10
data_decs[7]=0

data_names[8]="ONDATE"
data_types[8]="C"
data_lens[8]=4
data_decs[8]=0

data_names[9]="ONTRQTY"
data_types[9]="N"
data_lens[9]=4
data_decs[9]=0

data_names[10]="ONUDATE"
data_types[10]="D"
data_lens[10]=8
data_decs[10]=0

data_names[11]="IVSTD1"
data_types[11]="N"
data_lens[11]=4
data_decs[11]=0

data_names[12]="IVSTD2"
data_types[12]="N"
data_lens[12]=4
data_decs[12]=0

data_names[13]="IVQTY4"
data_types[13]="N"
data_lens[13]=4
data_decs[13]=0

data_names[14]="IVQTY5"
data_types[14]="N"
data_lens[14]=4
data_decs[14]=0

data_names[15]="IVQTY2"
data_types[15]="N"
data_lens[15]=4
data_decs[15]=0

data_names[16]="IVLOC2"
data_types[16]="C"
data_lens[16]=4
data_decs[16]=0

data_names[17]="IVQTY6"
data_types[17]="N"
data_lens[17]=4
data_decs[17]=0

data_names[18]="ONIDCODE"
data_types[18]="C"
data_lens[18]=3
data_decs[18]=0

data_names[19]="EPPTY"
data_types[19]="C"
data_lens[19]=2
data_decs[19]=0

data_names[20]="OMQTY1"
data_types[20]="N"
data_lens[20]=4
data_decs[20]=0

data_names[21]="OMQTY2"
data_types[21]="N"
data_lens[21]=4
data_decs[21]=0

data_names[22]="OMQTY4"
data_types[22]="N"
data_lens[22]=4
data_decs[22]=0

do create_dbf with "D:\ALLFIELD",data_names,data_types,data_lens,data_decs

return
********************************************************************
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
