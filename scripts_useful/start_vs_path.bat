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
REM============================================================

:INIT

::
:: set VCVARSPATH="C:\Program Files\Microsoft Visual Studio 9.0\VC\vcvarsall.bat"
::
set VCVARSPATH="C:\Program Files\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"

if "%1"=="help" goto HELP
rem NOTE that parameter checking is omitted!
if not "%1"=="" set CONFIG="%1"
if not "%2"=="" set DEVCMD="%2"

rem Setup VC environment
call %VCVARSPATH% x86
goto END

:SOLUTION


:BUILDEND

:SUCCESS

:FAILURE
goto END

:USAGE
:HELP

:END
REM EOF

