@ECHO OFF
@echo off

if -%1==- goto NoParam
goto START 

:NoParam

:START
call TDiff.exe
omake monitor=winppd -f ..\Msf\S5Mon\Code\makefile.mak VisualStudio
call TDiff.exe
goto END

:END

