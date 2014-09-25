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

set ACTION_TO_DO=unittest
set COMPONENT=DAlarm
set COMPILER=ninja
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
goto END

:END
call TDiff.exe

