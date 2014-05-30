@echo off
REM============================================================
REM
REM Copyright © 2011 GENERAL ELECTRIC COMPANY
REM
REM============================================================
REM
REM File:           buildAll.bat
REM Project:        Genie Carestation SW
REM
REM Author:         YS / ICS SW Team
REM
REM============================================================
REM Description:
REM 
REM
REM 
REM
REM 
REM============================================================

:INIT
echo off

call buildGenie.bat
call run_Genie.bat

:HELP
echo This script execute %TARGET_TO_RUN%.
echo.

:END
REM EOF

