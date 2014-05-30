@echo off
ping -n 1 www.mail.ru | find "TTL=" > nul
if errorlevel 0 echo Ping successful

