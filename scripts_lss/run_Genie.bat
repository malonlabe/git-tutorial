@echo off
@echo .........................................................................


REM                                             v. 1.0.12                    
REM    Description: 
REM    
REM    
REM    by Yuriy Senishch. 2011.
REM 


REM check does destination is existing:

:INIT
set TARGET_DIR=D:\dev\Genie_test_all\src\GEngine\Target\Win32
set SOURCE_DIR=D:\dev\Genie_test_all\src\GEngine\Apps\Genie
set APP_TO_RUN=Genied.exe
set VENT_YAML_FILE=VentContents.yaml
set GAS_YAML_FILE=GasModContents.yaml
set GUI_CSS_FILE=GenieStyleSheet.css
REM set MODE=--mode vcb 
set MODE=--mode vcb --comname \\.\\COM29
REM set MODE=--nocursor --mode vcb 

@echo run %TARGET_DIR%\%APP_TO_RUN%

if -%1==- goto NoParam
set APP_TO_RUN=%1
if not exist %APP_TO_RUN% goto NoParam
goto START 

:NoParam
goto START

:START

:COPY
REM If EXIST \\%2\Repo_Bkp\Backup\*.log del \\%2\Repo_Bkp\Backup\*.log
REM
REM  Start copy files. 
@echo Copy YAML files %GAS_YAML_FILE%,  %VENT_YAML_FILE% and Stylesheet %GUI_CSS_FILE%

@echo on

cp %SOURCE_DIR%\%GAS_YAML_FILE% %TARGET_DIR%
cp %SOURCE_DIR%\%VENT_YAML_FILE% %TARGET_DIR%
cp %SOURCE_DIR%\%GUI_CSS_FILE% %TARGET_DIR%

:RUN_APP
cd %TARGET_DIR%
call %TARGET_DIR%\%APP_TO_RUN% %MODE%


:DELETE_TMP_FILES
REM rm %TARGET_DIR%\%GAS_YAML_FILE%
REM rm %TARGET_DIR%\%VENT_YAML_FILE%
REM rm %TARGET_DIR%\%GUI_CSS_FILE%

cd D:\dev
goto END

REM If EXIST \\%2\Repo_Bkp\Backup\nul goto ERASE
REM echo Nothing to erase
REM goto COPY
REM :ERASE
REM for delete the whole directory in NT use an "rd" command instead of "deltree"
REM echo Delete old store
REM rd /s /q \\%2\Repo_Bkp\Backup

:FAIL
@echo Error occures!
goto END

:SUCCESS

goto END

:END
REM call beep.bat
@echo Complete.
