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
set APP_TO_RUN=blat.exe
REM set APP_TO_RUN=svn
set PATH_TO_UPDATE_MAIN_GENIE="D:\dev\Genie_main_trunk\"
set PATH_TO_UPDATE_TEST_GENIE="D:\dev\Genie_test_all\"

set PATH_TO_UPDATE_MAIN="D:\dev\A180_main_trunk\"
REM set PATH_TO_UPDATE_TEST="D:\dev\Genie_test_all\"

set PATH_TO_APP="C:\Program Files\TortoiseSVN\bin"
REM set PATH_TO_UPDATE="D:\dev\Genie_test_all\"

:START
REM start /B TortoiseProc.exe /command:update /path:%PATH_TO_UPDATE_MAIN% /closeonend:1
REM start /B TortoiseProc.exe /command:update /path:%PATH_TO_UPDATE_TEST% /closeonend:0

@echo on
call TortoiseProc.exe /command:update /path:%PATH_TO_UPDATE_MAIN% /closeonend:1
call TortoiseProc.exe /command:log /path:%PATH_TO_UPDATE_MAIN% /closeonend:0

REM call TortoiseProc.exe /command:update /path:%PATH_TO_UPDATE_TEST% /closeonend:1

REM start /B TortoiseProc.exe /command:log /path:%PATH_TO_UPDATE_TEST% /closeonend:0
@echo off

:END

@echo Complete.
