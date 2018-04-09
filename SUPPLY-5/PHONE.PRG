* Program..: 電話號碼管理程式
* Filename.: PHONE.PRG
* Version..: Clipper summmer 87'
* Auther...: Yun am
* Date.....: 1992/08/11

*┌────┐
*│環境設定│
*└────┘
set wrap on
set date ansi
set scoreboard off

*┌────┐
*│變數設定│
*└────┘
menu00='0.結  束'
menu01='1.增  加'
menu02='2.刪  除'
menu03='3.修  改'
menu04='4.查  詢'
menu05='5.列  印'
store 1 to choice

*┌────┐
*│主程式區│
*└────┘
sele a
do while choice<>6
   @  0,0  clear
   @  0,0  say	'┌────────────────────────────────────┐'
   @  1,0  say	'│通訊錄管理程式                                        設計日期：92.08.11│'
   @  2,0  say	'└────────────────────────────────────┘'
   @  3,1  prompt menu01
   @  3,15 prompt menu02
   @  3,29 prompt menu03
   @  3,43 prompt menu04
   @  3,57 prompt menu05
   @  3,61 prompt menu00
   menu to choice
enddo

*┌────┐
*│副程式區│
*└────┘
