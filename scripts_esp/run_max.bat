@ECHO OFF
REM
REM Script "Run S5Mon EXE file" in unittest for ESP
REM component from command line using "build" Perl script.
REM 
REM Yuriy Senishch. OCT-2014
REM
@echo off

set MAIN_OBJ=S5Mon.exe
set TARGET_DIR=MAX
REM unittests\%COMPONENT%\%COMPONENT%TestRunner.exe

if -%1==- goto NoParam
goto START 

:NoParam

:START
echo --------------------------------------------------------
echo change dir to %TARGET_DIR%
echo --------------------------------------------------------
cd %TARGET_DIR%

:CHECK_RESULT_FILE
if exist %MAIN_OBJ% goto TARGET_EXIST
goto ERROR_NO_EXE_FILE

:TARGET_EXIST
echo --------------------------------------------------------
echo start %MAIN_OBJ% ....
echo --------------------------------------------------------
start %MAIN_OBJ%
goto CHANGE_DIR_BACK

:ERROR_NO_EXE_FILE
echo --------------------------------------------------------
echo BUILD ERROR: file '%MAIN_OBJ%' not exist!
echo --------------------------------------------------------
goto CHANGE_DIR_BACK

:CHANGE_DIR_BACK
echo --------------------------------------------------------
echo change dir to previous state
echo --------------------------------------------------------
cd ..

goto END

:END
