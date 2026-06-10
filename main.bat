@echo off
:: Memastikan script berjalan dengan hak akses Administrator
echo Memeriksa hak akses Administrator...
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo =====================================================
    echo GAGAL: Script ini HARUS dijalankan sebagai Administrator!
    echo Silakan klik kanan file .bat ini lalu pilih 'Run as Administrator'.
    echo =====================================================
    pause
    exit
)

echo.
echo =====================================================
echo     PEMBERSIHAN TOTAL DAN HARD RESET ID ANYDESK
echo =====================================================
echo.

:: 1. Menghentikan Windows Service AnyDesk secara paksa
echo [1/3] Menghentikan AnyDesk Service di latar belakang...
sc config anydesk start= disabled >nul 2>&1
net stop anydesk /y >nul 2>&1
sc stop anydesk >nul 2>&1

:: 2. Menutup proses aplikasi AnyDesk
echo [2/3] Menutup paksa proses AnyDesk.exe...
taskkill /f /im AnyDesk.exe >nul 2>&1
timeout /t 3 /nobreak >nul

:: 3. Menghapus total seluruh folder konfigurasi (bukan cuma file .conf)
echo [3/3] Menghapus total folder cache dan ID lama...
if exist "%appdata%\AnyDesk" (
    rmdir /s /q "%appdata%\AnyDesk" >nul 2>&1
    echo - Folder AppData berhasil dibersihkan.
)
if exist "%programdata%\AnyDesk" (
    rmdir /s /q "%programdata%\AnyDesk" >nul 2>&1
    echo - Folder ProgramData berhasil dibersihkan.
)

:: Mengembalikan mode service AnyDesk ke normal agar bisa dibuka lagi
sc config anydesk start= demand >nul 2>&1

echo.
echo =====================================================
echo Selesai! Silakan buka kembali AnyDesk Anda.
echo Anda akan mendapatkan ID baru & pop-up iklan telah hilang.
echo =====================================================
echo.
pause

:: Lpprri_@1945