@echo off
setlocal


d:
cd d:\
cd esp5



if not exist D:\esp5\Targets mkdir D:\esp5\Targets
if not exist D:\esp5\Targets\ARMRelease mkdir D:\esp5\Targets\ARMRelease
if not exist D:\esp5\Targets\ARMDebug mkdir D:\esp5\Targets\ARMDebug
if not exist D:\esp5\Targets\PPCRelease mkdir D:\esp5\Targets\PPCRelease
if not exist D:\esp5\Targets\PPCDebug mkdir D:\esp5\Targets\PPCDebug
if not exist D:\esp5\Targets\WindowsRelease mkdir D:\esp5\Targets\WindowsRelease
if not exist D:\esp5\Targets\WindowsDebug mkdir D:\esp5\Targets\WindowsDebug
if not exist D:\esp5\Targets\X86Release mkdir D:\esp5\Targets\X86Release
if not exist D:\esp5\Targets\X86Debug mkdir D:\esp5\Targets\X86Debug
if not exist D:\esp5\Targets\SlickEdit mkdir D:\esp5\Targets\SlickEdit
if not exist D:\esp5\Targets\VisualStudio mkdir D:\esp5\Targets\VisualStudio

if (%1)==() (
set MY_CHECK_DEPS=
) else (
set MY_CHECK_DEPS="CHECK_DEPS=1"
)

@echo on


REM Targets 

REM Max
cd D:\esp5\Targets\X86Debug && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=max DEBUG=3 JOBS=4 %MY_CHECK_DEPS%
cd D:\esp5\Targets\X86Release && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=max JOBS=4 %MY_CHECK_DEPS%
REM Flex
cd D:\esp5\Targets\PPCDebug && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=flex DEBUG=3 JOBS=4 %MY_CHECK_DEPS%
cd D:\esp5\Targets\PPCRelease && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=flex JOBS=4 %MY_CHECK_DEPS%
REM Lite
cd D:\esp5\Targets\X86Debug && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=lite DEBUG=3 JOBS=4 %MY_CHECK_DEPS%
cd D:\esp5\Targets\X86Release && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=lite JOBS=4 %MY_CHECK_DEPS%
REM PPD
cd D:\esp5\Targets\ARMDebug && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=ppd DEBUG=3 %MY_CHECK_DEPS%
cd D:\esp5\Targets\ARMRelease && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=ppd %MY_CHECK_DEPS%

REM Slickedit and VS Projects
cd D:\esp5\Targets\SlickEdit && omake -f ..\..\Msf\S5Mon\Code\makefile.mak SlickEdit
cd D:\esp5\Targets\VisualStudio && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=windows VisualStudio VISUAL10=1
REM Windows
cd D:\esp5\Targets\WindowsDebug && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=windows DEBUG=3 JOBS=4 %MY_CHECK_DEPS% 
cd D:\esp5\Targets\WindowsDebug && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=windows S5MonWindowsRuntime
cd D:\esp5\Targets\WindowsRelease && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=windows JOBS=4 %MY_CHECK_DEPS% 
cd D:\esp5\Targets\WindowsRelease && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=windows S5MonWindowsRuntime
REM Unit tests
cd D:\esp5\Targets\WindowsDebug && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=windows DEBUG=3 unittestall
cd D:\esp5\Targets\WindowsRelease && omake -f ..\..\Msf\S5Mon\Code\makefile.mak monitor=windows unittestall




@echo off





