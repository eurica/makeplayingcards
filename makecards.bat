@echo off
echo Starting > log/start.txt

rem mostly just parses parameters
set picDir=%1

rem echo %1,%2,%3,%4,%5,%6,%7

rem set defaults
set font=
set labels=doesnotexist
set diamonds=d
set hearts=h
set spades=s
set clubs=c

:params
shift
if [%0]==[] goto doneParams 
if [%0]==[1suit] goto 1suit 
if [%0]==[1suits] goto 1suit 
if [%0]==[2suits] goto 2suits 
if [%0]==[4suits] goto 4suits 
if [%0]==[font:] goto setFont
if [%0]==[labels:] goto setLabels

goto params

:setFont
shift
set font=-font %0
goto params

:setLabels
shift
set labels=%0
goto params

:1suit
echo One suit worth of pictures
set diamonds=d
set hearts=d
set spades=d
set clubs=d
goto params

:2suits
echo Two suit's worth of pictures
set diamonds=d
set hearts=d
set spades=s
set clubs=s
goto params

:4suits
echo Four suit's worth of pictures
set diamonds=d
set hearts=h
set spades=s
set clubs=c
goto params


:doneParams
call bin\overnum.bat %picDir%

echo Ending > log/end.txt

echo .
echo Finished!
echo Your cards are in the "finished" directory