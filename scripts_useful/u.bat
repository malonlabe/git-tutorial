@ECHO OFF
REM
REM Script compiles unittest for ESP project from 
REM command line, using ninja.
REM 
REM Do not forget that cov01 shall be set to ON!
REM
REM Yuriy Senishch. SEP-2014
REM
@echo off

set COV=cov01
set COV_STATUS=--status
set ACTION_TO_DO=unittest
set COMPONENT=DAlarm
set COMPILER=ninja

:: combine action strings.
set CHECK_COVERAGE=%COV% %COV_STATUS%
set MAIN_ACTION=%COMPILER% %COMPONENT%.%ACTION_TO_DO%
set MAIN_OBJ=unittests\%COMPONENT%\%COMPONENT%TestRunner.exe

if -%1==- goto NoParam
goto START 

:NoParam

:START
call TDiff.exe

:ERASE_PREV_FILE
if exist %MAIN_OBJ% del %MAIN_OBJ%

echo calling %MAIN_ACTION% ....
echo --------------------------------------------------------

call %MAIN_ACTION%
echo --------------------------------------------------------

echo check BullsEye availability ....
echo %CHECK_COVERAGE%
call %CHECK_COVERAGE%

goto END

:END
call TDiff.exe

