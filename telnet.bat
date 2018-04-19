@echo off
rem Author: Wallance Hou
rem Date: 9/27/2017
rem Purpose: for telnet function

rem set background/frontground color
color f1

rem set title
title=mytelnet

rem set windows size
mode con cols=80 lines=20

:1
python .\mytelnet.py

set /p operate=Enter to continue or q to exit:
if "%operate%"=="q" (goto exit) else (goto 1)

:exit
exit
