* Program : Add record to item.dbf
* Filename: AITEM.PRG
* Auther  : Avatar
* Date    : 08/19/1995

*
* set environment
*
set wrap on
set date ansi
set scoreboard off

sele c
   if .not.file("\temp\item.dbf")
      do citem
   else
      use \temp\item.dbf
   endif
   index on imno to \temp\item1.ntx


****************
* main program *
****************
do while .t.
   @ cow+00,07 say "主件主檔"
   @ cow+01,07 say "┌─────────────┬────────────────┐"
   @ cow+02,07 say "│主件代號：                │廠商代號：                      │"
   @ cow+03,07 say "├─────────────┴────────────────┤"
   @ cow+04,07 say "│名稱：                                                      │"
   @ cow+05,07 say "├──────────┬──────────┬────────┤"
   @ cow+06,07 say "│報價：              │售價：              │日期：          │"
   @ cow+07,07 say "└──────────┴──────────┴────────┘"

   d_imno=space(6)
   do while d_imno==space(6)
      @ cow+02,19 get d_imno
      read
   enddo
   if reccount()=0
      do keyitem
   else
      go top
      seek d_imno
      if found()
         do reitem
      else
         do keyitem
      endif
   endif
   @ 21,00 clear
   @ 21,00 say '是否要繼續建立主件記錄 (Y/N): '
   ans:=space(1)
   do while .not. ans$"YyNn"
      ans=space(1)
      @ 21,30 get ans
      read
   enddo ans
   if ans="N".or.ans="n"
      index on imno to \temp\item1.ntx
      return
   endif
enddo


*
* Sub program
*
procedure reitem
   @ cow+02,47 say fcno
   @ cow+04,15 say imname
   @ cow+06,15 say str(fcost)
   @ cow+06,38 say str(scost)
   @ cow+06,60 say ondate
   @ 21,00 clear
   @ 21,00 say '資料重複，按任何一鍵繼續...'
   ? chr(7)
   inkey(0)
return


procedure keyitem
   d_fcost=0
   d_scost=0
   store space(6) to d_fcno
   store space(50) to d_imname

   @ cow+02,47 get d_fcno
   read
   outstd(chr(27),"I3;")
   @ cow+04,15 get d_imname
   read
   outstd(chr(27),"IN;")
   @ cow+06,15 get d_fcost range 0,999999
   @ cow+06,38 get d_scost range 0,999999
   @ cow+06,60 get d_ondate
   read
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
      replace imno with d_imno, imname with d_imname, fcno with d_fcno
      replace fcost with d_fcost, scost with d_scost, ondate with d_ondate
      reindex
   else
      @ 21,00 clear
      @ 21,00 say '資料錯誤，不登錄...'
      ? chr(7)
      inkey(0)
   endif
return
