* Program..: �����d��
* Filename.: PROM0002.prg
* Auther...: Yun aw
* Date.....: 03/15/1992
* Version..: Clipper + ET 3.0
set wrap on
set talk off
set date ansi

*�z�w�w�w�w�{
*�x�]�w�ܼƢx
*�|�w�w�w�w�}
menu00='0.��    ��'
menu01='1.�@ �� �s'
menu02='2.�� �� ��'
menu03='3.�� �� ��'
menu04='4.������s'
menu05='5.�e �@ �s'
menu06='6.�e �G �s'
menu07='�v �� �s'
menu08='�� �L �s'
menu09='�� �M �s'
menu10='�ϸ˥ҳs'
menu11='�q �H ��'
menu12='�u �L ��'
menu13='�@�C�@��'
menu14='�@�C�G��'
menu15='�@�C�T��'
menu16='�|�T�T��'
menu17='�|�T�|��'
menu18='�|�T����'
menu19='�|�T����'
menu20='�O �� ��'
menu21='�� �B ��'
menu22='��    ��'
menu23='�i    ��'
menu24='�L    ��'
menu25='�u    �L'
menu26='�q    �H'
menu27='��    ��'
store 0 to i
store 1 to choice,choice1
store space(1) to ans,pr
store space(2) to d_eppty
store space(3) to d_onidcode
store space(4) to d_orno,d_omno,d_ontrqty
store space(6) to d_dtno

