@ECHO OFF
REM
REM Script "Build and Run EXE file" for ESP
REM Combination of 2 bat files.
REM
REM Yuriy Senishch. OCT-2014
REM

if -%1==- goto NoParam
goto START 

set COMPILATION_SCRIPT=run_esp_compilation.bat
set RUN_SCRIPT=run_max.bat

:NoParam

:START

:BUILD_START
echo %COMPILATION_SCRIPT%
REM call %COMPILATION_SCRIPT%
call run_esp_compilation.bat

:RUN_APP
echo %RUN_SCRIPT%
call %RUN_SCRIPT%
REM call run_max.bat

:END
