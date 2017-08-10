@echo off
echo This script is for windows IP address switch between static and dynamic(DHCP).
echo Written by Wallance Hou 4/1/2016
echo -----------------------------------------
rem //set var
set INTF_NAME="Local Area Connection"
set ADDR="10.10.10.10"
set MASK="255.255.255.0"
set GW="10.10.10.1"
set DNS1=""

rem //Above property is IP,MASK
  echo You can select:
  echo 1 Setting Static IP
  echo 2 Setting DHCP
  echo 3 exit
  :0
  set /p operate=Please select then Enter:
  if "%operate%"=="1" goto 1
  if "%operate%"=="2" goto 2
  if "%operate%"=="3" goto 3
  goto 0
  :1
  echo Setting Static IP...
rem //Static IP infomation
  set /p ADDR=Please input IP address(10.10.10.10):
  set /p MASK=Please input IP mask(255.255.255.0):
  set /p GW=Please input Default Gateway(10.10.10.1):
rem //  set /p DNS1=Please input DNS server Address(10.10.10.1):
  echo IP= %ADDR%
  echo MASK= %MASK%
  echo GW= %GW%
rem //  echo DNS= %DNS1%
  netsh interface ipv4 set address name=%INTF_NAME% source=static addr=%ADDR% mask=%MASK% >nul
  netsh interface ipv4 set address name=%INTF_NAME% source=static gateway=%GW% gwmetric=0 >nul
rem //  netsh interface ipv4 set dns name=%INTF_NAME% source=static addr=%DNS1% register=PRIMARY >nul
  echo Static IP setting finished!
  pause
  goto 3
  :2
  echo Setting DHCP...
  echo Obtaining IP from DHCP...
  netsh interface ipv4 set address name=%INTF_NAME% source=dhcp
  echo Obtaining DNS Address from DHCP...
  netsh interface ip set dns name=%INTF_NAME% source=dhcp
  echo Dynamic IP setting finished!
  pause
  goto 3
  :3
  exit