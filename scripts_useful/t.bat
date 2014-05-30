@echo off
@echo .........................................................................

REM http://www.computerhope.com/batch.htm
REM                                             v. 1.0.10                       
REM    Description: 
REM
REM    by Yuriy Senishch. 2010.
REM 
REM                       INFORMATION
REM 
REM *****************************************************************
REM *****************************************************************

:INIT

REM check does destination is existing:
if -%1==- goto NoParam
set DISK=%1
REM echo DESTINATION=%DESTINATION%

if not exist %DISK%:\ goto NoParam
goto START 

:NoParam
set DISK=C
if not exist %DISK%:\ goto FAIL
goto START

:START

:PING_LOOP
@echo.
@echo %time%
call ping www.google.com -n 4

goto PING_LOOP

:COPY
REM 

:FAIL
@echo Error occures! Destination disk %DISK% does not exist!
goto END

:SUCCESS
@echo Files are successfully copied. 
goto END

:END
call beep.bat
@echo Complete
