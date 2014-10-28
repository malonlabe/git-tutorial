@ECHO OFF
@echo off

set DIR_TO_CREATE=Target
set MAIN_FLAG=0

if -%1==- goto NoParam
goto START 

:NoParam

:START
::call TDiff.exe
::mkdir %DIR_TO_CREATE%
::call TDiff.exe
::pause
call pwd
echo %DIR_TO_CREATE%
set DIR_TO_CREATE=Target_Exist
echo %DIR_TO_CREATE%
set MAIN_FLAG=1

if %MAIN_FLAG% EQU 0 goto number1

if %MAIN_FLAG% EQU 1 goto number2
goto PRESS_ANY_KEY

:number1
echo MAIN_FLAG 0
goto PRESS_ANY_KEY

:number2
echo MAIN_FLAG 1
goto PRESS_ANY_KEY

:PRESS_ANY_KEY
@echo For unzipping, PRESS ANY KEY:
pause>nul

goto END

:END

