* Program..: �C�L�C�ޥi�ץ���
* Filename.: PROM03-1.PRG
* Printer..: T24W1Z1L4X8G2
* Auther...: Yun aw
* Date.....: 04/05/1992
* Version..: Clipper
set wrap on
set talk off
set date ansi

menu01='0.��      ��'
menu02='1.�ֽߥ����b'
menu03='2.�򥢵L�kú�^'
menu04='3.�wú�^�����b'
menu05='4.��Ƕq�L�kú�^'
store 0 to r1,r2,re
store 1 to choice
store space(1) to ans,pr,num
store space(4) to d_basum1,d_basum2,d_basum3,d_basum4
store space(6) to basum,d_dtno
store space(8) to d_imup,d_up,d_ontrqty
store space(13) to d_imno,d_imno1
store space(30) to d_imdesp
aw=replicate('�',30)

*�z�w�w�w�w�{
*�x�D�{���Ϣx
*�|�w�w�w�w�}
@  0,0	clear
do while .t.
   @  0,0  clear
   @ 21,1  say '�O�_�ҰʦL���� (Y/N)�G'get pr
   read
   pr=upper(pr)
   if pr='Y'.or.pr='N'
      exit
   endif
enddo
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
	 nu='1'
	 do sub3
	 go top
	 r2=0
	 do while .t.
	    if eof()
	       exit
	    endif
	    do while .t.
	       if pr='Y'
		  text to print
  �C  ��  �i  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �p  ��
�z�w�w�s�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�s�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�s�w�w�w�w�w�w�s�w�w�w�w�w�w�{
�x �� �x���������������x����������   ������������������x�A���D�x�����������������Ƣx���������������x�������������x�������������x
�x�  ��x���������������x�~���������������������������W�x�������u�w�w�w�w�s�w�w�w�w�t�����w��������x�Τ@���ڽs���x�����������Ңx
�x��  �x���������������x�������������������������������x�������x�������q�x�������B�x���������������x�������������x�������������x
�x�����x���������������x�����������    ����������������x������x���������x(��x���)�x���������������x�������������x�������������x
		  endtext
		  set print off
	       else
		  text
  �C  ��  �i  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  �p  ��
�z�w�w�s�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�s�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�s�w�w�w�w�w�w�s�w�w�w�w�w�w�{
�x �� �x���������������x����������   ������������������x�A���D�x�����������������Ƣx���������������x�������������x�������������x
�x�  ��x���������������x�~���������������������������W�x�������u�w�w�w�w�s�w�w�w�w�t�����w��������x�Τ@���ڽs���x�����������Ңx
�x��  �x���������������x�������������������������������x�������x�������q�x�������B�x���������������x�������������x�������������x
�x�����x���������������x�����������    ����������������x������x���������x(��x���)�x���������������x�������������x�������������x
		  endtext
	       endif
	       do while r1<40
		  r1=r1+1
		  r2=r2+1
		  store r2 to re
		  store imno to d_imno
		  store c->imup to d_imup
		  store c->imdesp to d_imdesp
		  store ontrqty to d_ontrqty
		  re=left(ltrim(trim(str(re)))+aw,4)
		  d_imno=left(ltrim(trim(imno))+aw,14)
		  d_ontrqty=right(aw+ltrim(trim(str(d_ontrqty))),8)
		  d_up=left(ltrim(trim(str(ontrqty*c->imup)))+aw,8)
		  if pr='Y'
		     text to print
�u�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�q�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�q�w�w�w�w�w�w�t
�x&re�x&d_imno�x&d_imdesp�x�������x&d_ontrqty�x&d_up�x���������������x�������������x�������������x
		     endtext
		  else
		     text
�u�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�q�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�q�w�w�w�w�w�w�t
�x&re�x&d_imno�x&d_imdesp�x�������x&d_ontrqty�x&d_up�x���������������x�������������x�������������x
		     endtext
		  endif
		  skip
		  if eof()
		     exit
		  endif
	       enddo
	       if pr='Y'
		  text to print
�u�w�w�q�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�r�w�w�w�w�r�w�w�w�w�r�w�w�w�w�w�w�w�r�w�w�w�w�w�w�r�w�w�w�w�w�w�t
�x�����x�����������������������������������������������������������������������������������������������������������������������x
�x��O��x�����������������������������������������������������������������������������������������������������������������������x
�|�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}
		  endtext
	       else
		  text
�u�w�w�q�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�r�w�w�w�w�r�w�w�w�w�r�w�w�w�w�w�w�w�r�w�w�w�w�w�w�r�w�w�w�w�w�w�t
�x�����x�����������������������������������������������������������������������������������������������������������������������x
�x��O��x�����������������������������������������������������������������������������������������������������������������������x
�|�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}
		  endtext
	       endif
	       if pr='Y'
		  set print on
	       else
		  set print off
	       endif
	       ?
	       set print off
	       r1=0
	       exit
	    enddo
	    i=0
	    do while i=0
	       i=inkey()
	    enddo
	 enddo
      case choice=2
	 nu='2'
	 do sub3
	 go top
	 r2=0
	 do while .t.
	    if eof()
	       exit
	    endif
	    do while .t.
	       if pr='Y'
		  text to print
  �C �� �i �� �� �� �� ( �� �� �L �� �] ) �L �k ú �^ �� �� �� �p ��
