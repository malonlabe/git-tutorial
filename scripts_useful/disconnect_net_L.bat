@echo off
REM============================================================
REM
REM Copyright © 2010 GENERAL ELECTRIC COMPANY
REM
REM Script for disconnect a mapped drive
REM============================================================

:INIT
REM Set drive name:
set DISK=L:

:START
@echo on
net use %DISK% /delete /yes
REM net use %DISK% /d /yes
:END
REM call beep.bat
@echo Complete.
