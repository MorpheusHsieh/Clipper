* Program..: Search omtranu by imctlno
* Auther...: Yun aw
* Date.....: 03/15/1992
* Version..: Edit V5.0 + Clipper
set talk off
set date ansi
store 0 to i,k
store space(1) to ans1,ans2
store space(2) to eppty
store space(2) to d_eppty
store space(3) to onidcode
store space(3) to d_onidcode
store space(4) to omno,ontrqty,page
store space(4) to d_omno,d_ontrqty,d_trxndate,omno1
store space(6) to dtno
store space(6) to d_dtno
store space(8) to imct,imct1,imco,onudate,ondate
store space(8) to d_onudate,d_ondate,date1,date2
do while .t.
   sele 1
   use d:\army\omtranu
   set index to d:\army\omtranu
   copy stru to temp
   sele 2
   use temp
   sele 1
   do while imct1=space(8)
      @ 0,0   clear
      @ 20,1  say '�п�J�n�d�ߤ��ި�Ǹ��G'get imct1
      @ 21,1  say '���Ƹ����s�ɵ������{��'
      read
   enddo
   imct=ltrim(trim(upper(imct1)))
   if imct='0'
      run erase temp*.*
      exit
   endif
   do while ans1=space(1)
      @ 20,1  clear
      @ 20,1  say '�O�_�n�H����j�� (Y/N)�G'get ans1
      read
      ans1=upper(ans1)
      do case
	 case ans1='Y'
	    @ 20,1  clear
	    @ 20,1  say '�п�J�_�l����G'get date1
	    @ 21,1  say '�п�J��������G'get date2
	    read
	 case ans1='N'
	    exit
      endcase
   enddo
   do while ans2=space(1)
      @ 20,1  clear
      @ 20,1  say '�O�_�n�H�̳�Ǹ��j�� (Y/N)�G'get ans2
      read
      ans2=upper(ans2)
      do case
	 case ans2='Y'
	    @ 20,1  clear
	    @ 20,1  say '�п�J�̳�Ǹ��G'get omno1
	    read
	 case ans2='N'
	    exit
      endcase
   enddo
   seek imct
   if eof().and.imct<>imctlno
      @  0,0  clear
      @ 21,1  say '�d�L�ި�Ǹ���        �����'
      @ 21,15 say imct
      @ 21,29
   else
      do while .t.
	 d_onidcode=onidcode
	 d_dtno=dtno
	 d_ondate=ondate
	 d_omno=omno
	 d_ontrqty=ontrqty
	 d_onudate=onudate
	 d_eppty=eppty
	 d_trxndate=trxndate
	 sele 2
	 append blank
	 replace onidcode with d_onidcode,dtno with d_dtno,ondate with d_ondate,omno with d_omno,ontrqty with d_ontrqty,onudate with d_onudate,eppty with d_eppty,trxndate with d_trxndate
	 sele 1
	 skip
	 if imct<>imctlno
	    exit
	 endif
      enddo
   endif
   sele 2
   @  0,0 clear
   @  0,0  say '��� ��  �� ���� �̳� ��W���� �ƶq �u�� �T��                ����`�ơG'
   @  1,0  say '�ѧO �N  �� ��� ���                    ���                    ���ơG'
   @  2,0  say '--------------------------------------------------------------------------------'
   do case
      case ans1='N'.and.ans2='N'
	 use temp
	 index on dtno+dtoc(onudate)+omno to temp
	 reindex
      case ans1='Y'.and.ans2='N'
	 use temp
	 copy to temp1 for dtoc(onudate)>=date1.and.dtoc(onudate)<=date2
	 use temp1
	 index on dtno+dtos(onudate)+omno to temp1
	 reindex
      case ans1='N'.and.ans2='Y'
	 use temp
	 copy to temp2 for omno=omno1
	 use temp2
	 index on dtno+dtos(onudate)+omno to temp2
	 reindex
      case ans1='Y'.and.ans2='Y'
	 use temp
	 copy to temp3 for dtoc(onudate)>=date1.and.dtoc(onudate)<=date2.and.omno=omno1
	 use temp3
	 index on dtno+dtos(onudate)+omno to temp3
	 reindex
   endcase
   k=2
   page=1
   @  0,72 say ltrim(trim(str(reccount())))
   do while .t.
      @  1,72 say ltrim(trim(str(page)))
      if eof()
	 @ 23,0  say '--------------------------------------------------------------------------------'
	 exit
      endif
      k=k+1
      if k=23
	 @ 23,0  say '--------------------------------------------------------------------------------'
	 i=0
	 do while i=0
	    i=inkey()
	 enddo
	 page=page+1
	 k=3
	 @  4,0  clear
      endif
      @  k,0  say onidcode
      @  k,5  say dtno
      @  k,12 say ondate
      @  k,17 say omno
      @  k,22 say onudate
      @  k,31 say ontrqty
      @  k,36 say eppty
      @  k,41 say trxndate
      skip
   enddo
   i=0
   do while i=0
      i=inkey()
   enddo
   store space(1) to ans1,ans2
   imct1=space(8)
enddo
set talk on
