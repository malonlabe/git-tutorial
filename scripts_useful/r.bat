@ECHO OFF
REM
REM Script run unittest for ESP component 
REM from command line using ctest.
REM
REM Yuriy Senishch. SEP-2014
REM
@echo off

set ACTION_TO_DO=unittest
set OUTPUT_FAIL=--output-on-failure
set COMPONENT=DAlarm
set KEY_COMP=-R
set CTEST=ctest

set MAIN_OBJ=unittests\%COMPONENT%\%COMPONENT%TestRunner.exe
set RUN_ACTION=%CTEST% %KEY_COMP% %COMPONENT% %OUTPUT_FAIL%


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
echo calling %RUN_ACTION% ...
call %RUN_ACTION%
echo --------------------------------------------------------
goto END

:ERROR_NO_EXE_FILE
echo --------------------------------------------------------
echo ERROR: file '%MAIN_OBJ%' not exist!
echo --------------------------------------------------------
goto END

:END
call TDiff.exe

