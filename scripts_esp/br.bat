@ECHO OFF
REM
REM Script "Build and Run" a unittest for ESP
REM component from command line using "build" Perl script and ctest.
REM
REM For change unittest target, change COMPONENT!
REM
REM Yuriy Senishch. SEP-2014
REM
@echo off

set ACTION_TO_DO=unittest
set COMPONENT=DAlarm
set COMPILER=build
set OUTPUT_FAIL=--output-on-failure
set CTEST=ctest
set KEY_COMP=-R

set MAIN_OBJ=unittests\%COMPONENT%\%COMPONENT%TestRunner.exe
set BUILD_ACTION=%COMPILER% %COMPONENT%.%ACTION_TO_DO%
set RUN_ACTION=%CTEST% %KEY_COMP% %COMPONENT% %OUTPUT_FAIL%

if -%1==- goto NoParam
goto START 

:NoParam

:START
call TDiff.exe

:ERASE_PREV_FILE
if exist %MAIN_OBJ% del %MAIN_OBJ%

:BUILD_START
echo --------------------------------------------------------
echo calling %BUILD_ACTION% ...
echo --------------------------------------------------------
call %BUILD_ACTION%

:CHECK_RESULT_FILE
if exist %MAIN_OBJ% goto TARGET_EXIST
goto ERROR_NO_EXE_FILE

:TARGET_EXIST
echo --------------------------------------------------------
echo calling %RUN_ACTION% ... 
echo --------------------------------------------------------
call %RUN_ACTION%
goto END

:ERROR_NO_EXE_FILE
echo --------------------------------------------------------
echo BUILD ERROR: file '%MAIN_OBJ%' not exist!
echo --------------------------------------------------------
goto END

:END
call TDiff.exe