�z�w�w�s�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�s�w�w�w�w�s�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{
�x�����x���������������x�������������������������������x�A���D�x���������x�p���������������Ȣx���������������������������������x��
�x�����x���������������x�~���������������������������W�x�������x�������q�u�w�w�w�w�s�w�w�w�w�t�� ����������������������������Ңx
�x�����x���������������x�������������������������������x������x���������x�������p�x�`�����p�x���������������������������������x
		  endtext
		  set print off
	       else
		  text
  �C �� �i �� �� �� �� ( �� �� �L �� �] ) �L �k ú �^ �� �� �� �p ��
�z�w�w�s�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�s�w�w�w�w�s�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{
�x�����x���������������x�������������������������������x�A���D�x���������x�p���������������Ȣx���������������������������������x��
�x�����x���������������x�~���������������������������W�x�������x�������q�u�w�w�w�w�s�w�w�w�w�t�� ����������������������������Ңx
�x�����x���������������x�������������������������������x������x���������x�������p�x�`�����p�x���������������������������������x
		  endtext
	       endif
	       do while r1<40
		  r1=r1+1
		  r2=r2+1
		  store r2 to re
		  store imno to d_imno
		  store c->imup to d_imup
		  store c->imdesp to d_imdesp
		  store ontrqty to d_ontrqty
		  re=left(ltrim(trim(str(re)))+aw,4)
		  d_imno=left(ltrim(trim(imno))+aw,14)
		  d_imup=right(aw+ltrim(trim(str(d_imup))),8)
		  d_ontrqty=right(aw+ltrim(trim(str(d_ontrqty))),8)
		  d_up=left(ltrim(trim(str(ontrqty*c->imup)))+aw,8)
		  if pr='Y'
		     text to print
�u�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�q�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
�x&re�x&d_imno�x&d_imdesp�x�������x&d_ontrqty�x&d_imup�x&d_up�x���������������������������������x
		     endtext
		  else
		     text
�u�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�q�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
�x&re�x&d_imno�x&d_imdesp�x�������x&d_ontrqty�x&d_imup�x&d_up�x���������������������������������x
		     endtext
		  endif
		  skip
		  if eof()
		     exit
		  endif
	       enddo
	       if pr='Y'
		  text to print
�u�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�q�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
�x��X��x���������������x�������������������������������x�������x���������x���������x���������x���������������������������������x��
�x��p��x���������������x�������������������������������x�������x���������x���������x���������x���������������������������������x��
�|�w�w�r�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�r�w�w�w�w�r�w�w�w�w�r�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}
		  endtext
	       else
		  text
�u�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�q�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
�x��X��x���������������x�������������������������������x�������x���������x���������x���������x���������������������������������x��
�x��p��x���������������x�������������������������������x�������x���������x���������x���������x���������������������������������x��
�|�w�w�r�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�r�w�w�w�w�r�w�w�w�w�r�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}
		  endtext
	       endif
	       if pr='Y'
		  set print on
	       else
		  set print off
	       endif
	       ?
	       set print off
	       r1=0
	       exit
	    enddo
	    i=0
	    do while i=0
	       i=inkey()
	    enddo
	 enddo
      case choice=3
	 nu='3'
	 do sub3
	 go top
	 r2=0
	 do while .t.
	    if eof()
	       exit
	    endif
	    do while .t.
	       if pr='Y'
		  text to print
  �C  ��  �i  ��  ��  �w  ú  �^  ��  �a  �w  �|  ��  ñ  �h  ��  ��  ��  ��  ��  �p  ��
