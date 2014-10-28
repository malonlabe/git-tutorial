@echo off
@echo .........................................................................
@echo 
REM    Description: 
REM    start gvim default
REM    by calling session file
REM    
REM    by Yuriy Senishch. OCT-2014.
REM 



:INIT
REM set SESSIONS_DIR=D:\dev\vim_sessions
set SESSIONS_DIR=.
set SESSION_KEY=-S
set EXECUTION_KEY=-c
set THE_SESSION=vim_monokay_session
:: set COLOR_SCHEME_DEFAULT_YS="colorscheme default_ys"
REM END of INIT block

if -%1==- goto NoParam
set APP_TO_RUN=%1

REM if not exist %APP_TO_RUN% goto NoParam
goto START 

:NoParam
set APP_TO_RUN=GVIM
goto START

:START
@echo Start list of GVIM projects:

:RUN_APP

start %APP_TO_RUN% %SESSION_KEY% %SESSIONS_DIR%\%THE_SESSION% 

:: gvim -S Session.vim
:: -geom 85x55

:DELETE_TMP_FILES
goto END

:FAIL
@echo Error occures!
goto END

:SUCCESS

goto END

:END
call beep.bat
@echo Complete.
