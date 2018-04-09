* Program : Add record to guest
* Filename: AGUEST.PRG
* Auther  : Avatar
* Date    : 08/18/1995

*
* set environment
*
set wrap on
set date ansi
set scoreboard off

sele a
   if .not.file("\temp\guest.dbf")
      do cguest
   endif
   if file("\temp\guest3.ntx")
      use guest index guest3
   endif

*
* set variable
*
d_sdate:=ctod("  /  /  ")
store space(1) to ans
store space(2) to d_harea, d_warea
store space(7) to d_mcno
store space(8) to d_imno, d_master, d_name2, d_htel
store space(10) to d_egno, d_idno
store space(13) to d_bbcall
store space(16) to d_wtel
store space(50) to d_hadr, d_wadr


****************
* main program *
****************
do while .t.
   cow=6
   @ cow+01,07 say "┌────────┬──────────┬──────────┐"
   @ cow+02,07 say "│車型：          │車牌號碼：          │引擎號碼：          │"
   @ cow+03,07 say "├────────┼──────────┼──────────┤"
   @ cow+04,07 say "│姓名：          │駕照號碼：          │共同使用人：        │"
   @ cow+05,07 say "├────────┴────┬─────┴──────────┤"
   @ cow+06,07 say "│住宅電話：(  )            │公司電話：(  )                  │"
   @ cow+07,07 say "├─────────────┴────────────────┤"
   @ cow+08,07 say "│住宅住址：                                                  │"
   @ cow+09,07 say "├──────────────────────────────┤"
   @ cow+10,07 say "│公司住址：                                                  │"
   @ cow+11,07 say "├───────────────┬──────────────┤"
   @ cow+12,07 say "│日    期：                    │B.B.CALL：                  │"
   @ cow+13,07 say "└───────────────┴──────────────┘"

   d_master=space(8)
   outstd(chr(27),"I3;")
   do while d_master==space(8)
      @ cow+04,15 get d_master
      read
   enddo
   outstd(chr(27),"IN;")
   if reccount()=0
      do keydata
   else
      go top
      seek d_master
      if found()
         do repeat
      else
         do keydata
      endif
   endif
   @ 21,00 clear
   @ 21,00 say '是否要繼續輸入客戶資料 (Y/N): '
   ans=space(1)
   do while .not. ans$"YyNn"
      ans=space(1)
      @ 21,30 get ans
      read
   enddo ans
   if ans="N".or.ans="n"
      index on master to \temp\guest3.ntx
      return
   endif
enddo


*
* Sub program
*
procedure repeat
   @ cow+02,15 say imno
   @ cow+02,38 say mcno
   @ cow+02,59 say egno
   @ cow+04,15 say master
   @ cow+04,37 say idno
   @ cow+04,61 say name2
   @ cow+06,20 say harea
   @ cow+06,24 say htel
   @ cow+06,48 say warea
   @ cow+06,52 say wtel
   @ cow+08,19 say hadr
   @ cow+10,19 say wadr
   @ cow+12,19 say sdate
   @ cow+12,51 say bbcall
   @ 21,00 clear
   @ 21,00 say '資料重複，按任何一鍵繼續...'
   ? chr(7)
   inkey(0)
return


procedure keydata
   d_sdate:=ctod("  /  /  ")
   store space(2) to d_harea, d_warea
   store space(7) to d_mcno
   store space(8) to d_imno, d_master, d_name2, d_htel
   store space(10) to d_egno, d_idno
   store space(13) to d_bbcall
   store space(16) to d_wtel
   store space(50) to d_hadr, d_wadr
   @ cow+02,15 get d_imno
   @ cow+02,38 get d_mcno
   @ cow+02,59 get d_egno
   @ cow+04,37 get d_idno
   read
   outstd(chr(27),"Ic;")
   @ cow+04,61 get d_name2
   read
   outstd(chr(27),"Ic;")
   @ cow+06,20 get d_harea
   @ cow+06,24 get d_htel
   @ cow+06,48 get d_warea
   @ cow+06,52 get d_wtel
   read
   outstd(chr(27),"Ic;")
   @ cow+08,19 get d_hadr
   @ cow+10,19 get d_wadr
   read
   outstd(chr(27),"Ic;")
   @ cow+12,19 get d_sdate
   @ cow+12,51 get d_bbcall
   read
   @ 21,00 clear
   @ 21,00 say "輸入是否正確 (Y/N): "
   ans=space(1)
   do while .not. ans$"YyNn"
      ans=space(1)
      @ 21,20 get ans
      read
   enddo ans
   if ans="Y".or.ans="y"
      go bott
      append blank
      replace imno with d_imno, mcno with d_mcno, master with d_master
      replace harea with d_harea,htel with d_htel, hadr with d_hadr
      replace warea with d_warea, wtel with d_wtel, wadr with d_wadr
      replace name2 with d_name2, egno with d_egno, idno with d_idno
      replace sdate with d_sdate, bbcall with d_bbcall
   else
      @ 21,00 clear
      @ 21,00 say '資料錯誤，不登錄...'
      ? chr(7)
   endif
return
