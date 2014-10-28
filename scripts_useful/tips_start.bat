@echo off
@echo .........................................................................
@echo 

REM    
REM    Description: 
REM    
REM    
REM    by Yuriy Senishch. 2011.
REM 



:INIT
REM set SESSIONS_DIR=D:\dev\vim_sessions
set SESSIONS_DIR=.
set SESSION_KEY=-S
set EXECUTION_KEY=-c
set TRIKS_SESSION=tips_and_triks_session
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

start %APP_TO_RUN% %SESSION_KEY% %SESSIONS_DIR%\%TRIKS_SESSION% 

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
