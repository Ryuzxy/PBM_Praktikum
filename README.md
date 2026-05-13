# Praktikum PBM 2026 - Aplikasi Katalog Produk

Aplikasi Flutter ini dibangun sebagai bagian dari Praktikum Pemrograman Berbasis Mobile (PBM). Aplikasi ini mensimulasikan sistem katalog produk sederhana yang terhubung dengan API backend.

## Fitur Utama

1. **Autentikasi (Login)**
   - Pengguna dapat masuk menggunakan NIM sebagai Username dan Password.
   - Aplikasi menggunakan `flutter_secure_storage` untuk menyimpan token autentikasi secara aman.

2. **Katalog Produk**
   - Menampilkan daftar produk (draf produk) yang diambil dari REST API.
   - Mendukung penanganan struktur data JSON yang bersarang (*nested JSON/pagination*).

3. **Tambah Produk Baru**
   - Formulir interaktif untuk menambahkan draf produk baru ke dalam katalog.
   - Input divalidasi agar tidak boleh kosong dan khusus tipe angka pada kolom harga.

4. **Pengumpulan Tugas**
   - Halaman khusus untuk mengumpulkan URL GitHub proyek akhir langsung dari dalam aplikasi.
   
## Screenshots

Berikut adalah beberapa tangkapan layar dari antarmuka aplikasi:

| Halaman | Tampilan |
| :---: | :---: |
| **Screenshot 1** | <img src="Img/Screenshot%202026-05-13%20191020.png" width="250"> |
| **Screenshot 2** | <img src="Img/Screenshot%202026-05-13%20191042.png" width="250"> |
| **Screenshot 3** | <img src="Img/Screenshot%202026-05-13%20191648.png" width="250"> |
| **Screenshot 4** | <img src="Img/Screenshot%202026-05-13%20191915.png" width="250"> |
| **Screenshot 5** | <img src="Img/Screenshot%202026-05-13%20192654.png" width="250"> |
| **Screenshot 6** | <img src="Img/Screenshot%202026-05-13%20192727.png" width="250"> |

### Tampilan di Perangkat
| | |
| :---: | :---: |
| <img src="Img/WhatsApp%20Image%202026-05-13%20at%2019.43.00.jpeg" width="250"> | <img src="Img/WhatsApp%20Image%202026-05-13%20at%2019.43.00%20(1).jpeg" width="250"> |
| <img src="Img/WhatsApp%20Image%202026-05-13%20at%2019.43.01.jpeg" width="250"> | <img src="Img/WhatsApp%20Image%202026-05-13%20at%2019.43.01%20(1).jpeg" width="250"> |

## Struktur Folder

- `lib/Login/`: Logika dan antarmuka untuk halaman Login.
- `lib/Katalog/`: Antarmuka untuk daftar katalog produk dan tambah produk baru.
- `lib/Tugas/`: Antarmuka formulir pengumpulan tugas akhir.
- `lib/api/`: Model data dan layanan (services) untuk berinteraksi dengan API backend.

## Menjalankan Aplikasi

Pastikan Flutter SDK sudah terpasang. Jalankan perintah berikut di terminal:

```bash
flutter pub get
flutter run
```
