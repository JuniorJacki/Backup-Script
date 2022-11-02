REM -------------------------------------------------------------------------
REM Copyright (c) IT Javarock. All Rights Reserved.
REM Web: Javarock.de 
REM Developer: JuniorJacki#4534
REM -------------------------------------------------------------------------


@echo off

for /f "skip=1" %%i in ('wmic os get localdatetime') do if not defined fulldate set fulldate=%%i
set year=%fulldate:~0,4%
set month=%fulldate:~4,2%
set day=%fulldate:~6,2%
set foldername=%day%.%month%.%year%
set fulldate=%fulldate:~8,6%
set backupfolder=Backup_%fulldate:~0,2%-%fulldate:~2,2%-%fulldate:~4,2%


set "source=C:\Users\..."
set "destination=C:\Users\..."

cd %destination%
mkdir %foldername%
cd %destination%/%foldername%
mkdir %backupfolder%


robocopy "%source%" "%destination%\%backupfolder%" /E


set /a count=0
for /f "tokens=* delims= " %%a in ('dir/s/b/a-d "%destination%/%foldername%/%backupfolder%"') do (
set /a count+=1
)

echo Backup Zeit = %time% %date%>> readme.log
echo Dateien: %count% >> readme.log

