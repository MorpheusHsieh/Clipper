*Program..: ��Ʈw���U�@�~�{��
*Auther...: Yun aw
*Date.....: 01/14/1992
*Version..: FoxBase + ET Chines System + Clippr
SET TALK OFF
SET SCOREBOARD OFF
STORE SPACE(1) TO I,C,C1,C2
STORE SPACE(8) TO IM1,IM2,DATE1,DATE2
DEMO01='0.��    ��'
DEMO02='�d    ��'
DEMO03='��    ��'
DEMO04='�L    ��'
DEMO05='��    ��'
DEMO06='�u    ��'
DEMO07='�q    ��'
DEMO08='��    ��'
DEMO09='�g    �z'
DEMO10='�ި�Ǹ�'
DEMO11='���N��'
DEMO12='�u�O���X'
DEMO13='�浧�d��'
DEMO14='�h���d��'
DEMO15='�_�l���X'
DEMO16='�פ�X'
DEMO17='�_�l���'
DEMO18='�פ���'
DEMO94='�{�b�{�����椤...'
DEMO95='�п�J�n���檺�\��G'
DEMO96='�Ƹ����s�ɵ����d��'
DEMO97='�п�J�n�d�ߪ�        �G'
DEMO98='�䤣��        ��          �����'
DEMO99='������@���~��....'
@  0,0 CLEAR
@  0,0  SAY '�z�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{'
@  1,0  SAY '�x���x����ƲĤ@�ݤE�v������O����D��s���U�@�~�{��                          �x'
@  2,0  SAY '�x�{���]�p�G�ªY��                                            ����G1992/01/14�x'
@  3,0  SAY '��������������������������������������������������������������������������������'
@  4,0  SAY '�x�e�׭�]�G �@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@     �x�ؿ��G            �x'
@  5,0  SAY '�u�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�t                  �x'
@  6,0  SAY '�x����ѧO�X�G    �x�ި�Ǹ��G        �x�u�O���X�G        �x                  �x'
@  7,0  SAY '�u�w�w�w�w�w�w�w�w�r�w�w�w�s�w�w�w�w�w�r�w�s�w�w�w�w�w�w�w�t                  �x'
@  8,0  SAY '�x��    ���G              �x�̳����G    �x�̳�Ǹ��G    �x                  �x'
@  9,0  SAY '�u�w�w�w�w�w�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�r�s�w�w�w�w�w�w�t                  �x'
@ 10,0  SAY '�x�~    �W�G                                �x�u�����ǡG  �x                  �x'
@ 11,0  SAY '�u�w�w�w�w�w�w�w�w�w�s�w�w�w�w�w�w�w�w�w�s�w�r�w�w�w�w�w�w�t                  �x'
@ 12,0  SAY '�x��    ��G        �x����G            �x�B�z����G      �x                  �x'
@ 13,0  SAY '�u�w�w�w�w�w�w�s�w�w�r�w�w�w�w�w�w�s�w�w�r�w�w�w�w�w�w�w�w�t                  �x'
@ 14,0  SAY '�x�]�����O�G  �x�˳Ƹ��X�G        �x�e�׳��N���G        �x                  �x'
@ 15,0  SAY '�u�w�w�w�w�w�w�q�w�w�w�w�w�w�s�w�w�r�w�w�w�s�w�w�w�w�w�w�w�t                  �x'
@ 16,0  SAY '�x�ӽмơG    �x�����ơG    �x���o�ơG    �x�ݦ��ơG      �x                  �x'
@ 17,0  SAY '�u�w�w�w�w�w�w�r�w�w�w�w�w�w�r�w�w�w�w�w�w�r�w�w�w�w�w�w�w�r�w�w�w�w�w�w�w�w�w�t'
@ 18,0  SAY '�x                                                                            �x'
@ 19,0  SAY '�x                                                                            �x'
@ 20,0  SAY '�x                                                                            �x'
@ 21,0  SAY '�|�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}'
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