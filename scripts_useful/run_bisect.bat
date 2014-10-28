@ECHO OFF
REM
REM Yuriy Senishch. OCT-2014
REM
REM Script implements bisect routine for a git repository, 
REM by searching a word in a given file.
REM
REM EQU - equal
REM NEQ - not equal
REM LSS - less than
REM LEQ - less than or equal
REM GTR - greater than
REM GEQ - greater than or equal
REM
REM

REM OK_TOKEN is unique word from the git output message when search is _complete_.
set OK_TOKEN=first
set TARGET_ID=ERROR
set TARGET_FILE=example.txt
set RES_FILE=res.log
set RES_FILE_GIT=res_git.log
set ITERATION_NUM=1

if -%1==- goto NoParam
goto START 

:NoParam

:START
call TDiff.exe
REM This is a safety block. Remove it for use a script
echo Script is blocked due to safety! Edit it first in order to use.
goto END

echo --------------------------------------------------------
REM call %MAIN_ACTION%

:START_BISECT
REM Start bisect:
echo Start bisect:
call git bisect start HEAD origin/initial

:LOOP
echo --------------------------------------------------------
echo Iteration number - %ITERATION_NUM%
REM erase previous result file if exist:
if exist %RES_FILE% del %RES_FILE%
if exist %RES_FILE_GIT% del %RES_FILE_GIT%

REM search number of occurences in a file and write to other file:
call grep %TARGET_ID% %TARGET_FILE% | wc -l >> %RES_FILE%

REM read result file and set a variable:
set /p GREP_RES=<%RES_FILE%
echo Grep found for '%TARGET_ID%' - %GREP_RES%

if %GREP_RES% EQU 1 goto SET_BAD

:SET_GOOD
echo SET commit to good
call git bisect good >> %RES_FILE_GIT%
goto NEXT_STEP

:SET_BAD
echo SET commit to bad
call git bisect bad >> %RES_FILE_GIT%
goto NEXT_STEP

:NEXT_STEP
REM DEBUG ONLY!: cat %RES_FILE_GIT%
REM erase result of previous grep, 
if exist %RES_FILE% del %RES_FILE%

REM search for 'first' in git output:
call grep %OK_TOKEN% %RES_FILE_GIT% | wc -l >> %RES_FILE%

REM read result from file and set to a variable:
set /p GREP_RES=<%RES_FILE%
echo Grep found for '%OK_TOKEN%' - %GREP_RES%

REM check loop condition:
if %GREP_RES% GTR 0 goto SUXXESS
REM Increment iteration:
set /A ITERATION_NUM=ITERATION_NUM+1
goto LOOP

REM never here!
goto END

:SUXXESS
echo Complete OK! 
echo --------------------------------------------------------
cat %RES_FILE_GIT%
echo --------------------------------------------------------
goto END

:END
REM Clean the mess:
if exist %RES_FILE% del %RES_FILE%
if exist %RES_FILE_GIT% del %RES_FILE_GIT%

call TDiff.exe

