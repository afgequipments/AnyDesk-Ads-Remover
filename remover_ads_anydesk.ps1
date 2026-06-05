# Script untuk mengelola file AnyDesk
# Simpan sebagai: hapus_ads_anydesk.ps1
# Jalankan dengan: PowerShell -ExecutionPolicy Bypass -File hapus_ads_anydesk.ps1

function Show-Menu {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "         PENGELOLA FILE ANYDESK" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1. Hapus file (kecuali user.conf dan folder thumbnails)"
    Write-Host "2. Lihat file di dalam direktori"
    Write-Host "3. Keluar"
    Write-Host ""
}

function Get-AnydeskPath {
    return Join-Path $env:APPDATA "AnyDesk"
}

function Remove-AnydeskFiles {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "              HAPUS FILE" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    
    $anydeskPath = Get-AnydeskPath
    
    if (Test-Path $anydeskPath) {
        if (Get-Process -Name "AnyDesk" -ErrorAction SilentlyContinue) {
            Write-Host "Menutup aplikasi AnyDesk yang sedang berjalan..." -ForegroundColor Yellow
            Stop-Process -Name "AnyDesk" -Force -ErrorAction SilentlyContinue
            Start-Sleep -Seconds 1
        }
        Write-Host "Ditemukan: $anydeskPath" -ForegroundColor Green
        Write-Host ""
        Write-Host "PERHATIAN: File berikut ini akan dihapus:" -ForegroundColor Yellow
        Write-Host ""
        
        # Mendaftar file yang akan dihapus
        $filesToDelete = Get-ChildItem -Path $anydeskPath -File | Where-Object { $_.Name -ne "user.conf" }
        
        if ($filesToDelete.Count -eq 0) {
            Write-Host "Tidak ada file yang perlu dihapus." -ForegroundColor Yellow
        } else {
            foreach ($file in $filesToDelete) {
                Write-Host "- $($file.Name)"
            }
            
            Write-Host ""
            $confirmacao = Read-Host "Apakah Anda ingin melanjutkan? (Y/N)"
            
            if ($confirmacao -eq "Y" -or $confirmacao -eq "y") {
                Write-Host ""
                Write-Host "Menghapus file..." -ForegroundColor Yellow
                Write-Host ""
                
                foreach ($file in $filesToDelete) {
                    try {
                        Remove-Item -Path $file.FullName -Force
                        Write-Host "Dihapus: $($file.Name)" -ForegroundColor Green
                    } catch {
                        Write-Host "Gagal menghapus: $($file.Name)" -ForegroundColor Red
                    }
                }
                
                Write-Host ""
                Write-Host "File yang dilindungi:" -ForegroundColor Cyan
                if (Test-Path (Join-Path $anydeskPath "user.conf")) {
                    Write-Host "- user.conf (file)" -ForegroundColor Green
                }
                
                Write-Host ""
                Write-Host "Folder yang dilindungi:" -ForegroundColor Cyan
                if (Test-Path (Join-Path $anydeskPath "thumbnails")) {
                    Write-Host "- thumbnails (folder)" -ForegroundColor Green
                }
                
                Write-Host ""
                Write-Host "Selesai!" -ForegroundColor Green
            } else {
                Write-Host ""
                Write-Host "Operasi dibatalkan." -ForegroundColor Yellow
            }
        }
    } else {
        Write-Host "Folder AnyDesk tidak ditemukan di $env:APPDATA" -ForegroundColor Red
    }
    
    Write-Host ""
    Read-Host "Tekan ENTER untuk melanjutkan"
}

function Show-AnydeskFiles {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "         FILE DI DIREKTORI ANYDESK" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host ""
    
    $anydeskPath = Get-AnydeskPath
    
    if (Test-Path $anydeskPath) {
        Write-Host "Direktori: $anydeskPath" -ForegroundColor Green
        Write-Host ""
        Write-Host "File yang ditemukan:" -ForegroundColor Cyan
        Write-Host ""
        
        $items = Get-ChildItem -Path $anydeskPath
        
        foreach ($item in $items) {
            if ($item.PSIsContainer) {
                Write-Host "[FOLDER] $($item.Name)" -ForegroundColor Yellow
            } else {
                Write-Host "[FILE] $($item.Name)"
            }
        }
        
        Write-Host ""
        Write-Host "Total: $($items.Count) item" -ForegroundColor Cyan
    } else {
        Write-Host "Folder AnyDesk tidak ditemukan di $env:APPDATA" -ForegroundColor Red
    }
    
    Write-Host ""
    Read-Host "Tekan ENTER untuk melanjutkan"
}

# Loop utama menu
do {
    Show-Menu
    $opcao = Read-Host "Pilih opsi (1-3)"
    
    switch ($opcao) {
        "1" { Remove-AnydeskFiles }
        "2" { Show-AnydeskFiles }
        "3" { 
            Clear-Host
            Write-Host ""
            Write-Host "Menutup program..." -ForegroundColor Cyan
            Write-Host ""
            Start-Sleep -Seconds 1
            exit
        }
        default {
            Write-Host ""
            Write-Host "Opsi tidak valid! Tekan ENTER untuk mencoba lagi..." -ForegroundColor Red
            Read-Host
        }
    }
} while ($true)