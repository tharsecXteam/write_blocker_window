@ECHO OFF
COLOR 06
cls
:start
ECHO.
ECHO  Write Blocker for Windows by tharsecXteam - Version 1.3
ECHO.
ECHO.
ECHO Start the write blocker before connecting the USB Flash Drive and do not
ECHO change the settings when a USB Flash Drive is connected.
ECHO ------------------------------------------------------------------------------
ECHO thar_Sec_ Rules The World.
ECHO ______________________________________________________________________________
ECHO.
ECHO 1. Enable the USB Write Blocker - ON
ECHO.
ECHO 2. Disable the USB Write Blocker - OFF
ECHO.
ECHO 3. Exit
ECHO.
set /p choice=Type the number and press Enter: 
rem if not '%choice%'=='' set choice=%choice:~0;1%
if '%choice%'=='1' goto on
if '%choice%'=='2' goto off
if '%choice%'=='3' goto exit
if not '%choice%'=='' ECHO "%choice%" is not valid please try again
ECHO.
goto start
:on
If exist "%Temp%\~import.reg" (
 Attrib -R -S -H "%Temp%\~import.reg"
 del /F /Q "%Temp%\~import.reg"
 If exist "%Temp%\~import.reg" (
  Echo Could not delete file "%Temp%\~import.reg"
  Pause
 )
)
> "%Temp%\~import.reg" ECHO Windows Registry Editor Version 5.00
>> "%Temp%\~import.reg" ECHO.
>> "%Temp%\~import.reg" ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies]
>> "%Temp%\~import.reg" ECHO "WriteProtect"=dword:00000001
REGEDIT /S "%Temp%\~import.reg"
DEL "%Temp%\~import.reg"
cls
ECHO The USB Write Blocker is - ON
ECHO.
PAUSE
cls
ECHO.
ECHO The USB Write Blocker is - ON
ECHO.
goto start
:off
If exist "%Temp%\~import.reg" (
 Attrib -R -S -H "%Temp%\~import.reg"
 del /F /Q "%Temp%\~import.reg"
 If exist "%Temp%\~import.reg" (
  Echo Could not delete file "%Temp%\~import.reg"
  Pause
 )
)
> "%Temp%\~import.reg" ECHO Windows Registry Editor Version 5.00
>> "%Temp%\~import.reg" ECHO.
>> "%Temp%\~import.reg" ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies]
>> "%Temp%\~import.reg" ECHO "WriteProtect"=-
REGEDIT /S "%Temp%\~import.reg"
DEL "%Temp%\~import.reg"
cls
ECHO The USB Write Blocker is - OFF
ECHO.
PAUSE
cls
ECHO.
ECHO The USB Write Blocker is - OFF
ECHO.
goto start
:exit
cls
exit
