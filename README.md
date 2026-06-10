# 🧹 AnyDesk Ads Remover & Hard Resetter

[![Batch Script](https://img.shields.io/badge/Batch_Script-%234D4D4D.svg?style=for-the-badge&logo=windows-terminal&logoColor=white)](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)
[![Platform](https://img.shields.io/badge/Platform-Windows-blue?style=for-the-badge&logo=windows)](https://www.microsoft.com/windows)

Script otomatis berbasis **Batch File (.bat)** yang dirancang untuk menghilangkan pop-up *Commercial Use* / iklan pada AnyDesk dengan metode **Hard Reset**. Script ini bekerja secara agresif membersihkan seluruh direktori AnyDesk untuk memulihkan status penggunaan personal (*Personal Use*).

---

## ⚠️ Konsekuensi Penting (Harus Dibaca)

Script ini menggunakan metode pembersihan total (*Total Wipeout*). Karena server AnyDesk mengunci status iklan komersial pada ID perangkat Anda, maka:

* ✨ **Iklan/Pop-up Komersial:** Akan hilang sepenuhnya.
* 🆔 **ID AnyDesk Anda:** Akan di-reset dan berubah menjadi 9 digit angka baru.
* 🕒 **Riwayat Koneksi & Pengaturan:** Seluruh daftar komputer yang pernah Anda remote (*Recent Connections*), password *Unattended Access*, dan pengaturan personal lainnya **akan terhapus secara permanen** karena seluruh folder konfigurasi dibersihkan tanpa sisa.

---

## ✨ Fitur Utama Script

* **Pembersihan Multi-Direktori:** Menghapus folder AnyDesk di `AppData` (tingkat pengguna) dan `ProgramData` (tingkat sistem) tempat lisensi komersial dikunci.
* **Manajemen Windows Service:** Menghentikan dan menonaktifkan sementara `AnyDesk Service` di latar belakang secara otomatis agar file sistem yang terkunci bisa dihapus dengan lancar.
* **Otomatis & Praktis:** Tidak ada menu interaktif. Cukup jalankan sekali sebagai Administrator, dan script akan menyelesaikan tugasnya dalam hitungan detik.

---

## 🔧 Detail Struktur Pembersihan

| Nama Folder | Aksi Script | Dampak pada Pengguna |
| :--- | :---: | :--- |
| `%appdata%\AnyDesk` | ❌ **Dihapus Total** | Menghapus ID lama, pengaturan *user*, dan riwayat remote (*recent connections*). |
| `%programdata%\AnyDesk` | ❌ **Dihapus Total** | Menghapus konfigurasi sistem dan jejak lisensi komersial dari AnyDesk Service. |

---

## 💻 Cara Penggunaan

1. Unduh atau salin kode *script* ke dalam file baru dan beri nama **`main.bat`**.
2. Pastikan aplikasi AnyDesk sudah ditutup.
3. **Klik kanan** pada file `main.bat` tersebut.
4. Pilih opsi **Run as Administrator** (Jalankan sebagai Administrator).
5. Tunggu proses konsol selesai hingga muncul pesan sukses, lalu tekan tombol apa saja untuk keluar.
6. Buka kembali AnyDesk Anda. Aplikasi akan berjalan dalam kondisi bersih dengan ID baru yang bebas iklan.