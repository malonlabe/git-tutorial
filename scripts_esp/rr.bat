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
set KEY_COMP=-R
set COMPILER=ninja
set CTEST=ctest
set CMAKE_COMPILER=Ninja

if -%1==- goto NoParam
goto START 

:NoParam

:START
echo unittests\%COMPONENT%\%COMPONENT%TestRunner.exe
echo --------------------------------------------------------
call TDiff.exe

call unittests\%COMPONENT%\%COMPONENT%TestRunner.exe

echo --------------------------------------------------------
call TDiff.exe
goto END

:END

