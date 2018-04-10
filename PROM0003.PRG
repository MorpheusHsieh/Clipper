* Program..: 列管可修件建檔程式
* Filename.: PROM0003.PRG
* Auther...: Yun aw
* Date.....: 04/13/1992
* Version..: Clipper
set wrap on
set talk off
set date ansi

menu01='0.結      束'
menu02='1.核賠未除帳'
menu03='2.遺失無法繳回'
menu04='3.已繳回未除帳'
menu05='4.基準量無法繳回'
store 0 to d_ontrqty
store 1 to choice
store space(1) to ans
store space(6) to d_dtno
store space(13) to d_imno

*┌────┐
*│主程式區│
*└────┘
use d:\army\prom0003
do while choice<>5
   @  0,0  clear
   @  0,0  say '┌──────────────────────────────────────┐'
   @  1,0  say '│                                                                            │'
   @  2,0  say '└──────────────────────────────────────┘'
   @  1,2  prompt menu02
   @  1,16 prompt menu03
   @  1,32 prompt menu04
   @  1,48 prompt menu05
   @  1,66 prompt menu01
   menu to choice
   save screen
   do case
      case choice=1
	 @  3,0  clear
	 nu='1'
	 do sub3
      case choice=2
	 @  3,0  clear
	 nu='2'
	 do sub3
      case choice=3
	 @  3,0  clear
	 nu='3'
	 do sub3
      case choice=4
	 @  3,0  clear
	 nu='4'
	 do sub3
   endcase
enddo

* ┌────┐
* │副程式區│
* └────┘
procedure sub1
   @ 20,1  clear
   @ 21,1  say '請按任何一鍵繼續'
   i=0
   do while i=0
      i=inkey()
   enddo
return

procedure sub2
   do while .t.
      ans=space(1)
      @ 21,0  clear
      @ 21,1  say '輸入是否正確 (1->Yes / 2->No)：'get ans
      read
      ans=ltrim(trim(upper(ans)))
      if ans='1'.or.ans='2'
	 exit
      endif
   enddo
return

procedure sub3
   do while .t.
      append blank
      replace imno with space(13),ontrqty with 0,num with space(1)
      @  5,5  say '請輸入料號：'get d_imno
      @  6,5  say '請輸入數量：'get d_ontrqty
      @  7,5  say '請輸單位：'get d_dtno
      read
      d_imno=upper(d_imno)
      do sub2
      if ans='1'
	 replace imno with d_imno,ontrqty with d_ontrqty,num with nu,dtno with d_dtno
      else
	 delete record recno()
      endif
      ans=space(1)
      @ 21,0  clear
      @ 21,1  say '是否要繼續輸入 (1->Yes / 2->No)：'get ans
      read
      ans=upper(ans)
      if ans='2'
	 exit
      endif
   enddo
return
