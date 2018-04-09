* Progaam : Pull Down Menu
* Filename: PDMENU.PRG
* Auther  : Avatar
* Date    : 08/18/1995

*
* set environment
*
clear
set wrap on
set scoreboard off
set color to W+/B, R/G, N, N, GR+/B

*
* sset variable
*
cow:=5
d_sum:=0
active:=0
d_fxqty:=0
d_scost:=0
d_fcost:=0
a_active:=0
d_active:=0
f_active:=0
g_active:=0
i_active:=0
d_sdate:=ctod("  /  /  ")
d_ondate:=ctod("  /  /  ")
d_fxdate:=ctod("  /  /  ")
store space(1) to ans
store space(2) to d_fcarea, d_harea, d_warea
store space(6) to d_fcno
store space(7) to d_mcno
store space(8) to d_imno, d_ctno, d_htel
store space(8) to d_master, d_name2, d_fconet
store space(10) to d_egno, d_idno
store space(13) to d_bbcall
store space(16) to d_wtel
store space(24) to d_dtno, d_fctel
store space(50) to d_fcname, d_break
store space(50) to d_hadr, d_wadr, d_fcadr
store space(50) to d_imname, d_dtname


*
* set menutext
*
menu000="0.��    ��"
menu100="1.��Ƶn��"
menu200="2.�R    ��"
menu300="3.�d    ��"
menu400="4.�C    �L"
menu500="5.�t�κ��@"
menu101="�D��D��"
menu102="�t�ӥD��"
menu103="�s����D��"
menu104="���װO���D��"
menu105="�Ȥ��ƥD��"
menu301="���U�ȦW�r"
menu302="�̨���"
menu303="�̹s��Ƹ�"
menu401="�Ȥ᦬�b����"
menu402="�Ȥ᦬�b�`��"
menu403="�t�Ӧ��b����"
menu404="�t�Ӧ��b�`��"
menu405="�C�����"
menu406="�C�����"
menu407="�s��L�I"
menu408="�P�f����"
menu409="�i�f����"
menu501="��ƳƤ�"

*
* Main pprogram
*
cls
@ 00,00 say "�z�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{"
@ 01,00 say "�x�F���������T�@�~�{��                                      �{���]�p: Avatar�x"
@ 02,00 say "�|�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}"
select=0
choice1=1
choice2=1
do while .t.
   @ 03,00 prompt menu100
   @ 03,14 prompt menu200
   @ 03,28 prompt menu300
   @ 03,42 prompt menu400
   @ 03,56 prompt menu500
   @ 03,70 prompt menu000
   set key 04 to rmenu
   set key 19 to lmenu
   menu to choice1
   set key 04 to
   set key 19 to
   if (choice1 ==6)
      close
      quit
   endif
   if (choice1 !=0)
      submenu(choice1)
   endif
   do case
      case choice1=1 .and. choice2=1
         do aitem
         scroll(04,00,24,79,0)
      case choice1=1 .and. choice2=2
         do afactory
         scroll(04,00,24,79,0)
      case choice1=1 .and. choice2=3
         do adata
         scroll(04,00,24,79,0)
      case choice1=1 .and. choice2=4
         do afix
         scroll(04,00,24,79,0)
      case choice1=1 .and. choice2=5
         do aguest
         scroll(04,00,24,79,0)
      case choice1=2 .and. choice2=1
         select=201
         @ 21,0 say select
         exit
      case choice1=2 .and. choice2=2
         select=202
         @ 21,0 say select
         exit
      case choice1=2 .and. choice2=3
         select=203
         @ 21,0 say select
         exit
      case choice1=2 .and. choice2=4
         select=204
         @ 21,0 say select
         exit
      case choice1=2 .and. choice2=5
         select=205
         @ 21,0 say select
         exit
      case choice1=3 .and. choice2=1
         select=301
         @ 21,0 say select
         exit
      case choice1=3 .and. choice2=2
         select=302
         @ 21,0 say select
         exit
      case choice1=3 .and. choice2=3
         select=303
         @ 21,0 say select
         exit
      case choice1=4 .and. choice2=1
         select=401
         @ 21,0 say select
         exit
      case choice1=4 .and. choice2=2
         select=402
         @ 21,0 say select
         exit
      case choice1=4 .and. choice2=3
         select=403
         @ 21,0 say select
         exit
      case choice1=4 .and. choice2=4
         select=101
         @ 21,0 say select
         exit
      case choice1=4 .and. choice2=5
         select=405
         @ 21,0 say select
         exit
      case choice1=4 .and. choice2=6
         select=406
         @ 21,0 say select
         exit
      case choice1=4 .and. choice2=7
         select=407
         @ 21,0 say select
         exit
      case choice1=4 .and. choice2=8
         select=408
         @ 21,0 say select
         exit
      case choice1=4 .and. choice2=9
         select=409
         @ 21,0 say select
         exit
      case choice1=5 .and. choice2=1
         select=501
         @ 21,0 say select
         exit
      case choice1=5 .and. choice2=2
         select=502
   endcase
