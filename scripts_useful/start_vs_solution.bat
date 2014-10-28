@ECHO OFF
@echo off

if -%1==- goto NoParam
goto START 

:NoParam

:START
call TDiff.exe
REM omake monitor=winppd -f ..\Msf\S5Mon\Code\makefile.mak VisualStudio
cd Targets\VisualStudio
call esp.sln
call TDiff.exe
goto END

:END

