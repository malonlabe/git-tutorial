@ECHO OFF
REM
REM Script creates makefiles for ESP project from 
REM command line using CMake.
REM
REM Yuriy Senishch. SEP-2014
REM
@echo off

REM set number of CPU for parallel compilation:
REM set jobs=4
set CPU_TO_USE=8
:: -j 8
set COMPILER=ninja
set CMAKE_COMPILER=Ninja

if -%1==- goto NoParam
goto START 

:NoParam

:START
::set Visual Studio runtime:

call TDiff.exe
call cmake -G %CMAKE_COMPILER% ../..  
::call %COMPILER% -j %CPU_TO_USE%
call TDiff.exe
goto END

:END

