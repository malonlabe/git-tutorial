@ECHO OFF
REM
REM Script run unittest EXE file for ESP component 
REM from command line.
REM
REM Yuriy Senishch. SEP-2014
REM
@echo off

REM set number of CPU for parallel compilation:
REM set jobs=4
set CPU_TO_USE=8
set ACTION_TO_DO=unittest
set OUTPUT_FAIL=--output-on-failure
set COMPONENT=DAlarm
set MAIN_OBJ=unittests\%COMPONENT%\%COMPONENT%TestRunner.exe

if -%1==- goto NoParam
goto START 

:NoParam

:START
call TDiff.exe

:CHECK_RESULT_FILE
if exist %MAIN_OBJ% goto TARGET_EXIST
goto ERROR_NO_EXE_FILE

:TARGET_EXIST
echo --------------------------------------------------------
echo calling %MAIN_OBJ% ....
echo --------------------------------------------------------
call %MAIN_OBJ%
goto END

:ERROR_NO_EXE_FILE
echo --------------------------------------------------------
echo ERROR: file '%MAIN_OBJ%' not exist!
echo --------------------------------------------------------
goto END

:END
call TDiff.exe

