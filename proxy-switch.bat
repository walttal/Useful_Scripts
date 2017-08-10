@echo off
echo This script is for IE Autoscript Proxy Configuration.
echo Written by Wallance Hou 12/9/2016
echo -----------------------------------------
set SH_PROXY="http://1.2.3.4/"
set SHTE_PROXY="http://1.2.3.4/proxy-shte.pac"
set SW_PROXY="http://1.2.3.4/proxy-sw.pac"
set US_PROXY="http://1.2.3.4/proxy-exu.pac"
set DEFAULT_PROXY="http://xxx.domainname/"

rem //Select one Proxy server
  echo You can select:
  echo 1 AutoConfigURL with Automatic generated by AD Group policy.
  echo 2 AutoConfigURL with Shanghai directly.
  echo 3 AutoConfigURL with Shanghai TE Proxy Default.
  echo 4 AutoConfigURL with Sweden Proxy Default.
  echo 5 AutoConfigURL with US Proxy Default.
  echo x exit
echo -----------------------------------------
  :0
  set /p operate=Please select then Enter:
  if "%operate%" == "1" goto 1
  if "%operate%" == "2" goto 2
  if "%operate%" == "3" goto 3
  if "%operate%" == "4" goto 4
  if "%operate%" == "5" goto 5
  if "%operate%" == "x" goto x
  goto 0
  :1
  set AUTO_URL=%DEFAULT_PROXY%
  goto STARTCONF
  :2
  set AUTO_URL=%SH_PROXY%
  goto STARTCONF
  :3
  set AUTO_URL=%SHTE_PROXY%
  goto STARTCONF
  :4
  set AUTO_URL=%SW_PROXY%
  goto STARTCONF
  :5
  set AUTO_URL=%US_PROXY%
  goto STARTCONF
  :STARTCONF
rem //disable Proxy
  FOR /F "tokens=2* delims= " %%A IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable') DO SET currentProxy=%%B
  if %currentProxy%==0x1 (
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul
  echo *****Manual Proxy Diabled***** )
rem //setting autourl proxy
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_SZ /d %AUTO_URL% /f >nul
  echo *****AutoConfigURL=%AUTO_URL%*****
rem //setting proxy server
rem //setting bypass address or domain
  echo AutoURL Proxy configured sucessfully!!!
  pause
  :x
  rem exit