�z�w�w�s�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�w�s�w�w�w�w�w�w�s�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{
�x�����x���������������x�������������������������������x���������x�������������x���������x�������������������������������������x
�x�����x���������������x�~���������������������������W�x�������q�xú�^�̳渹�X�xú�^����x����������������������������������� �x
�x�����x���������������x�������������������������������x���������x�������������x���������x�������������������������������������x
		  endtext
		  set print off
	       else
		  text
  �C  ��  �i  ��  ��  �w  ú  �^  ��  �a  �w  �|  ��  ñ  �h  ��  ��  ��  ��  ��  �p  ��
�z�w�w�s�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�w�s�w�w�w�w�w�w�s�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{
�x�����x���������������x�������������������������������x���������x�������������x���������x�������������������������������������x
�x�����x���������������x�~���������������������������W�x�������q�xú�^�̳渹�X�xú�^����x����������������������������������� �x
�x�����x���������������x�������������������������������x���������x�������������x���������x�������������������������������������x
		  endtext
	       endif
	       do while r1<40
		  r1=r1+1
		  r2=r2+1
		  store r2 to re
		  store imno to d_imno
		  store c->imup to d_imup
		  store c->imdesp to d_imdesp
		  store ontrqty to d_ontrqty
		  re=left(ltrim(trim(str(re)))+aw,4)
		  d_imno=left(ltrim(trim(imno))+aw,14)
		  d_ontrqty=right(aw+ltrim(trim(str(ontrqty))),8)
		  d_up=right(aw+ltrim(trim(str(val(d_ontrqty)*d_imup))),8)
		  if pr='Y'
		     text to print
�u�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�q�w�w�w�w�q�w�w�w�w�w�w�q�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
�x&re�x&d_imno�x&d_imdesp�x&d_ontrqty�x�������������x���������x�������������������������������������x
		     endtext
		  else
		     text
�u�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�q�w�w�w�w�q�w�w�w�w�w�w�q�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
�x&re�x&d_imno�x&d_imdesp�x&d_ontrqty�x�������������x���������x�������������������������������������x
		     endtext
		  endif
		  skip
		  if eof()
		     exit
		  endif
	       enddo
	       if pr='Y'
		  text to print
�u�w�w�q�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�w�r�w�w�w�w�w�w�r�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
�x��X��x�����������������������������������������������������������������������������������������������������������������������x
�x��p��x�����������������������������������������������������������������������������������������������������������������������x
�|�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}
		  endtext
	       else
		  text
�u�w�w�q�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�w�r�w�w�w�w�w�w�r�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
�x��X��x�����������������������������������������������������������������������������������������������������������������������x
�x��p��x�����������������������������������������������������������������������������������������������������������������������x
�|�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}
		  endtext
	       endif
	       if pr='Y'
		  set print on
	       else
		  set print off
	       endif
	       ?
	       set print off
	       r1=0
	       exit
	    enddo
	    i=0
	    do while i=0
	       i=inkey()
	    enddo
	 enddo
      case choice=4
	 sele c
	 use d:\army\item
	 set index to d:\army\item2.ntx
	 sele b
	 use d:\army\prom03-3
	 index on imno to d:\army\prom03-3
	 set relation to imno into c
	 go top
	 r2=0
	 do while .t.
	    if eof()
	       exit
	    endif
	    do while .t.
	       if pr='Y'
		  text to print
   �C �� �i �� �� �� �� �� �� ( �t �� ) �q �L �k ú �^ �� �� �� �p ��
