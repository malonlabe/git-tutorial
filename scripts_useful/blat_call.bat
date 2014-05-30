@echo off
REM============================================================
REM
REM Copyright © 2010 GENERAL ELECTRIC COMPANY
REM
REM Script for update tortouse CVN repository
REM============================================================

:INIT
set APP_TO_RUN=blat.exe
set TO=yuriy.senishch@ge.com
set FROM=ysn71@ya.ru
set SERVER=smtp.yandex.ru

set to="-to yuriy.senishch@ge.com"
set f="-f ysn71@ya.ru"
set server="-server smtp.yandex.ru"


:START
REM %APP_TO_RUN% "c:\some.txt" -t someone@somwhere.com -s "Subj test" -i %FROM% -f "replyaddress@somedomain.com" -q -server %SERVER%

set subject = "-subject \"Testing blat\""
set body = "-body \"Testing blat\""
set debug = "-debug"

REM Here is where we run Blat.
REM Note, I named the vars the same as Blat's paramaters.
REM blat - %to% %f% %subject% %body% %server% %debug%
REM blat "D:\dev\vim_tips.log" %to% %f% %subject% %body% %server% %debug%
REM blat.exe -to "yuriy.senishch@ge.com" -f ysn71@ya.ru -subject "TecT" -body "TesTing blat" 
blat.exe D:\dev\vim_tips.log -to "abba@gmail.com" -f ysn71@ya.ru -subject "TecT" -body "TesTing blat" 
:END

@echo Complete.