*�z�w�w�w�w�{
*�x�D�{���Ϣx
*�|�w�w�w�w�}
do while choice<>7
   @  0,0  clear
   @  0,0  say '�z�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{'
   @  1,0  say '�x                                                                            �x'
   @  2,0  say '�|�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}'
   @  1,2  prompt menu01
   @  1,13 prompt menu02
   @  1,24 prompt menu03
   @  1,35 prompt menu04
   @  1,46 prompt menu05
   @  1,57 prompt menu06
   @  1,68 prompt menu00
   menu to choice
   save screen
   do case
      case choice=1
	 do demo01
      case choice=2
	 do demo02
      case choice=3
	 do demo03
      case choice=4
	 do demo04
      case choice=5
	 d_dtno='GA'
      case choice=6
	 d_dtno='GB'
   endcase
   do demo06
   sele a
   use d:\army\omtran
   copy to temp for d_dtno=dtno.and.dtoc(onudate)<=date2.and.dtoc(onudate)>=date1
   use temp
   copy to temp6 for substr(onidcode,1,2)='C6'
   copy to temp7 for substr(onidcode,1,2)='C7'
   sele c
   use temp7
   index on imctlno+orno+omno to temp7
   sele b
   use temp6
   index on imctlno+orno+omno to temp6
   sele a
   use d:\army\item
   set index to d:\army\item.ntx
   set relation to imctlno into b,to imctlno into c
   do while .t.
      if eof()
	 exit
      endif
      d_imct=imctlno
      d_imct6=b->imctlno
      do while d_imct6=d_imct
	 if eof()
	    exit
	 endif
	 do while .t
	 if imtype=nu1.or.imtype=nu2.or.imtype=nu3
	    d_qty6=b->ontrqty
	    d_qty7=c->ontrqty
	    if d_qty6<>

      enddo

enddo
use
close all

* �z�w�w�w�w�{
* �x�Ƶ{���Ϣx
* �|�w�w�w�w�}
procedure sub1
   @ 20,1  clear
   @ 21,1  say '�Ы�����@���~��'
   i=0
   do while i=0
      i=inkey()
   enddo
return

procedure sub2
   do while .t.
      ans=space(1)
      @ 21,0  clear
      @ 21,1  say '��J�O�_���T (Y/N)�G'get ans
      read
      ans=ltrim(trim(upper(ans)))
      if ans='Y'.or.ans='N'
	 exit
      endif
   enddo
return

procedure sub3
   ans=space(1)
   do while ans<>'Y'
      @ 20,0  clear
      @ 20,1  say '�п�J��U�d�߰_�l����G'get date1
      @ 21,1  say '�ХH  �~�D��D��  ���覡��J'
      read
      do sub2
   enddo
   date2=str(year(date1)+1)+'.'+str(year(date1))+
return

procedure sub4
   do while .t.
      @ 21,1  say'�O�_�ҰʦL���� (Y/N)�G'get pr
      read
      pr=ltrim(trim(upper(pr)))
      if pr='Y'.or.pr='N'
	 exit
      endif
   enddo
return

procedure demo01
   do while .t.
      @  3,0  say '�z�w�w�w�w�{'
      @  4,0  say '�x        �x'
      @  5,0  say '�x        �x'
      @  6,0  say '�x        �x'
      @  7,0  say '�|�w�w�w�w�}'
      @  4,2  prompt menu13
      @  5,2  prompt menu14
      @  6,2  prompt menu15
      menu to screen
      save screen
      do case
	 case choice1=1
	   d_dtno='BB'
	   exit
	 case choice1=2
	   d_dtno='BC'
	   exit
	 case choice1=3
	   d_dtno='BD'
	   exit
      endcase
   restore screen
   enddo
return

procedure demo02
   do while .t.
      @  3,12 say '�z�w�w�w�w�{'
      @  4,12 say '�x        �x'
      @  5,12 say '�x        �x'
      @  6,12 say '�x        �x'
      @  7,12 say '�x        �x'
      @  8,12 say '�|�w�w�w�w�}'
      @  4,14 prompt menu16
      @  5,14 prompt menu17
      @  6,14 prompt menu18
      @  7,14 prompt menu19
      menu to screen
      save screen
      do case
	 case choice1=1
	   d_dtno='EC'
	   exit
	 case choice1=2
	   d_dtno='ED'
	   exit
	 case choice1=3
	   d_dtno='EE'
	   exit
	 case choice1=4
	   d_dtno='EF'
	   exit
      endcase
   restore screen
   enddo
return

procedure demo03
   do while .t.
      @  3,23 say '�z�w�w�w�w�{'
      @  4,23 say '�x        �x'
      @  5,23 say '�x        �x'
      @  6,23 say '�|�w�w�w�w�}'
      @  4,25 prompt menu20
      @  5,25 prompt menu21
      menu to screen
      save screen
      do case
	 case choice1=1
	   d_dtno='FB'
	   exit
	 case choice1=2
	   d_dtno='FC'
	   exit
      endcase
   restore screen
   enddo
return

procedure demo04
   do while .t.
      @  3,34 say '�z�w�w�w�w�{'
      @  4,34 say '�x        �x'
      @  5,34 say '�x        �x'
      @  6,34 say '�x        �x'
      @  7,34 say '�x        �x'
      @  8,34 say '�x        �x'
      @  9,34 say '�x        �x'
      @ 10,34 say '�|�w�w�w�w�}'
      @  4,36 prompt menu07
      @  5,36 prompt menu08
      @  6,36 prompt menu09
      @  7,36 prompt menu10
      @  8,36 prompt menu11
      @  9,36 prompt menu12
      menu to screen
      save screen
      do case
	 case choice1=1
	   d_dtno='AA'
	   exit
	 case choice1=2
	   d_dtno='AB'
	   exit
	 case choice1=3
	   d_dtno='AD'
	   exit
	 case choice1=4
	   d_dtno='AE'
	   exit
	 case choice1=5
	   d_dtno='AF'
	   exit
	 case choice1=6
	   d_dtno='AG'
	   exit
      endcase
   restore screen
   enddo
return


procedure demo05
   do while .t.
      @ 12,32 say '�z�w�w�w�w�{'
      @ 12,32 say '�x        �x'
      @ 12,32 say '�x        �x'
      @ 12,32 say '�x        �x'
      @ 12,32 say '�x        �x'
      @ 12,32 say '�x        �x'
      @ 12,32 say '�x        �x'
      @ 12,32 say '�|�w�w�w�w�}'
      @ 12,34 prompt menu22
      @ 12,34 prompt menu23
      @ 12,34 prompt menu24
      @ 12,34 prompt menu25
      @ 12,34 prompt menu26
      @ 12,34 prompt menu27
      menu to screen
      do case
	 case choice1=1
	    nu1='41'
	    nu2='46'
	    nu3='00'
	    exit
	 case choice1=2
	    nu1='47'
	    nu2='49'
	    nu3='00'
	    exit
	 case choice1=3
	    nu1='48'
	    nu2='00'
	    nu3='00'
	    exit
	 case choice1=4
	    nu1='22'
	    nu2='24'
	    nu3='73'
	    exit
	 case choice1=5
	    nu1='62'
	    nu2='91'
	    nu3='00'
	    exit
	 case choice1=6
	    nu1='12'
	    nu2='00'
	    nu3='00'
	    exit
      endcase
   enddo
return

procedure demo06
   @ 21,1  clear
   @ 21,1  say '��ƳB�z���еy��....'
return
