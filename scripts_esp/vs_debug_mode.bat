@ECHO OFF
@echo off

if -%1==- goto NoParam
goto START 

:NoParam

:START
::call TDiff.exe
start devenv.exe /debugexe S5Mon.exe -pod -unid -screens 1
::call TDiff.exe
goto END

:END