enddo


************
* Function *
************
function submenu
   parameters mitem
   save screen
   do case
      case mitem=1
         scroll(04,00,07,14,0)
         @ 04,00 say "�z�w�w�w�w�w�w�{"
         @ 05,00 say "�x            �x"
         @ 06,00 say "�x            �x"
         @ 07,00 say "�x            �x"
         @ 08,00 say "�x            �x"
         @ 09,00 say "�x            �x"
         @ 10,00 say "�|�w�w�w�w�w�w�}"
         @ 05,02 prompt menu101
         @ 06,02 prompt menu102
         @ 07,02 prompt menu103
         @ 08,02 prompt menu104
         @ 09,02 prompt menu105
      case mitem=2
         scroll(04,14,07,28,0)
         @ 04,14 say "�z�w�w�w�w�w�w�{"
         @ 05,14 say "�x            �x"
         @ 06,14 say "�x            �x"
         @ 07,14 say "�x            �x"
         @ 08,14 say "�x            �x"
         @ 09,14 say "�x            �x"
         @ 10,14 say "�|�w�w�w�w�w�w�}"
         @ 05,16 prompt menu101
         @ 06,16 prompt menu102
         @ 07,16 prompt menu103
         @ 08,16 prompt menu104
         @ 09,16 prompt menu105
      case mitem=3
         scroll(04,28,08,40,0)
         @ 04,28 say "�z�w�w�w�w�w�{"
         @ 05,28 say "�x          �x"
         @ 06,28 say "�x          �x"
         @ 07,28 say "�x          �x"
         @ 08,28 say "�|�w�w�w�w�w�}"
         @ 05,30 prompt menu301
         @ 06,30 prompt menu302
         @ 07,30 prompt menu303
      case mitem=4
         scroll(04,42,14,56,0)
         @ 04,42 say "�z�w�w�w�w�w�w�{"
         @ 05,42 say "�x            �x"
         @ 06,42 say "�x            �x"
         @ 07,42 say "�x            �x"
         @ 08,42 say "�x            �x"
         @ 09,42 say "�x            �x"
         @ 10,42 say "�x            �x"
         @ 11,42 say "�x            �x"
         @ 12,42 say "�x            �x"
         @ 13,42 say "�x            �x"
         @ 14,42 say "�|�w�w�w�w�w�w�}"
         @ 05,44 prompt menu401
         @ 06,44 prompt menu402
         @ 07,44 prompt menu403
         @ 08,44 prompt menu404
         @ 09,44 prompt menu405
         @ 10,44 prompt menu406
         @ 11,44 prompt menu407
         @ 12,44 prompt menu408
         @ 13,44 prompt menu409
      case mitem=5
         scroll(04,56,06,66,0)
         @ 04,56 say "�z�w�w�w�w�{"
         @ 05,56 say "�x        �x"
         @ 06,56 say "�|�w�w�w�w�}"
         @ 05,58 prompt menu501
   endcase
   set key 19 to larrow
   set key 04 to rarrow
   menu to choice2
   set key 04 to
   set key 19 to
   restore screen
return ""


***************
* sub program *
***************
procedure rmenu
   keyboard chr(24)
return

procedure lmenu
   keyboard chr(5)
return

procedure larrow
   parameters pn,pl,rv
   keyboard chr(27)+chr(5)+chr(13)
return

procedure rarrow
   parameters pn,pl,rv
   keyboard chr(27)+chr(24)+chr(13)
return