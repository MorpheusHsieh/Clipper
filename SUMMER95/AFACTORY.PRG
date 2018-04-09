* Program : Add record to factory.dbf
* Filename: AFACTORY.PRG
* Auther  : Avatar
* Date    : 08/19/1995

*
* set environment
*
set wrap on
set date ansi
set scoreboard off

sele d
   if .not.file("\temp\factory.dbf")
      do cfactory
   else
      use \temp\factory.dbf
   endif
   index on fcno to \temp\fctory1.ntx


****************
* main program *
****************
do while .t.
   @ cow+00,07 say "廠商主檔"
   @ cow+01,07 say "┌──────────────┬───────────────┐"
   @ cow+02,07 say "│廠商代號：                  │日    期：                    │"
   @ cow+03,07 say "├──────────────┴───────────────┤"
   @ cow+04,07 say "│廠商名稱：                                                  │"
   @ cow+05,07 say "├──────────┬───────────────────┤"
   @ cow+06,07 say "│聯 絡 人：          │電話：(  )                            │"
   @ cow+07,07 say "├──────────┴───────────────────┤"
   @ cow+08,07 say "│公司住址：                                                  │"
   @ cow+09,07 say "└──────────────────────────────┘"

   d_fcno=space(6)
   do while d_fcno==space(6)
      @ cow+02,19 get d_fcno
      read
   enddo
   if reccount()=0
      do keyfc
   else
      go top
      seek d_fcno
      if found()
         do refc
      else
         do keyfc
      endif
   endif
   @ 21,00 clear
   @ 21,00 say '是否要繼續建立廠商資料 (Y/N): '
   ans:=space(1)
   do while .not. ans$"YyNn"
      ans=space(1)
      @ 21,30 get ans
      read
   enddo ans
   if ans="N".or.ans="n"
      index on fcno to \temp\fctory1.ntx
      return
   endif
enddo


*
* Sub program
*
procedure refc
   @ cow+02,49 say ondate
   @ cow+04,19 say fcname
   @ cow+06,19 say fconet
   @ cow+06,38 say fcarea
   @ cow+06,42 say fctel
   @ cow+08,19 say fcadr
   @ 21,00 clear
   @ 21,00 say '資料重複，按任何一鍵繼續...'
   ? chr(7)
   inkey(0)
return


procedure keyfc
   store space(2) to d_fcarea
   store space(8) to d_fconet
   store space(24) to d_fctel
   store space(50) to d_fcname, d_fcadr

   @ cow+02,49 get d_ondate
   read
   outstd(chr(27),"I3;")
   @ cow+04,19 get d_fcname
   @ cow+06,19 get d_fconet
   read
   outstd(chr(27),"IN;")
   @ cow+06,38 get d_fcarea
   @ cow+06,42 get d_fctel
   read
   outstd(chr(27),"I3;")
   @ cow+08,19 get d_fcadr
   read
   outstd(chr(27),"IN;")
   @ 21,00 clear
   @ 21,00 say "輸入是否正確 (Y/N): "
   do while .not. ans$"YyNn"
      ans=space(1)
      @ 21,20 get ans
      read
   enddo ans
   if ans="Y".or.ans="y"
      go bott
      append blank
      replace fcno with d_fcno, fcname with d_fcname, fcarea with d_fcarea
      replace fctel with d_fctel, fcadr with d_fcadr, ondate with d_ondate
      replace fconet with d_fconet
      reindex
   else
      @ 21,00 clear
      @ 21,00 say '資料錯誤，不登錄...'
      ? chr(7)
      inkey(0)
   endif
return
