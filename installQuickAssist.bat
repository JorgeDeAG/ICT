@echo off
:: Verify if Quick Assist is installed
powershell -Command "Get-AppxPackage -Name MicrosoftCorporationII.QuickAssist | Out-Null"
if %errorlevel% neq 0 (
    echo Quick Assist is not installed. Installing...
    powershell -Command "Start-Process ms-windows-store://pdp/?productid=9P7BP5VNWKX5 -Wait"
    echo Waiting installation to complete...
    :check_installation
    powershell -Command "Get-AppxPackage -Name MicrosoftCorporationII.QuickAssist | Out-Null"
    if %errorlevel% neq 0 (
        timeout /t 5
        goto check_installation
    )
    echo Installation complete.
) else (
    echo Quick Assist already installed.
)
