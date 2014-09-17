@ECHO OFF
REM
REM Script creates Visual Studio projects for ESP 
REM from command line, using CMake.
REM
REM Yuriy Senishch. SEP-2014
REM
@echo off

set DIR_TO_CREATE=Target
set TARGET_SLN=S5Mon.sln

if -%1==- goto NoParam
goto START 

:NoParam

:START

REM mkdir %DIR_TO_CREATE%
REM cd %DIR_TO_CREATE%

call TDiff.exe
call cmake -G "Visual Studio 10 2010" ..\..\
call TDiff.exe

:: check if esp.sln exist in current dir:
if exist %TARGET_SLN% goto ESP_SLN_EXIST
goto ESP_SLN_NOT_EXIST

:ESP_SLN_EXIST
echo call %TARGET_SLN%
call %TARGET_SLN%
goto END

:ESP_SLN_NOT_EXIST
echo EEROR: NO %TARGET_SLN% found. Visual Studio will NOT start.
goto END


:USER_INPUT
@echo PRESS ANY KEY TO END:
pause>nul

goto END

:END

