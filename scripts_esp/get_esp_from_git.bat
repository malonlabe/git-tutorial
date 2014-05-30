@ECHO OFF
@echo off

set WORKING_DIR=D:\dev
set DEFAULT_ESP_DIR=esp

if -%1==- goto NoParam
set CLONE_DIR=%1
goto START 

:NoParam
set CLONE_DIR=%DEFAULT_ESP_DIR%
if exist %DEFAULT_ESP_DIR% goto ERROR_EXIST_DIR

:START
call TDiff.exe
cd D:\dev
echo copy git to folder %CLONE_DIR%
call pwd
git clone git@czc3025gt6.clients.em.health.ge.com:esp %CLONE_DIR%
call TDiff.exe
goto END

:ERROR_EXIST_DIR
::echo ERROR: %DEFAULT_ESP_DIR% already exists and can not be replaced!
echo ERROR: Folder '\%CLONE_DIR%' already exists and can not be replaced!
echo STOP.

:END
echo END.


