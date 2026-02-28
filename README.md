<h1 align="center">💸 KasFlow</h1>
<p align="center">
  <b>Modern Cashflow Tracker for UMKM</b>

</p>

<div align="center">
    <img height="500" alt="Screenshot 2026-02-28 202355" src="https://github.com/user-attachments/assets/f1133930-ed5b-438f-9730-cba6e1ebc299" />
</div>



## 👨‍💻 Developed By

**Ahmad Dani**   
2409116074

## 📃 Deskripsi Aplikasi 
KasFlow adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu pelaku UMKM dalam mengelola dan memantau arus kas usaha secara sederhana, cepat, dan efisien.
Aplikasi ini memungkinkan pengguna untuk mencatat pemasukan dan pengeluaran, menghitung saldo secara otomatis, serta mengelola transaksi dengan fitur CRUD lengkap (Create, Read, Update, Delete).

## ⚙️ Fitur Aplikasi
1. **Create (Tambah Data)**  
  <img height="500" alt="image" src="https://github.com/user-attachments/assets/64c2453d-ab28-429a-96f0-814c3822dd55" />

   Pengguna dapat menambahkan transaksi baru dengan mengisi:
   - Nama Transaksi
   - Jumlah Transaksi
   - Kategori (Pemasukan / Pengeluaran)
   - Tanggal Transaksi

2. **Read (Tampilkan Data)**  
  <img height="500" alt="image" src="https://github.com/user-attachments/assets/b7dcc174-23fd-43e7-bc84-3f0f2fbca25a" />

   Menampilkan daftar seluruh transaksi dalam bentuk list yang informatif.

3. **Update (Edit Data)**  
  <img height="500" alt="image" src="https://github.com/user-attachments/assets/8c9cf8f5-f6d5-4a62-82d7-26cb0af21ac7" />

   Pengguna dapat mengedit data transaksi yang telah dibuat sebelumnya.

4. **Delete (Hapus Data)**  
  <img height="500" alt="image" src="https://github.com/user-attachments/assets/846a45be-9c7c-42c1-b6f4-6d0f68c974f8" />

   Pengguna dapat menghapus transaksi, dan saldo akan otomatis diperbarui.

5. **Perhitungan Saldo Otomatis**  
  <img height="500" alt="image" src="https://github.com/user-attachments/assets/5e763bb8-1429-4d26-b465-c7aaa5e7f296" />

   Saldo dihitung berdasarkan total pemasukan dikurangi total pengeluaran.

6. **Multi Page Navigation**  
   Aplikasi terdiri dari beberapa halaman:
   - Home Page (Dashboard)
    <img height="500" alt="Screenshot 2026-02-28 202355" src="https://github.com/user-attachments/assets/f1133930-ed5b-438f-9730-cba6e1ebc299" />
     
   - Add Transaction Page
    <img height="500" alt="image" src="https://github.com/user-attachments/assets/64c2453d-ab28-429a-96f0-814c3822dd55" />
     
   - Edit Transaction Page
    <img height="500" alt="image" src="https://github.com/user-attachments/assets/8c9cf8f5-f6d5-4a62-82d7-26cb0af21ac7" />
     

---

## 🧱 Widget yang Digunakan

Dalam pengembangan aplikasi KasFlow, digunakan berbagai widget Flutter untuk membangun tampilan dan fungsionalitas aplikasi secara optimal. Berikut pengelompokan widget berdasarkan fungsinya:

### 🔹 1. Struktur Dasar Aplikasi
- **MaterialApp** → Mengatur konfigurasi utama aplikasi.
- **Scaffold** → Struktur dasar halaman (AppBar, Body, FloatingActionButton).
- **AppBar** → Menampilkan judul halaman.
- **Navigator** → Mengatur perpindahan antar halaman (Multi Page Navigation).

### 🔹 2. Layout & Tampilan
- **Container** → Membuat card, summary box, dan styling UI.
- **Column & Row** → Mengatur tata letak vertikal dan horizontal.
- **Expanded** → Mengatur pembagian ruang dalam layout.
- **ListView.builder** → Menampilkan daftar transaksi secara dinamis.
- **CircleAvatar** → Menampilkan ikon transaksi.

### 🔹 3. Input & Interaksi
- **TextField** → Input data transaksi (Nama, Jumlah, Tanggal).
- **DropdownButton** → Memilih kategori transaksi.
- **ElevatedButton** → Tombol simpan dan update transaksi.
- **FloatingActionButton** → Tombol tambah transaksi.
- **IconButton** → Tombol hapus transaksi.
- **GestureDetector** → Mendeteksi tap untuk masuk ke halaman edit.

### 🔹 4. Feedback & Validasi
- **SnackBar** → Menampilkan notifikasi jika saldo tidak mencukupi.
- **ScaffoldMessenger** → Mengatur tampilan SnackBar.

### 🔹 5. State Management
- **Provider** → Mengelola state transaksi dan perhitungan saldo secara otomatis.
