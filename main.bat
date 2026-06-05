@echo off
:: Menjalankan script PowerShell AnyDesk
:: Letakkan file .bat ini di folder yang sama dengan file .ps1

PowerShell -ExecutionPolicy Bypass -File "%~dp0remover_ads_anydesk.ps1"

pause