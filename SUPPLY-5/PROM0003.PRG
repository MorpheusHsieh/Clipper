* Program..: �C�ޥi�ץ���ɵ{��
* Filename.: PROM0003.PRG
* Auther...: Yun aw
* Date.....: 04/13/1992
* Version..: Clipper
set wrap on
set talk off
set date ansi

menu01='0.��      ��'
menu02='1.�ֽߥ����b'
menu03='2.�򥢵L�kú�^'
menu04='3.�wú�^�����b'
menu05='4.��Ƕq�L�kú�^'
store 0 to d_ontrqty
store 1 to choice
store space(1) to ans
store space(6) to d_dtno
store space(13) to d_imno

*�z�w�w�w�w�{
*�x�D�{���Ϣx
*�|�w�w�w�w�}
use d:\army\prom0003
do while choice<>5
   @  0,0  clear
   @  0,0  say '�z�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{'
   @  1,0  say '�x                                                                            �x'
   @  2,0  say '�|�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}'
   @  1,2  prompt menu02
   @  1,16 prompt menu03
   @  1,32 prompt menu04
   @  1,48 prompt menu05
   @  1,66 prompt menu01
   menu to choice
   save screen
   do case
      case choice=1
	 @  3,0  clear
	 nu='1'
	 do sub3
      case choice=2
	 @  3,0  clear
	 nu='2'
	 do sub3
      case choice=3
	 @  3,0  clear
	 nu='3'
	 do sub3
      case choice=4
	 @  3,0  clear
	 nu='4'
	 do sub3
   endcase
enddo

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
      @ 21,1  say '��J�O�_���T (1->Yes / 2->No)�G'get ans
      read
      ans=ltrim(trim(upper(ans)))
      if ans='1'.or.ans='2'
	 exit
      endif
   enddo
return

procedure sub3
   do while .t.
      append blank
      replace imno with space(13),ontrqty with 0,num with space(1)
      @  5,5  say '�п�J�Ƹ��G'get d_imno
      @  6,5  say '�п�J�ƶq�G'get d_ontrqty
      @  7,5  say '�п���G'get d_dtno
      read
      d_imno=upper(d_imno)
      do sub2
      if ans='1'
	 replace imno with d_imno,ontrqty with d_ontrqty,num with nu,dtno with d_dtno
      else
	 delete record recno()
      endif
      ans=space(1)
      @ 21,0  clear
      @ 21,1  say '�O�_�n�~���J (1->Yes / 2->No)�G'get ans
      read
      ans=upper(ans)
      if ans='2'
	 exit
      endif
   enddo
return
