@echo off

set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:start
set driveletter=
set /p driveletter=THE DRIVE LETTER FOR THUMBDRIVE (and press enter):

echo "Welcome to the house of the Draco"

::Copies ITSUPDATES to C drive from Thumbdrive
echo "Copy Software Folder to C: Drive"
powershell -Command "Copy-Item -Path '%driveletter%:\Win11\Software\' -Destination 'C:\Software\' -Recurse"

::Delete windows bloat
echo "Removing 3D Builder"
powershell -Command "& Get-AppxPackage *3dbuilder* -AllUser | Remove-AppxPackage -AllUser"
echo "Removing 3D Viewer"
powershell -Command "Get-AppxPackage Microsoft.Microsoft3DViewer -AllUser | Remove-AppxPackage"
echo "Removing Alarms and Clocks"
powershell -Command "Get-AppxPackage *windowsalarms* -AllUser | Remove-AppxPackage"
echo "Removing Feedback Hub"
powershell -Command "Get-AppxPackage *feedback* -AllUser | Remove-AppxPackage"
echo "Removing Get Help App"
powershell -Command "Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage"
echo "Removing Groove Music"
powershell -Command "Get-AppxPackage *zunemusic* -AllUser | Remove-AppxPackage"
echo "Removing Mail & Calendar"
powershell -Command "Get-AppxPackage *microsoft.windowscommunicationsapps* -AllUser | Remove-AppxPackage"
echo "Removing Messaging"
powershell -Command "Get-AppxPackage *messaging* -AllUser | Remove-AppxPackage"
echo "Removing Microsoft Finance"
powershell -Command "Get-AppxPackage *bingfinance* -AllUser | Remove-AppxPackage"
echo "Removing Microsoft Hub"
powershell -Command "Get-AppxPackage *officehub* -AllUser | Remove-AppxPackage"
echo "Removing Microsoft Mixed Reality Portal"
powershell -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* -AllUser | Remove-AppxPackage"
echo "Removing Microsoft Mobile Plans App"
powershell -Command "Get-AppxPackage Microsoft.OneConnect -AllUser | Remove-AppxPackage"
echo "Removing Microsoft Tips App"
powershell -Command "Get-AppxPackage Microsoft.Getstarted -AllUser | Remove-AppxPackage"
echo "Removing Skype"
powershell -Command "Get-AppxPackage *skypeapp* -AllUser | Remove-AppxPackage"
echo "Removing Solitaire Collection"
powershell -Command "Get-AppxPackage *solitairecollection* -AllUser | Remove-AppxPackage"
echo "Removing Maps Package"
powershell -Command "Get-AppxPackage *windowsmaps* -AllUser | Remove-AppxPackage"
echo "Removing Windows Phone"
powershell -Command "Get-AppxPackage *windowsphone* -AllUser | Remove-AppxPackage"
echo "Removing Your Phone"
powershell -Command "Get-AppxPackage *yourphone* -AllUser | Remove-AppxPackage"
echo "Removing XBox App"
powershell -Command "Get-AppxPackage *xbox* -AllUser | Remove-AppxPackage"

::Installs Software Can be added or edited
echo "Installing 7Zip"
start /wait C:\Software\Software\7zip.exe
echo "Installing Chrome"
start /wait C:\Software\Software\ChromeSetup.exe
echo "Installing Cura"
start /wait C:\Software\Software\Cura.exe
echo "Installing Discord"
start /wait C:\Software\Software\Discord.exe
echo "Installing Steam"
start /wait C:\Software\Software\SteamSetup.exe

control update

echo "Press any key to close window"

pause
