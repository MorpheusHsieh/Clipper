* Program..: �q�ܸ��X�޲z�{��
* Filename.: PHONE.PRG
* Version..: Clipper summmer 87'
* Auther...: Yun am
* Date.....: 1992/08/11

*�z�w�w�w�w�{
*�x���ҳ]�w�x
*�|�w�w�w�w�}
set wrap on
set date ansi
set scoreboard off

*�z�w�w�w�w�{
*�x�ܼƳ]�w�x
*�|�w�w�w�w�}
menu00='0.��  ��'
menu01='1.�W  �['
menu02='2.�R  ��'
menu03='3.��  ��'
menu04='4.�d  ��'
menu05='5.�C  �L'
store 1 to choice

*�z�w�w�w�w�{
*�x�D�{���Ϣx
*�|�w�w�w�w�}
sele a
do while choice<>6
   @  0,0  clear
   @  0,0  say	'�z�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�{'
   @  1,0  say	'�x�q�T���޲z�{��                                        �]�p����G92.08.11�x'
   @  2,0  say	'�|�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�}'
   @  3,1  prompt menu01
   @  3,15 prompt menu02
   @  3,29 prompt menu03
   @  3,43 prompt menu04
   @  3,57 prompt menu05
   @  3,61 prompt menu00
   menu to choice
enddo

*�z�w�w�w�w�{
*�x�Ƶ{���Ϣx
*�|�w�w�w�w�}
