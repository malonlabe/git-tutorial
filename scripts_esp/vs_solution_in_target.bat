@ECHO OFF
@echo off

set DIR_TO_CREATE=Target

if -%1==- goto NoParam
goto START 

:NoParam

:START
::call TDiff.exe
mkdir %DIR_TO_CREATE%
cd %DIR_TO_CREATE%
call TDiff.exe
omake monitor=winppd -f ..\Msf\S5Mon\Code\makefile.mak VisualStudio
call TDiff.exe
cd ..
::call TDiff.exe
goto END

:END

