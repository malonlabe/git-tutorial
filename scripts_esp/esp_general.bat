@ECHO OFF
@echo off
::-------------------------------------------------------------------------
REM This script doing follow (run from ESP root dir):
REM - create 'Targets' folder in esp root dir
REM - goto 'Targets' folder and create VisualStudio solutions for esp
REM - in 'Targets' folder create runtime libs for project
::-------------------------------------------------------------------------
set DIR_TO_CREATE=Targets
set WIN_DEBUG=WindowsDebug
set VISUAL_STUDIO=VisualStudio
set S5_RUNTIME_LIBS=S5MonWindowsRunTime

REM Follow has to be taken from script parameters:
::set TARGET=winppd
set TARGET=WINMAX

if -%1==- goto NoParam
goto START 

:NoParam

:START
::create VisualStudio solutions:
if exist %DIR_TO_CREATE% goto Target_Exist
mkdir %DIR_TO_CREATE%

:Target_Exist
echo Dir %DIR_TO_CREATE% exist, just go there.
cd %DIR_TO_CREATE%
call pwd
echo call omake VisualStudio
::omake monitor=winppd -f ..\Msf\S5Mon\Code\makefile.mak VisualStudio
omake -f ..\Msf\S5Mon\Code\makefile.mak %VISUAL_STUDIO% monitor=%TARGET%
::omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=Windows jobs=4 debug=3

REM Generate runtime DLLs for ESP:
echo Generate runtime DLLs for ESP:
cd %WIN_DEBUG%
call pwd
::omake monitor=winppd -f ..\..\Msf\S5Mon\Code\makefile.mak S5MonWindowsRunTime
::omake -f ..\..\Msf\S5Mon\Code\makefile.mak S5MonWindowsRunTime monitor=winppd
omake -f ..\..\Msf\S5Mon\Code\makefile.mak %S5_RUNTIME_LIBS% monitor=%TARGET%
echo call omake runtime
cd..
echo cd UP
call pwd
cd %VISUAL_STUDIO%
call pwd

:: check if esp.sln exist in current dir:
if exist esp.sln goto ESP_SLN_EXIST
goto ESP_SLN_NOT_EXIST

:ESP_SLN_EXIST
echo call esp.sln
call esp.sln
goto UP_TO_START_DIR

:ESP_SLN_NOT_EXIST
echo EEROR: NO esp.sln found. Visual Studio will NOT start.
goto UP_TO_START_DIR

:UP_TO_START_DIR
cd ..
call pwd
cd ..
call pwd

:USER_INPUT
@echo PRESS ANY KEY TO END:
pause>nul

goto END
:END

