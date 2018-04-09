* Program..: creat index with field
* Auther...: Yun aw
* Date.....: 03/02/1992
* Version..: Edit V5.0 + Clipper
set talk off
@ 0,0 clear
store space(8) to fd,fd1
store space(30) to fn,fn1
do while .t.
   do while fn=space(8).or.fd=space(8)
      @ 20,1 say '請輸入要建立索引之檔名：'get fn
      @ 21,1 say '請輸入所要索引之欄位名稱：'get fd
      read
   enddo
   fn1=ltrim(trim(upper(fn)))
   fd1=ltrim(trim(upper(fd)))
   if fn1='0'.or.fd1='0'
      exit
   endif
   use &fn
   index on &fd to &fn
   fn=space(30)
   fd=space(8)
enddo
set talk on
