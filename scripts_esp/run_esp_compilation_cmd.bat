@ECHO OFF
REM
REM compile ESP project PPD in command line
REM shall be called from 'Targets\WinPPDDEbug' folder    
REM Yuriy Senishch. FEB-2014
REM
@echo off

REM set number of CPU for parallel compilation:
REM set jobs=4
set CPU_TO_USE=8
set COMPILER=ninja

if -%1==- goto NoParam
goto START 

:NoParam

:START

call TDiff.exe
REM omake monitor=winppd debug=1 -f ..\..\Msf\S5Mon\Code\makefile.mak
call %COMPILER%
call TDiff.exe
goto END

:END

