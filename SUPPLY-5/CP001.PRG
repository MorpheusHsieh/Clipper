* Program..: �q�T���޲z�{��
* Filename.: CP001.PRG
* Language.: Clipper summer 87'
* Author...: Yun aw
* Date.....: 1992/09/09

* �z�w�w�w�w�{
* �x���ҳ]�w�x
* �|�w�w�w�w�}
set wrap on
set date ansi
set scoreboard off
sele a
   if .not.file("\database\phone.dbf")
      do sub1
   else
      use \database\phone.dbf
   endif
   if .not.file("d:\database\phone2.ntx")
      index on id to d:\database\phone2.ntx
   else
      set index to d:\database\phone1.ntx
   endif
   if .not.file("d:\database\phone1.ntx")
      index on name to d:\database\phone1.ntx
   else
      set index to d:\database\phone1.ntx
   endif
sele b
   if .not.file("d:\database\phonext.dbf")
      do sub2
   else
      use d:\database\phonext.dbf
   endif
   if .not.file("d:\database\phonext.ntx")
      index on id to d:\database\phonext.ntx
   else
      set index to d:\database\phonext.ntx
   endif
sele a
   set relation to id into b

* �z�w�w�w�w�{
* �x�ܼƳ]�w�x
* �|�w�w�w�w�}
menu00='0.��  ��'
menu01='1.�W  �['
menu02='2.��  ��'
menu03='3.�R  ��'
menu04='4.�d  ��'
menu05='5.�C  �L'
store 1 to choice
store space(1) to pr,ans
store space(2) to d_blood,d_area1,d_area2
store space(7) to d_phone1,d_phone2,d_mail,d_mailid,d_bank,d_bankid
store space(8) to d_name,d_birthday,d_date
store space(10) to d_id
store space(13) to d_bbcall
store space(50) to d_addr1,d_addr2

