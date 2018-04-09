* Program..: 圖書管理程式
* Filename.: LIBRARY.PRG
* Auther...: Yun aw
* Date.....: 06/05/1992
* Version..: Clipper Summer 87
set wrap on
set date ansi

* ┌────┐
* │設定變數│
* └────┘
menu01='0.結    束'
menu02='1.增    加'
menu03='2.修    改'
menu04='3.刪    除'
menu05='4.查    詢'
menu06='5.列    印'
store 1 to choice
store space(1) to pr,ans

* ┌────┐
* │主程式區│
* └────┘
sele a
   if .not.file("library.dbf")
      do sub1
   endif
   if file("library.ntx)

