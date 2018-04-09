* Program : Add record to data.dbf
* Filename: ADATA.PRG
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


****************
* main program *
****************
do while .t.
   @ cow+00,07 say "�s����D��"
   @ cow+01,07 say "�z�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{"
   @ cow+02,07 say "�x�D��N���G            �x�Ƹ��G                              �x"
   @ cow+03,07 say "�u�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t"
   @ cow+04,07 say "�x�~�W�G                                                      �x"
   @ cow+05,07 say "�u�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�t"
   @ cow+06,07 say "�x�t�ӥN���G        �x����G                �x����G          �x"
   @ cow+07,07 say "�|�w�w�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�}"

   if active=0
      d_dtno=space(24)
   else
      @ cow+02,39 say d_dtno
   endif
   do while d_dtno==space(24)
      @ cow+02,39 get d_dtno
      read
   enddo

   if reccount()=0
      do keydata
   else
      go top
      seek d_dtno
      if found()
         do redata
      else
         do keydata
      endif
   endif
   @ 21,00 clear
   @ 21,00 say '�O�_�n�~��إ߹s������ (Y/N): '
   ans:=space(1)
   do while .not. ans$"YyNn"
      ans=space(1)
      @ 21,30 get ans
      read
   enddo ans
   if ans="N".or.ans="n"
      index on dtno to \temp\data2.ntx
      return
   endif
enddo


*
* Sub program
*
procedure redata
   @ cow+02,19 say imno
   @ cow+04,15 say dtname
   @ cow+06,19 say fcno
   @ cow+06,35 say scost
   @ cow+06,59 say ondate
   @ 21,00 clear
   @ 21,00 say '��ƭ��ơA������@���~��...'
   ? chr(7)
   inkey(0)
return


procedure keydata
   d_scost:=0
   store space(6) to d_fcno
   store space(8) to d_imno
   store space(50) to d_dtname

   @ cow+02,19 get d_imno
   read
   outstd(chr(27),"I3;")
   @ cow+04,15 get d_dtname
   read
   outstd(chr(27),"IN;")
   @ cow+06,19 get d_fcno
   @ cow+06,35 get d_scost range 0,999999
   @ cow+06,59 get d_ondate
   read
   @ 21,00 clear
   @ 21,00 say "��J�O�_���T (Y/N): "
   ans:=space(1)
   do while .not. ans$"YyNn"
      ans=space(1)
      @ 21,20 get ans
      read
   enddo ans
   if ans="Y".or.ans="y"
      go bott
      append blank
      replace imno with d_imno, dtname with d_dtname, dtno with d_dtno
      replace fcno with d_fcno, scost with d_scost, ondate with d_ondate
      reindex
   else
      @ 21,00 clear
      @ 21,00 say '��ƿ��~�A���n��...'
      ? chr(7)
      inkey(0)
   endif
return