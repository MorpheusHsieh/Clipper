*Program..: 資料庫輔助作業程式
*Auther...: Yun aw
*Date.....: 01/14/1992
*Version..: FoxBase + ET Chines System + Clippr
SET TALK OFF
SET SCOREBOARD OFF
STORE SPACE(1) TO I,C,C1,C2
STORE SPACE(8) TO IM1,IM2,DATE1,DATE2
DEMO01='0.結    束'
DEMO02='查    詢'
DEMO03='車    材'
DEMO04='兵    材'
DEMO05='戰    材'
DEMO06='工    材'
DEMO07='通    材'
DEMO08='化    材'
DEMO09='經    理'
DEMO10='管制序號'
DEMO11='單位代號'
DEMO12='工令號碼'
DEMO13='單筆查詢'
DEMO14='多筆查詢'
DEMO15='起始號碼'
DEMO16='終止號碼'
DEMO17='起始日期'
DEMO18='終止日期'
DEMO94='現在程式執行中...'
DEMO95='請輸入要執行的功能：'
DEMO96='料號為零時結束查詢'
DEMO97='請輸入要查詢的        ：'
DEMO98='找不到        為          之資料'
DEMO99='按任何一鍵繼續....'
@  0,0 CLEAR
@  0,0  SAY '┌──────────────────────────────────────┐'
@  1,0  SAY '│陸軍機械化第一Ｏ九師支指部保修營主支連輔助作業程式                          │'
@  2,0  SAY '│程式設計：謝欣宏                                            日期：1992/01/14│'
@  3,0  SAY '╞════════════════════════════╤═════════╡'
@  4,0  SAY '│送修原因： 　　　　　　　　　　　　　　　　　　　　     │目錄：            │'
@  5,0  SAY '├────────┬─────────┬─────────┤                  │'
@  6,0  SAY '│單証識別碼：    │管制序號：        │工令號碼：        │                  │'
@  7,0  SAY '├────────┴───┬─────┴─┬───────┤                  │'
@  8,0  SAY '│料    號：              │憑單日期：    │憑單序號：    │                  │'
@  9,0  SAY '├────────────┴───────┴┬──────┤                  │'
@ 10,0  SAY '│品    名：                                │優先順序：  │                  │'
@ 11,0  SAY '├─────────┬─────────┬─┴──────┤                  │'
@ 12,0  SAY '│單    位：        │單價：            │處理日期：      │                  │'
@ 13,0  SAY '├──────┬──┴──────┬──┴────────┤                  │'
@ 14,0  SAY '│財產類別：  │裝備號碼：        │送修單位代號：        │                  │'
@ 15,0  SAY '├──────┼──────┬──┴───┬───────┤                  │'
@ 16,0  SAY '│申請數：    │欠撥數：    │撥發數：    │待收數：      │                  │'
@ 17,0  SAY '├──────┴──────┴──────┴───────┴─────────┤'
@ 18,0  SAY '│                                                                            │'
@ 19,0  SAY '│                                                                            │'
@ 20,0  SAY '│                                                                            │'
@ 21,0  SAY '└──────────────────────────────────────┘'
I=0
DO WHILE I<10
   I=I+1
   @ 5+I,64 SAY LTRIM(STR(I))
   @ 5+I,65 SAY '.'
ENDDO
@  6,66 SAY DEMO02
@  7,64 SAY DEMO01
@  8,64 TO 15,73 CLEAR
@ 18,2  TO 20,77 CLEAR
@ 18,2  SAY DEMO95
C=0
DO WHILE .NOT.(C=48.OR.C=49)
   C=INKEY()
ENDDO
C=LTRIM(STR(C-48))
@ 18,22 SAY C
DO CASE
   CASE C='1'
      I=0
      DO WHILE I<10
         I=I+1
         @ 5+I,64 SAY LTRIM(STR(I))
         @ 5+I,65 SAY '.'
      ENDDO
      @  6,66 SAY DEMO10
      @  7,66 SAY DEMO11
      @  8,66 SAY DEMO12
      @  9,64 SAY DEMO01
      @ 10,64 TO 15,73 CLEAR
      @ 18,2  TO 20,77 CLEAR
      @ 18,2  SAY DEMO95
      C1=0
      DO WHILE .NOT.(C1=48.OR.C1=49)
         C1=INKEY()
      ENDDO
      C1=LTRIM(STR(C1-48))
      @ 18,2  SAY C1
      DO CASE
         CASE C1='1'
            I=0
            DO WHILE I<10
               I=I+1
               @ 5+I,64 SAY LTRIM(STR(I))
               @ 5+I,65 SAY '.'
            ENDDO
            @  6,66 SAY DEMO13
            @  7,66 SAY DEMO14
            @  8,64 SAY DEMO01
            @  9,64 TO 15,73 CLEAR
            @ 18,2  SAY DEMO95
            C2=0
            DO WHILE .NOT.(C2=48.OR.C2=49)
               C2=INKEY()
            ENDDO
            C2=LTRIM(STR(C2-48))
            @ 18,2  SAY C2
            DO CASE
               CASE C2='1'
                  @ 18,2  TO 20,77 CLEAR
                  @ 18,2  SAY DEMO97
                  @ 18,16 SAY DEMO10
                  @ 18,26 GET IM1
                  @ 19,2  SAY DEMO97
                  @ 19,16 SAY DEMO17
                  @ 19,26 GET DATE1
                  @ 20,2  SAY DEMO97
                  @ 20,16 SAY DEMO18
                  @ 20,26 GET DATE2
                  READ
                  DO PROM01
               CASE C2='2'
                  @ 18,2  TO 20,77 CLEAR
                  @ 18,2  SAY DEMO97
                  @ 18,16 SAY DEMO15
                  @ 18,26 GET IM1
                  @ 18,2  SAY DEM097
                  @ 18,16 SAY DEMO16
                  @ 18,26 GET IM2
                  @ 19,2  SAY DEMO97
                  @ 19,16 SAY DEMO17
                  @ 19,26 GET DATE1
                  @ 20,2  SAY DEMO97
                  @ 20,16 SAY DEMO18
                  @ 20,26 GET DATE2
                  READ
            ENDCASE
         CASE C1='2'
            CANCEL
      ENDCASE
   CASE C='2'
      CANCEL
   CASE C='3'
      CANCEL
   CASE C='4'
      CANCEL
   CASE C='5'
      CANCEL
   CASE C='0'
      RETURN
   OTHERWISE
      LOOP
ENDCASE
SET TALK ON
