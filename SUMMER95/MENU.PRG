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
menu000="0.結    束"
menu100="1.資料登錄"
menu200="2.刪    除"
menu300="3.查    詢"
menu400="4.列    印"
menu500="5.系統維護"
menu101="主件主檔"
menu102="廠商主檔"
menu103="零附件主檔"
menu104="維修記錄主檔"
menu105="客戶資料主檔"
menu301="依顧客名字"
menu302="依車號"
menu303="依零件料號"
menu401="客戶收帳明細"
menu402="客戶收帳總表"
menu403="廠商收帳明細"
menu404="廠商收帳總表"
menu405="每日報表"
menu406="每月報表"
menu407="零件盤點"
menu408="銷貨明細"
menu409="進貨明細"
menu501="資料備分"

*
* Main pprogram
*
cls
@ 00,00 say "┌──────────────────────────────────────┐"
@ 01,00 say "│東輪機車行資訊作業程式                                      程式設計: Avatar│"
@ 02,00 say "└──────────────────────────────────────┘"
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
         @ 04,00 say "┌──────┐"
         @ 05,00 say "│            │"
         @ 06,00 say "│            │"
         @ 07,00 say "│            │"
         @ 08,00 say "│            │"
         @ 09,00 say "│            │"
         @ 10,00 say "└──────┘"
         @ 05,02 prompt menu101
         @ 06,02 prompt menu102
         @ 07,02 prompt menu103
         @ 08,02 prompt menu104
         @ 09,02 prompt menu105
      case mitem=2
         scroll(04,14,07,28,0)
         @ 04,14 say "┌──────┐"
         @ 05,14 say "│            │"
         @ 06,14 say "│            │"
         @ 07,14 say "│            │"
         @ 08,14 say "│            │"
         @ 09,14 say "│            │"
         @ 10,14 say "└──────┘"
         @ 05,16 prompt menu101
         @ 06,16 prompt menu102
         @ 07,16 prompt menu103
         @ 08,16 prompt menu104
         @ 09,16 prompt menu105
      case mitem=3
         scroll(04,28,08,40,0)
         @ 04,28 say "┌─────┐"
         @ 05,28 say "│          │"
         @ 06,28 say "│          │"
         @ 07,28 say "│          │"
         @ 08,28 say "└─────┘"
         @ 05,30 prompt menu301
         @ 06,30 prompt menu302
         @ 07,30 prompt menu303
      case mitem=4
         scroll(04,42,14,56,0)
         @ 04,42 say "┌──────┐"
         @ 05,42 say "│            │"
         @ 06,42 say "│            │"
         @ 07,42 say "│            │"
         @ 08,42 say "│            │"
         @ 09,42 say "│            │"
         @ 10,42 say "│            │"
         @ 11,42 say "│            │"
         @ 12,42 say "│            │"
         @ 13,42 say "│            │"
         @ 14,42 say "└──────┘"
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
         @ 04,56 say "┌────┐"
         @ 05,56 say "│        │"
         @ 06,56 say "└────┘"
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
