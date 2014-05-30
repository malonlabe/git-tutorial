@ECHO OFF
REM
REM compile ESP project PPD in command line
REM shall be called from 'Targets\WinPPDDEbug' folder    
REM Yuriy Senishch. FEB-2014
REM
@echo off

if -%1==- goto NoParam
goto START 

:NoParam

:START
REM set number of CPU for parallel compilation
set jobs=4
call TDiff.exe
omake monitor=winppd debug=1 -f ..\..\Msf\S5Mon\Code\makefile.mak
call TDiff.exe
goto END

:END

