* Program..: Search unit
* Auther...: Yun aw
* Date.....: 02/29/1992
* Version..: FoxBase + Edit V5.0 + Clipper
set talk off
store space(8) to imct,imct1
do while .t.
   @ 0,0 clear
   use d:\army\item
   set index to d:\army\item
   do while imct1=space(8)   
      @ 20,1  say '½Ð¿י¤J÷Þ¨מ§Ç¸¹¡G'get imct1
      @ 21,1  say '·ם÷Þ¨מ§Ç¸¹¬°¹s®Éµ²§פµ{¦¡'
      read
   enddo
   imct=ltrim(trim(upper(imct1)))
   if imct='0'
      exit
   endif
   seek imct
   if eof().and.imct<>imctlno
      @ 0,0 clear
      @ 21,1  say '¬dµL÷Þ¨מ§Ç¸¹¬°        ¤§¸ך®Æ'
      @ 21,15 say imct 
      @ 21,29 say '' 
   else
      @  6,0  say 'שזשששששששששששששששששששששששששחשששששששששששששששששששששששששששששששששששששששששששששששששששט'
      @  7,0  say '¢x®Æ    ¸¹¡G              ¢x«~    ¦W¡G                                        ¢x'
      @  8,0  say 'שישששששששששששששחשששששששששששםשששששששששששששששששחשששששששששששששששששששחשששששששששששששכ'
      @  9,0  say '¢x°]²£Ã‏§O¡G  ¢x³ז¦ל¡]¤¤¤ו¡^¡G  ¡]        ¡^¢x³ז»ש¡G            ¢x÷Þ¨מ°Ï¤À¡G  ¢x'
      @ 10,0  say 'שלשששששששששששששםשששששששששששששששששששששששששששששםשששששששששששששששששששםשששששששששששששמ'
      @  7,12 say imno
      @  7,38 say imdesp
      @  9,12 say imtype
      @  9,30 say imunit
      @  9,34 say imcunit
      @  9,52 say imup
      @  9,76 say imcode1
      @  20,0 clear
   endif
   i=0
   do while i=0
      i=inkey()
   enddo
   imct1=space(8)
ENDDO
