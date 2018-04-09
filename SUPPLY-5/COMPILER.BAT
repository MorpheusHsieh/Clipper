@echo off
cls
if "%1"=="" goto usage
copy %1.prg c:\language\clipper\*.prg
cd c:\language\clipper
c:
clipper %1
if not errorlevel 1 plink86 fi %1 lib clipper lib extend
copy %1.exe c:\language\clipper\clpfile
erase %1.*
cd c:\language\clipper\clpfile
goto end
:usage
cls
echo Usage : COMPILER [filename]
:end


