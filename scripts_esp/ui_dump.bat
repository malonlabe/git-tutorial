@ECHO OFF
REM
REM Script for obtain a UiDump from ESP.
REM 
REM Yuriy Senishch. NOV-2014
REM
REM AREA_MSG
REM AREA_PATDATA
REM AREA_INFO
REM AREA_SOFTKEY
REM AREA_MENU
REM AREA_REMOTE_DATA
REM AREA_V_BLOCK_1
REM AREA_V_BLOCK_2
REM AREA_H_BLOCK_1
REM AREA_H_BLOCK_2
REM AREA_SPLITSCREEN_1
REM AREA_SPLITSCREEN_2
REM AREA_WAVE_1
REM AREA_WAVE_2
REM AREA_APPLICATION
REM
@echo off

set MAIN_OBJ=uidump.py
set ROBOT_PATH=Depot\YS\CSP\Robot\sources\tools\

REM set PARAM_AREA=AREA_SOFTKEY
REM set PARAM_AREA=AREA_PATDATA
set PARAM_AREA=AREA_MSG
REM set EXTRA_PARM=AlarmMsg1

set TARGET_DIR=MAX
set PORT_NUM=5999

REM File settings:
set FILE_EXT=js
set RESULT_FILE=uidump_log_%PARAM_AREA%.%FILE_EXT%

set CURRENT_DIR=%CD%

REM Editor settings:
set EDITOR=gvim
REM set EDITOR=notepad

if -%1==- goto NoParam
goto START 

:NoParam

:START
echo --------------------------------------------------------
echo Current path: %CURRENT_DIR%

:CHECK_RESULT_FILE
if not exist %RESULT_FILE% goto RESULT_FILE_NOT_EXIST
echo --------------------------------------------------------
echo Erase file %RESULT_FILE%.....
del %RESULT_FILE%

:RESULT_FILE_NOT_EXIST

C:
REM pwd.bat
REM cd %ROBOT_PATH%

echo --------------------------------------------------------
REM if "%EXTRA_PARM%"=="" ECHO Extra Param is NOT defined
if "%EXTRA_PARM%"=="" goto NO_PARAM_EXTRA

:PARAM_EXTRA_EXIST
echo calling %MAIN_OBJ% --port %PORT_NUM% %EXTRA_PARM% %PARAM_AREA% .....
%MAIN_OBJ% --port %PORT_NUM% %EXTRA_PARM% %PARAM_AREA% >> %CURRENT_DIR%\%RESULT_FILE% 
goto OPEN_RESULT_FILE

:NO_PARAM_EXTRA
echo calling %MAIN_OBJ% --port %PORT_NUM% %PARAM_AREA% .....
%MAIN_OBJ% --port %PORT_NUM% %PARAM_AREA% >> %CURRENT_DIR%\%RESULT_FILE% 
goto OPEN_RESULT_FILE

:OPEN_RESULT_FILE
echo --------------------------------------------------------
REM echo calling %EDITOR% %CURRENT_DIR%\%RESULT_FILE%
REM start %EDITOR% %CURRENT_DIR%\%RESULT_FILE%

goto END

:END


REM uidump.py --port 5999 "AlarmMsg1:AlarmText" AREA_MSG
