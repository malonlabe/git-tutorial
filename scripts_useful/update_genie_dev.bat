@echo off
REM============================================================
REM
REM Copyright © 2010 GENERAL ELECTRIC COMPANY
REM
REM Script for update tortouse CVN repository
REM==========================================================
:INIT
REM Set drive name:
set DISK=L:
set PATH_TO_UPDATE_MAIN="D:\dev\Genie_main_trunk\"
REM set PATH_TO_UPDATE_TEST="D:\dev\Genie_test_all\"
REM set PATH_TO_UPDATE="D:\dev\Genie_test_all\"

:START
@echo on

REM start /B TortoiseProc.exe /command:update /path:%PATH_TO_UPDATE_MAIN% /closeonend:1
call TortoiseProc.exe /command:update /path:%PATH_TO_UPDATE_MAIN% /closeonend:1
REM call TortoiseProc.exe /command:update /path:%PATH_TO_UPDATE_TEST% /closeonend:1

start /B TortoiseProc.exe /command:log /path:%PATH_TO_UPDATE_MAIN% /closeonend:0

:END
REM call beep.bat
@echo Complete.

