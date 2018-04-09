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
   @ cow+00,07 say "維修記錄主檔"
   @ cow+01,07 say "┌────────┬──────────┬──────────┐"
   @ cow+02,07 say "│車號：          │送修日期：          │修護日期：          │"
   @ cow+03,07 say "├────────┼──────────┼──────────┤"
   @ cow+04,07 say "│車主：          │電話：(  )          │出廠日期：          │"
   @ cow+05,07 say "├────────┴──────────┴──────────┤"
   @ cow+06,07 say "│送修原因：                                                  │"
   @ cow+07,07 say "├───────────────┬──────────────┤"
   @ cow+08,07 say "│料號：                        │工令號碼：                  │"
   @ cow+09,07 say "├───────────────┴──────────────┤"
   @ cow+10,07 say "│品名：                                                      │"
   @ cow+11,07 say "├─────────┬─────────┬──────────┤"
   @ cow+12,07 say "│單價：            │數量：            │總價：              │"
   @ cow+13,07 say "├─────┬───┴─┬─────┬─┴───┬──────┤"
   @ cow+14,07 say "│申請：    │欠撥：    │撥發：    │待收：    │現有數：    │"
   @ cow+15,07 say "└─────┴─────┴─────┴─────┴──────┘"

   d_mcno=space(7)
   do while d_mcno==space(7)
      @ cow+02,15 get d_mcno
      read
   enddo
   sele b
   if reccount()=0
      @ 21,00 clear
      @ 21,00 say '這是空的資料庫，請先建立客戶資料...'
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
         @ 22,00 say '未建立此車號之相關資料，要建立嗎 (Y/N): '
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
            @ 21,00 say '是你不要的哦! 以後不要怪我...'
            ? chr(7)
            inkey(0)
            @ cow+04,15 say '不詳' color "R+/B"
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
            @ 21,00 say '按任何一鍵繼續顯示其他相關記錄...'
            inkey(0)
            skip
         else
            do keyfix
         endif
      enddo
      @ 21,00 clear
      @ 21,00 say '是否增加相關修護記錄 (Y/N): '
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
   @ 21,00 say '是否要繼續輸入維修記錄 (Y/N): '
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
      @ 21,00 say '沒有此料號之零件，請到零附件主檔建立資料...'
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
      replace mcno with d_mcno, ctno with d_ctno, dtno with d_dtno
      replace break with d_break, ondate with d_ondate, fxdate with d_fxdate
      replace fxqty with d_fxqty
      index on mcno+dtoc(ondate)+dtno to \temp\fix154.ntx
   else
      @ 21,00 clear
      @ 21,00 say '資料錯誤，不登錄...'
      ? chr(7)
   endif
return
