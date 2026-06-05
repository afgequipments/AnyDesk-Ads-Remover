# 🧹 AnyDesk Ads Remover

[![PowerShell](https://img.shields.io/badge/PowerShell-%235391FE.svg?style=for-the-badge&logo=powershell&logoColor=white)](https://learn.microsoft.com/en-us/powershell/)
[![Platform](https://img.shields.io/badge/Platform-Windows-blue?style=for-the-badge&logo=windows)](https://www.microsoft.com/windows)

Script interaktif berbasis **PowerShell** yang dirancang untuk membersihkan file konfigurasi AnyDesk (seperti iklan/propaganda, log, dan trace data) secara otomatis pada folder `AppData\Roaming`. Script ini dibuat secara aman dengan metode penyaringan (*filtering*) agar **tidak menghapus** data penting Anda.

---

## ✨ Fitur Utama

* **Pembersihan Selektif (Aman):** Menghapus file sampah dan konfigurasi iklan, tetapi **melindungi** file identitas utama (`user.conf`) dan folder cache visual (`thumbnails`).
* **Interaktif & Informatif:** Dilengkapi dengan menu CLI (*Command Line Interface*) yang bersih dan pewarnaan teks untuk status proses.
* **Pratinjau File:** Anda dapat melihat daftar file yang ada di dalam direktori AnyDesk sebelum memutuskan untuk menghapusnya.

---

## 🔧 File yang Dilindungi vs Dihapus

| Nama File / Folder | Status | Keterangan |
| :--- | :---: | :--- |
| `user.conf` | 🛡️ **Aman** | Menyimpan ID AnyDesk dan pengaturan penting pengguna. |
| Folder `thumbnails` | 🛡️ **Aman** | Menyimpan gambar/ikon komputer yang pernah diremote. |
| `service.conf` | ❌ *Dihapus* | Seringkali memuat konfigurasi iklan/lisensi komersial. |
| `system.conf` | ❌ *Dihapus* | File konfigurasi sistem berkala. |
| File `.trace` / `.log` | ❌ *Dihapus* | File riwayat koneksi dan log aktivitas. |

---

## 💻 Cara Penggunaan

Ikuti langkah-langkah di bawah ini untuk mengunduh dan menjalankan script menggunakan Git dan File Batch:

### 1. Kloning Repositori (Git Clone)
Buka Terminal atau Command Prompt (CMD) Anda, lalu jalankan perintah berikut untuk mengunduh repositori ini ke komputer Anda:
```bash
git clone https://github.com/afgequipments/AnyDesk-Ads-Remover.git
```

### 2. Masuk ke Direktori

Pindah ke folder hasil kloning yang baru saja dibuat:
```
cd AnyDesk-Ads-Remover
```

### 3. Jalankan File Batch (main.bat)

Di dalam folder tersebut, Anda akan menemukan file bernama ```main.bat``` yang berfungsi sebagai peluncur otomatis.
1. Buka File Explorer dan cari file ```main.bat```.
2. Klik kanan pada file ```main.bat```.
3. Pilih opsi Run as Administrator (Jalankan sebagai Administrator).
4. Jendela konsol akan terbuka dan menu interaktif Pengelola File AnyDesk siap digunakan.
