@echo off
REM============================================================
REM
REM Copyright © 2008 GENERAL ELECTRIC COMPANY
REM
REM============================================================
REM
REM File:           buildAll.bat
REM Project:        Intrinsic Carestation SW
REM
REM Author:         PA / ICS SW Team
REM
REM============================================================
REM Description:
REM CMD batch to build/rebuild/clean ICS SW
REM
REM Syntax: build.bat <configuration> <command>
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

REM set VCVARSPATH="C:\Program Files\Microsoft Visual Studio 9.0\VC\vcvarsall.bat"
set VCVARSPATH="C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"

if "%1"=="help" goto HELP
rem NOTE that parameter checking is omitted!
if not "%1"=="" set CONFIG="%1"
if not "%2"=="" set DEVCMD="%2"


echo ----------------------------------------------------------
echo ICS SW %DEVCMD% run, %DATE% %TIME%
echo ----------------------------------------------------------
echo Variables:
echo CONFIG=%CONFIG%
echo DEVCMD=%DEVCMD%
echo.

:BUILD
rem Setup VC environment
call %VCVARSPATH% x86


:GENIE
set CURSUBSYS=Genie
echo ==========
echo %CURSUBSYS%
devenv Genie.sln /%DEVCMD% %CONFIG%
if not %ERRORLEVEL%==0 set FAILEDBUILDS=%CURSUBSYS%
echo.

:BUILDEND
if "%FAILEDBUILDS%"=="" goto SUCCESS
goto FAILURE

:SUCCESS
echo Build ended, ICS SW built successfully!
goto END

:FAILURE
echo Build ended, the following subsystems had errors:
echo %FAILEDBUILDS%
goto END

:USAGE
:HELP
echo Syntax: build.bat <configuration> <command>
echo.
echo Default is Debug configuration and build.

:END
REM EOF

