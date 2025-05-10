@echo off
title ECID ^& SERIAL REGISTRATION - MR 1337
color 0A
mode con: cols=70 lines=25

:MENU
cls
echo ========================================================
echo          ECID ^& SERIAL REGISTRATION TOOL MR 1337
echo ========================================================
echo.
echo   1. Register Serial Number
echo   2. Register ECID
echo   3. Exit
echo.
set /p choice=Select an option (1-3): 

if "%choice%"=="1" goto SERIAL
if "%choice%"=="2" goto ECID
if "%choice%"=="3" exit
goto MENU

:SERIAL
cls
echo ================================
echo        SERIAL REGISTRATION
echo ================================
echo.

set /p "SERIAL=Enter Serial Number: "

if "%SERIAL%"=="" (
    echo [!] Error: Serial cannot be empty!
    pause
    goto MENU
)

echo.
echo [→] Sending serial to server...

powershell -NoProfile -Command ^
    "$serial = \"%SERIAL%\";" ^
    "$response = Invoke-WebRequest -Uri 'https://frpfile.com/icloud/index.php' -Method POST -Body @{serial=$serial; btn_submit='Submit'};" ^
    "if ($response.Content -like '*Add Success.*') {" ^
        "Write-Host \"`n[✔] Serial Registered Successfully!`n\" -ForegroundColor Green" ^
    "} else {" ^
        "Write-Host \"`n[✘] Failed to register serial. Response:\" -ForegroundColor Red;" ^
        "$response.Content" ^
    "}"

pause
goto MENU

:ECID
cls
echo ================================
echo          ECID REGISTRATION
echo ================================
echo.

set /p "ECID=Enter ECID (e.g., 0x001a61d238d1803c): "

if "%ECID%"=="" (
    echo [!] Error: ECID cannot be empty!
    pause
    goto MENU
)

echo.
echo [→] Sending ECID to server...

powershell -NoProfile -Command ^
    "$ecid = \"%ECID%\";" ^
    "$response = Invoke-WebRequest -Uri 'https://crocs.pythonanywhere.com/' -Method POST -Body @{ecid=$ecid};" ^
    "if ($response.Content -like '*Your ECID has been registered successfully*') {" ^
        "Write-Host \"`n[✔] ECID Registered Successfully!`n\" -ForegroundColor Green" ^
    "} else {" ^
        "Write-Host \"`n[✘] Failed to register ECID. Response:\" -ForegroundColor Red;" ^
        "$response.Content" ^
    "}"

pause
goto MENU