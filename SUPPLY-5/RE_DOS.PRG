* Program..: Print screen
* Auther...: Yun aw
* Date.....: 03/28/1992
* Version..: Clipper + ET V3.0
function rundos
private chkcommand,getdrive
save screen
chkcommand=gate("COMSPEC")
getdrive=substr(chkcommand,1,1)
run &getdrive:\command.com
restore screen
return ""
