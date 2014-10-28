@ECHO OFF
REM
REM Script compiles ESP project from command line
REM using CMake and ninja.
REM
REM Yuriy Senishch. SEP-2014
REM
@echo off

REM set number of CPU for parallel compilation:
set CPU_TO_USE=8

set BUILD_NINJA=build.ninja 
set CMAKE=cmake
set COMPILER=ninja
set CMAKE_COMPILER=Ninja

set CMAKE_ACTION=%CMAKE% -G %CMAKE_COMPILER% ../..
set NINJA_ACTION=%COMPILER% -j %CPU_TO_USE%
if -%1==- goto NoParam
goto START 

:NoParam

:START
call TDiff.exe

:CHECK_BUILD_NINJA
if exist %BUILD_NINJA% goto START_COMPILE

:START_CMAKE_PRECOMPILER
echo --------------------------------------------------------
echo calling %CMAKE_ACTION% ....
echo --------------------------------------------------------
call %CMAKE_ACTION%  

:START_COMPILE
echo --------------------------------------------------------
echo calling %NINJA_ACTION% ....
echo --------------------------------------------------------
call %NINJA_ACTION%

goto END

:END
call TDiff.exe