* �z�w�w�w�w�{
* �x�D�{���Ϣx
* �|�w�w�w�w�}
sele a
do while choice<>6
   @  0,0  clear
   @  0,0  say '�z�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{'
   @  1,0  say '�x�q�T���޲z�{��                                            �]�p����G92.09.10�x'
   @  2,0  say '�|�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}'
   @ 20,64 say 'Avatar�q���u�@��'
   @  3,1  prompt menu01
   @  3,15 prompt menu02
   @  3,29 prompt menu03
   @  3,43 prompt menu04
   @  3,57 prompt menu05
   @  3,71 prompt menu00
   area=savescreen(0,0,3,80)
   do while .t.
      @ 21,1  clear
      @ 21,1  say '�O�_�ҰʦL���� (Y/N):'get pr
      read
      pr=upper(pr)
      if pr='Y'.or.pr='N'
	 exit
      endif
   enddo
   menu to choice
   do case
      case choice=1
	 do sub3
      case choice=2
	 @ 21,1  clear
	 @ 21,1  say '�{�b���ﶵ������, ������@���~��....'
	 ? chr(7)
	 inkey(0)
      case choice=3
	 @ 21,1  clear
	 @ 21,1  say '�{�b���ﶵ������, ������@���~��....'
	 ? chr(7)
	 inkey(0)
      case choice=4
	 @ 21,1  clear
	 @ 21,1  say '�{�b���ﶵ������, ������@���~��....'
	 ? chr(7)
	 inkey(0)
      case choice=5
	 @ 21,1  clear
	 @ 21,1  say '�{�b���ﶵ������, ������@���~��....'
	 ? chr(7)
	 inkey(0)
   endcase
enddo

* �z�w�w�w�w�{
* �x�Ƶ{���Ϣx
* �|�w�w�w�w�}
procedure sub0
   parameters file_name,f_name,f_type,f_lens,f_decs
   private num_fields,i
      select 0
      creat dummy
      num_fields=len(f_name)
      for i=1 to num_fields
	 append blank
	 replace field_name with f_name[i],field_type with f_type[i],field_len with f_lens[i],field_dec with f_decs[i]
      next
      creat(file_name) from dummy		       && dummy gets closed here
      erase dummy
return

procedure sub1
   private d_name[8],d_type[8],d_lens[8],d_decs[8]
   * field 1
     d_name[1]='name'
     d_type[1]='c'
     d_lens[1]=8
     d_decs[1]=0
   * field 2
     d_name[2]='id'
     d_type[2]='c'
     d_lens[2]=10
     d_decs[2]=0
   * field 3
     d_name[3]='birthday'
     d_type[3]='d'
     d_lens[3]=8
     d_decs[3]=0
   * field 4
     d_name[4]='blood'
     d_type[4]='c'
     d_lens[4]=2
     d_decs[4]=0
   * field 5
     d_name[5]='area1'
     d_type[5]='c'
     d_lens[5]=2
     d_decs[5]=0
   * field 6
     d_name[6]='phone1'
     d_type[6]='c'
     d_lens[6]=7
     d_decs[6]=0
   * field 7
     d_name[7]='addr1'
     d_type[7]='c'
     d_lens[7]=50
     d_decs[7]=0
   * field 8
     d_name[8]='onudate'
     d_type[8]='d'
     d_lens[8]=8
     d_decs[8]=0
   do sub0 with "\database\phone",d_name,d_type,d_lens,d_decs
return

procedure sub2
   private d_name[9],d_type[9],d_lens[9],d_decs[9]
   * field 1
     d_name[1]='id'
     d_type[1]='c'
     d_lens[1]=10
     d_decs[1]=0
   * field 2
     d_name[2]='area2'
     d_type[2]='c'
     d_lens[2]=2
     d_decs[2]=0
   * field 3
     d_name[3]='phone2'
     d_type[3]='c'
     d_lens[3]=7
     d_decs[3]=0
   * field 4
     d_name[4]='bbcall'
     d_type[4]='c'
     d_lens[4]=13
     d_decs[4]=0
   * field 5
     d_name[5]='mail'
     d_type[5]='c'
     d_lens[5]=7
     d_decs[5]=0
   * field 6
     d_name[6]='mailid'
     d_type[6]='c'
     d_lens[6]=7
     d_decs[6]=0
   * field 7
     d_name[7]='bank'
     d_type[7]='c'
     d_lens[7]=7
     d_decs[7]=0
   * field 8
     d_name[8]='bankid'
     d_type[8]='d'
     d_lens[8]=7
     d_decs[8]=0
   * field 9
     d_name[9]='addr2'
     d_type[9]='c'
     d_lens[9]=50
     d_decs[9]=0
   do sub0 with "\database\phonext",d_name,d_type,d_lens,d_decs
return

procedure sub3
   do while .t.
      cow=4
      do demo1
      @ cow+1,14 get d_name
      read
      if reccount()=0
	 do sub4
      else
	 seek d_name
	 if found()
	    d_id=id
	    d_area1=area1
	    d_addr1=addr1
	    d_blood=blood
	    d_mail=b->bank
	    d_mail=b->mail
	    d_phone1=phone1
	    d_addr2=b->addr2
	    d_area2=b->area2
	    d_mailid=b->bankid
	    d_bbcall=b->bbcall
	    d_mailid=b->mailid
	    d_phone2=b->phone2
	    d_date=dtoc(onudate)
	    d_birthday=dtoc(birthday)
	    @ cow+1,14 say d_name
	    @ cow+2,14 say d_id
	    @ cow+3,14 say d_birthday
	    @ cow+4,14 say d_blood
	    @ cow+5,14 say d_bbcall
	    @ cow+6,14 say d_area1
	    @ cow+6,54 say d_phone1
	    @ cow+7,14 say d_addr1
	    @ cow+8,14 say d_area2
	    @ cow+8,54 say d_phone2
	    @ cow+9,14 say d_addr2
	    @ cow+10,12 say d_mail
	    @ cow+10,54 say d_mailid
	    @ cow+11,12 say d_bank
	    @ cow+11,54 say d_bankid
	    @ cow+12,12 say d_date
	    @ 21,1  clear
	    @ 21,1  say '��ƭ��СA������@���~��....'
	    ? chr(7)
	    inkey(0)
	 else
	    do sub4
	 endif
      endif
      @ 21,1  clear
      @ 21,1  say '�O�_�n�~�� (Y/N):'get ans
      read
      ans=upper(ans)
      if ans='N'
	 index on id to \database\phone2.ntx
	 index on name to \database\phone1.ntx
	 index on id to \database\phoneext.ntx
	 exit
      endif
   enddo
return

procedure sub4
   do while .t.
      @ cow+2,14 get d_id
      @ cow+3,14 get d_birthday
      @ cow+4,14 get d_blood
      @ cow+5,14 get d_bbcall
      @ cow+6,14 get d_area1
      @ cow+6,52 get d_phone1
      @ cow+7,14 get d_addr1
      @ cow+8,14 get d_area2
      @ cow+8,52 get d_phone2
      @ cow+9,14 get d_addr2
      @ cow+10,12 get d_mail
      @ cow+10,52 get d_mailid
      @ cow+11,12 get d_bank
      @ cow+11,52 get d_bankid
      @ cow+12,12 get d_date
      read
      d_id=upper(id)
      d_blood=upper(blood)
      @ 21,1  clear
      @ 21,1  say '��J�O�_���T (Y/N):'get ans
      read
      ans=upper(ans)
      if ans='Y'
	 exit
      endif
   enddo
   sele a
      go bott
      append blank
      replace name with d_name,id with d_id,birthday with ctod(d_birthday),blood with d_blood,area1 with d_area1,phone1 with d_phone1,addr1 with d_addr1,onudate with ctod(d_date)
   sele b
      go bott
      append blank
      replace id with d_id,area2 with d_area2,phone2 with d_phone2,addr2 with d_addr2,bbcall with d_bbcall,mail with d_mail,mailid with d_mailid,bank with d_bank
   sele a
return

procedure demo1
   @ cow,0  clear
   @ cow+0 ,0  say '�z�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{'
   @ cow+1 ,0  say '�x�m      �W�G                                                                �x'
   @ cow+2 ,0  say '�x�����Ҹ��X�G                                                                �x'
   @ cow+3 ,0  say '�x�X�ͦ~���G                                                                �x'
   @ cow+4 ,0  say '�x��      ���G                                                                �x'
   @ cow+5 ,0  say '�x�I�s�����X�G                                                                �x'
   @ cow+6 ,0  say '�x�ϰ�X (1)�G                          �q  �� (1)�G                          �x'
   @ cow+7 ,0  say '�x��  �} (1)�G                                                                �x'
   @ cow+8 ,0  say '�x�ϰ�X (2)�G                          �q  �� (2)�G                          �x'
   @ cow+9 ,0  say '�x��  �} (2)�G                                                                �x'
   @ cow+10,0  say '�x�l�������G                            �l���b���G                            �x'
   @ cow+11,0  say '�x�Ȧ槽���G                            �Ȧ�b���G                            �x'
   @ cow+12,0  say '�x���ʤ���G                                                                  �x'
   @ cow+13,0  say '�|�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}'
   area1=savescreen(cow,0,cow+13,80)
return
