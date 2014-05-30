@echo off
@echo .........................................................................
@echo 


REM=======================================================================    
REM    Description: Open Visual Studio with given project as a parameter.
REM    
REM    
REM    by Yuriy Senishch. 2011.
REM=======================================================================

:INIT

REM Here gives path for project:
set CURRENT_PROJECT_DIR="D:\dev\Genie_test_all\src\GEngine"

REM Here gives project name as variable(s):
REM
set CURRENT_PROJECT_NAME=GEngine_VS2010_ys.sln
REM
REM END of INIT block

if -%1==- goto NoParam
set APP_TO_RUN=%1

REM if not exist %APP_TO_RUN% goto NoParam
goto START 

:NoParam
set APP_TO_RUN="C:\Program Files\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe"
goto START

:START
@echo Start Visual Studio project: %CURRENT_PROJECT_NAME%

:RUN_APP

start %APP_TO_RUN% %CURRENT_PROJECT_DIR%\%CURRENT_PROJECT_NAME%

goto END

:FAIL
@echo Error occures!
goto END

:SUCCESS

goto END

:END
call beep.bat
@echo Complete.

