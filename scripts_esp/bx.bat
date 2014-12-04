@ECHO OFF
REM
REM Script "Build and Run EXE file" in unittest for ESP
REM component from command line using "build" Perl script.
REM 
REM First : previous result exe-file is deleted.
REM Second: build script called
REM Third: if build was OK, result EXE file is calling.
REM
REM For change unittest target, change COMPONENT!
REM
REM Yuriy Senishch. SEP-2014
REM
@echo off

set ACTION_TO_DO=unittest
REM set COMPONENT=DAlarm
REM set COMPONENT=DExtComm
set COMPONENT=DExtComm
set COMPILER=build
set MAIN_OBJ=unittests\%COMPONENT%\%COMPONENT%TestRunner.exe

if -%1==- goto NoParam
goto START 

:NoParam

:START
call TDiff.exe

:ERASE_PREV_FILE
if exist %MAIN_OBJ% del %MAIN_OBJ%

:BUILD_START
echo --------------------------------------------------------
echo calling %COMPILER% %COMPONENT%.%ACTION_TO_DO% ....
echo --------------------------------------------------------
call %COMPILER% %COMPONENT%.%ACTION_TO_DO%

:CHECK_RESULT_FILE
if exist %MAIN_OBJ% goto TARGET_EXIST
goto ERROR_NO_EXE_FILE

:TARGET_EXIST
echo --------------------------------------------------------
echo calling %MAIN_OBJ% ....
echo --------------------------------------------------------
call %MAIN_OBJ%
goto END

:ERROR_NO_EXE_FILE
echo --------------------------------------------------------
echo BUILD ERROR: file '%MAIN_OBJ%' not exist!
echo --------------------------------------------------------
goto END

:END
call TDiff.exe
