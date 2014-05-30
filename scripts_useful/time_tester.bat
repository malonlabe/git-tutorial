@Echo Off

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
goto START

:START
echo %Time%
Set pTime=%Time:~7,1%
@echo %pTime% %Time%
set mPing=ping 3.187.27.9
@echo %mPing%
REM call %mPing%%pTime%
goto END

:FAIL
@echo Error occures! 
goto END

:SUCCESS
@echo OK.
goto END


REM SetLocal EnableExtensions EnableDelayedExpansion
 
If "%1"=="" Exit
If %1 LSS 0 GoTo :EOF
If %1 GTR 999 GoTo :EOF
 
Set pDelay=%1
Set iDelay=0
Set pTime=%Time:~7,1%
 
:WAIT
Set iTime=%Time:~7,1%

If %iTime% == %pTime% GoTo :WAIT
REM echo %iTime% %Time%
Set pTime=%iTime%
Set /a iDelay=%iDelay%+1
If %iDelay% LSS %pDelay% GoTo :WAIT
 
REM EndLocal

:END
REM call beep.bat
@echo Complete.


