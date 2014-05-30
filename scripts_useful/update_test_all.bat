@echo off
REM============================================================
REM
REM Copyright © 2010 GENERAL ELECTRIC COMPANY
REM
REM Script for update tortouse CVN repository
REM============================================================

:INIT
REM Set drive name:
set DISK=L:
REM set PATH_TO_UPDATE="D:\dev\Genie_main_trunk\"
set PATH_TO_UPDATE="D:\dev\Genie_test_all\"

:START
@echo on

call TortoiseProc.exe /command:update /path:%PATH_TO_UPDATE% /closeonend:1

:END
call beep.bat
@echo Complete.