�z�w�w�s�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�w�s�w�w�w�w�s�w�w�w�{
�x�����x���������������x�������������������������������x�A���D�x���� �� (�t ��) �q �L �k ú �^ �� �x���������x�`    �p�x�������x
�x�����x���������������x�~���������������������������W�x�������u�w�w�s�w�w�s�w�w�w�s�w�w�w�s�w�w�w�t���������x���������x�����Ңx
�x�����x���������������x�������������������������������x�������x�T�Ţx�G�Ţx�������x�u���t�x�X���p�x���@�����x���������x�������x
�x�����x���������������x�������������������������������x������x�����x�����x�洫���x�����Ңx�������x�(����)��x(��  ��)�x�������x
		  endtext
		  set print off
	       else
		  text
   �C �� �i �� �� �� �� �� �� ( �t �� ) �q �L �k ú �^ �� �� �� �p ��
�z�w�w�s�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�w�s�w�w�w�w�s�w�w�w�{
�x�����x���������������x�������������������������������x�A���D�x���� �� (�t ��) �q �L �k ú �^ �� �x���������x�`    �p�x�������x
�x�����x���������������x�~���������������������������W�x�������u�w�w�s�w�w�s�w�w�w�s�w�w�w�s�w�w�w�t���������x���������x�����Ңx
�x�����x���������������x�������������������������������x�������x�T�Ţx�G�Ţx�������x�u���t�x�X���p�x���@�����x���������x�������x
�x�����x���������������x�������������������������������x������x�����x�����x�洫���x�����Ңx�������x�(����)��x(��  ��)�x�������x
		  endtext
	       endif
	       do while r1<30
		  r1=r1+1
		  r2=r2+1
		  store r2 to re
		  store imno to d_imno
		  store c->imup to d_imup
		  store c->imdesp to d_imdesp
		  re=left(ltrim(trim(str(re)))+aw,4)
		  d_imno=left(ltrim(trim(imno))+aw,14)
		  d_imup=right(aw+ltrim(trim(str(d_imup))),8)
		  basum1=right(aw+ltrim(trim(str(basum1))),4)
		  basum2=right(aw+ltrim(trim(str(basum2))),4)
		  basum3=right(aw+ltrim(trim(str(basum3))),6)
		  basum4=right(aw+ltrim(trim(str(basum4))),6)
		  basum=right(aw+ltrim(trim(str(basum))),6)
		  d_up=right(aw+ltrim(trim(str(basum*c->imup))),8)
		  if pr='Y'
		     text to print
�u�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�q�w�w�w�q�w�w�q�w�w�q�w�w�w�q�w�w�w�q�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�t
�x&re�x&d_imno�x&d_imdesp�x�������x&basum1�x&basum2�x&basum3�x&basum4�x&basum�x&d_imup�x&d_up�x�������x
		     endtext
		  else
		     text
�u�w�w�q�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�q�w�w�w�q�w�w�q�w�w�q�w�w�w�q�w�w�w�q�w�w�w�q�w�w�w�w�q�w�w�w�w�q�w�w�w�t
�x&re�x&d_imno�x&d_imdesp�x�������x&basum1�x&basum2�x&basum3�x&basum4�x&basum�x&d_imup�x&d_up�x�������x
		     endtext
		  endif
		  skip
		  if eof()
		     exit
		  endif
	       enddo
	       if pr='Y'
		  text to print
�u�w�w�q�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�r�w�w�r�w�w�r�w�w�w�r�w�w�w�r�w�w�w�r�w�w�w�w�r�w�w�w�w�r�w�w�w�t
�x�����x�����������������������������������������������������������������������������������������������������������������������x�����
�x��O��x�����������������������������������������������������������������������������������������������������������������������x
�|�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}
		  endtext
	       else
		  text
�u�w�w�q�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�r�w�w�r�w�w�r�w�w�w�r�w�w�w�r�w�w�w�r�w�w�w�w�r�w�w�w�w�r�w�w�w�t
�x�����x�����������������������������������������������������������������������������������������������������������������������x�����
�x��O��x�����������������������������������������������������������������������������������������������������������������������x
�|�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}
		  endtext
	       endif
	       if pr='Y'
		  set print on
		  ?
		  ? chr(12)
	       else
		  set print off
		  i=0
		  do while i=0
		     i=inkey()
		  enddo
	       endif
	       set print off
	       r1=0
	       exit
	    enddo
	 enddo
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
   sele a
      use d:\army\prom0003
      copy stru to temp
      copy to temp1 for num=nu
   sele b
      use temp
   sele a
      use temp1
      index on imno to temp1
      go top
      do while .t.
	 if eof()
	    exit
	 endif
	 d_imno=imno
	 d_dtno=dtno
	 d_ontrqty=ontrqty
	 do while .t.
	    skip
	    d_imno1=imno
	    if d_imno=d_imno1
	       d_ontrqty=d_ontrqty+ontrqty
	    endif
	    if d_imno<>d_imno1.or.eof()
	       exit
	    endif
	 enddo
	 sele b
	 append blank
	 replace imno with d_imno,ontrqty with d_ontrqty,dtno with d_dtno
	 sele a
	 skip
      enddo
      sele c
      use d:\army\item
      set index to d:\army\item2.ntx
      sele b
      use temp
      index on imno to temp
      set relation to imno into c
return
