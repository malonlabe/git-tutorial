@ECHO OFF
REM
REM Script to erase S5Mon EXE file
REM 
REM Yuriy Senishch. NOV-2014
REM

set MAIN_OBJ=S5Mon.exe
set TARGET_DIR=MAX

if -%1==- goto NoParam
goto START 

:NoParam

:START
echo --------------------------------------------------------
echo change dir to %TARGET_DIR%
cd %TARGET_DIR%

:CHECK_RESULT_FILE
if exist %MAIN_OBJ% goto TARGET_EXIST
goto ERROR_NO_EXE_FILE

:TARGET_EXIST
echo --------------------------------------------------------
echo Erase %MAIN_OBJ% ....
del %MAIN_OBJ%
goto CHANGE_DIR_BACK

:ERROR_NO_EXE_FILE
echo --------------------------------------------------------
echo ERASE impossible: file '%MAIN_OBJ%' not exist!
echo --------------------------------------------------------
goto CHANGE_DIR_BACK

:CHANGE_DIR_BACK
cd ..

goto END

:END
