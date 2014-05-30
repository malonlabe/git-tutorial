@ECHO OFF
REM
REM Generate DLLs fr ESP project
REM shall be called from 'Targets\WindowsDebug' folder    
REM Yuriy Senishch. FEB-2014
REM
@echo off

if -%1==- goto NoParam
goto START 

:NoParam

:START
call TDiff.exe
omake monitor=winppd -f ..\..\Msf\S5Mon\Code\makefile.mak S5MonWindowsRunTime
call TDiff.exe
goto END

:END

