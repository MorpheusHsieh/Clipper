* Program : Add record to fix.dbf
* Filename: AFIX.PRG
* Auther  : Avatar
* Date    : 08/19/1995

*
* set environment
*
set wrap on
set date ansi
set scoreboard off

sele e
   if .not.file("\temp\data.dbf")
      do cdata
   else
      use \temp\data.dbf
   endif
   index on dtno to \temp\data2.ntx
sele b
   if .not.file("\temp\guest.dbf")
      do cguest
   else
      use \temp\guest.dbf
   endif
   index on mcno to \temp\guest2.ntx
sele a
   if .not.file("\temp\fix.dbf")
      do cfix
   else
      use \temp\fix.dbf
   endif
   index on mcno+dtoc(ondate)+dtno to \temp\fix154.ntx
   if reccount()!=0
      set relation to dtno into e, mcno into b
   endif

****************
* main program *
****************
do while .t.
   @ cow+00,07 say "���װO���D��"
   @ cow+01,07 say "�z�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�{"
   @ cow+02,07 say "�x�����G          �x�e�פ���G          �x���@����G          �x"
   @ cow+03,07 say "�u�w�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�q�w�w�w�w�w�w�w�w�w�w�t"
   @ cow+04,07 say "�x���D�G          �x�q�ܡG(  )          �x�X�t����G          �x"
   @ cow+05,07 say "�u�w�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�t"
   @ cow+06,07 say "�x�e�׭�]�G                                                  �x"
   @ cow+07,07 say "�u�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t"
   @ cow+08,07 say "�x�Ƹ��G                        �x�u�O���X�G                  �x"
   @ cow+09,07 say "�u�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t"
   @ cow+10,07 say "�x�~�W�G                                                      �x"
   @ cow+11,07 say "�u�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�t"
   @ cow+12,07 say "�x����G            �x�ƶq�G            �x�`���G              �x"
   @ cow+13,07 say "�u�w�w�w�w�w�s�w�w�w�r�w�s�w�w�w�w�w�s�w�r�w�w�w�s�w�w�w�w�w�w�t"
   @ cow+14,07 say "�x�ӽСG    �x�����G    �x���o�G    �x�ݦ��G    �x�{���ơG    �x"
   @ cow+15,07 say "�|�w�w�w�w�w�r�w�w�w�w�w�r�w�w�w�w�w�r�w�w�w�w�w�r�w�w�w�w�w�w�}"

   d_mcno=space(7)
   do while d_mcno==space(7)
      @ cow+02,15 get d_mcno
      read
   enddo
   sele b
   if reccount()=0
      @ 21,00 clear
      @ 21,00 say '�o�O�Ū���Ʈw�A�Х��إ߫Ȥ���...'
      ? chr(7)
      inkey(0)
      @ 21,00 clear
      save screen
      scroll(04,00,24,79)
      active:=1
      do aguest
      active:=0
      g_active:=1
      restore screen
      @ cow+04,15 say d_master
      @ cow+04,34 say d_harea
      @ cow+04,38 say d_htel
      @ cow+04,60 say d_sdate
   else
      go top
      seek d_mcno
      if eof()
         @ 22,00 clear
         @ 22,00 say '���إߦ�������������ơA�n�إ߶� (Y/N): '
         ans:=space(1)
         do while .not. ans$"YyNn"
            ans=space(1)
            @ 22,40 get ans
            read
         enddo ans
         if ans="Y".or.ans="y"
            save screen
            scroll(04,00,24,79,0)
            active:=1
            do aguest
            active:=0
            restore screen
         else
            @ 21,00 clear
            @ 21,00 say '�O�A���n���@! �H�ᤣ�n�ǧ�...'
            ? chr(7)
            inkey(0)
            @ cow+04,15 say '����' color "R+/B"
         endif
      else
         @ cow+04,15 say master
         @ cow+04,34 say harea
         @ cow+04,38 say htel
         @ cow+04,60 say sdate
      endif
   endif
   sele a
   @ cow+02,37 get d_ondate
   read
   go top
   seek d_mcno
   if found()
      do while (d_mcno=mcno)
         if (d_ondate=ondate)
            @ cow+06,19 say break
            @ cow+08,15 say dtno
            @ cow+08,51 say ctno
            @ cow+10,15 say e->dtname
            @ cow+12,15 say e->scost
            @ cow+12,35 say fxqty
            @ cow+12,55 say e->scost*fxqty
            @ 21,00 clear
            @ 21,00 say '������@���~����ܨ�L�����O��...'
            inkey(0)
            skip
         else
            do keyfix
         endif
      enddo
      @ 21,00 clear
      @ 21,00 say '�O�_�W�[�������@�O�� (Y/N): '
      ans:=space(1)
      do while .not. ans$"YyNn"
         ans=space(1)
         @ 21,28 get ans
         read
      enddo ans
      if ans="Y".or.ans="y"
         do keyfix
      else
         exit
      endif
   else
      do keyfix
   endif
   @ 21,00 clear
   @ 21,00 say '�O�_�n�~���J���װO�� (Y/N): '
   ans=space(1)
   do while .not. ans$"YyNn"
      ans=space(1)
      @ 21,30 get ans
      read
   enddo ans
   if ans="N".or.ans="n"
      reindex
      return
   endif
enddo

*
* Sub program
*
procedure keyfix
   d_fxqty:=0
   store space(50) to d_break

   outstd(chr(27),"I3;")
   @ cow+06,19 get d_break
   read
   outstd(chr(27),"IN;")
   @ cow+08,15 get d_dtno
   read
   sele e
   go top
   seek d_dtno
   if found()
      @ cow+10,15 say dtname
      @ cow+12,15 say scost
      d_scost:=scost
   else
      @ 21,00 clear
      @ 21,00 say '�S�����Ƹ����s��A�Ш�s����D�ɫإ߸��...'
      ? chr(7)
      inkey(0)
      @ 21,00 clear
      save screen
      scroll(04,00,24,79,0)
      active:=1
      do adata
      active:=0
      restore screen
      @ cow+10,15 say dtname
      @ cow+12,15 say scost
      d_scost:=scost
   endif
   sele a
   @ cow+08,51 get d_ctno
   @ cow+12,35 get d_fxqty
   read
   d_sum:=d_scost * d_fxqty
   @ cow+12,55 say d_sum
   @ 21,00 clear
   @ 21,00 say "��J�O�_���T (Y/N): "
   ans=space(1)
   do while .not. ans$"YyNn"
      ans=space(1)
      @ 21,20 get ans
      read
   enddo ans
   if ans="Y".or.ans="y"
      go bott
      append blank
      replace mcno with d_mcno, ctno with d_ctno, dtno with d_dtno
      replace break with d_break, ondate with d_ondate, fxdate with d_fxdate
      replace fxqty with d_fxqty
      index on mcno+dtoc(ondate)+dtno to \temp\fix154.ntx
   else
      @ 21,00 clear
      @ 21,00 say '��ƿ��~�A���n��...'
      ? chr(7)
   endif
return