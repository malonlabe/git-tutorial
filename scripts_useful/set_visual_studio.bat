@echo off
REM============================================================
REM
REM Copyright © 2011 GENERAL ELECTRIC COMPANY
REM
REM============================================================
REM
REM File:           buildGenie.bat
REM Project:        Genie Carestation SW
REM
REM Author:         PA, YS / ICS SW Team
REM
REM============================================================
REM Description:
REM CMD batch to build/rebuild/clean Genie SW
REM
REM Syntax: buildGenie.bat <configuration> <command>
REM
REM Default is Debug configuration and build. Other commands
REM are rebuild and clean.
REM============================================================

:INIT
echo off
rem Default is Debug configuration
set CONFIG=Debug
rem By changing the command we can do rebuild / clean / etc.
set DEVCMD=build
set FAILEDBUILDS=

set SOLUTION_TO_BUILD=%SOURCE_DIR%\%SOLUTION_NAME%
set VCVARSPATH="C:\Program Files\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"

if "%1"=="help" goto HELP
rem NOTE that parameter checking is omitted!
if not "%1"=="" set CONFIG="%1"
if not "%2"=="" set DEVCMD="%2"

echo.

:BUILD
rem Setup VC environment
call %VCVARSPATH% x86

:SOLUTION

:END
