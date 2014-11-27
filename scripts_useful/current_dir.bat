@ECHO OFF
REM
REM 
REM Yuriy Senishch. NOV-2014
REM

REM set PARAM_AREA=AREA_SOFTKEY
set PARAM_AREA=AREA_MSG
set EXTRA_PARM=AlarmMsg1

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

IF "%EXTRA_PARM%"=="" ECHO Extra Param is NOT defined

IF "%EXTRA_PARM%"=="" goto NO_PARAM_EXTRA
goto ECHO_1

:ECHO_1
echo %EXTRA_PARM%
goto END
:NO_PARAM_EXTRA
echo NO extra param!
goto END


:END
