# Warungku — Aplikasi Toko Sembako Online

Warungku adalah aplikasi web toko sembako berbasis Java (Jakarta EE) yang memungkinkan pengguna melihat katalog produk kebutuhan pokok, menambahkan produk ke keranjang belanja, dan menghubungi pemilik warung melalui form kontak.

---

## Teknologi yang Digunakan

- **Java 11**
- **Jakarta EE / Servlet & JSP**
- **MySQL 8** — database relasional
- **Maven** — build tool dan manajemen dependensi
- **JSTL 1.2** — tag library untuk JSP
- **Apache Tomcat 9/10** — web server

---

## Fitur Aplikasi

### Autentikasi
- Register akun baru dengan validasi (email unik, password minimal 6 karakter, konfirmasi password)
- Login berbasis session; jika sudah login otomatis redirect ke beranda
- Logout yang menghapus session sepenuhnya

### Katalog Produk
- Menampilkan semua produk sembako lengkap dengan gambar, nama, harga, dan stok
- Filter produk berdasarkan kategori (Beras & Tepung, Minyak & Bumbu, Minuman, Snack & Lainnya)
- Pencarian produk berdasarkan keyword nama

### Keranjang Belanja
- Tambah produk ke keranjang beserta jumlah yang diinginkan
- Tampilkan semua item di keranjang beserta total harga otomatis
- Hapus item dari keranjang
- Proteksi akses: hanya bisa digunakan setelah login

### Kontak
- Form pengiriman pesan kepada pemilik warung (nama, email, isi pesan)
- Pesan tersimpan langsung ke database
- Dapat diakses tanpa login

---

## Role Pengguna

| Role    | Deskripsi                                          |
|---------|----------------------------------------------------|
| `user`  | Pengguna umum (pembeli); akses ke produk, keranjang, dan kontak |
| `admin` | Administrator; data role tercatat di database dan session (fitur admin panel dalam pengembangan) |

---

## Struktur Proyek

```
warungku/
├── src/main/java/com/warungku/
│   ├── dao/                  # Akses ke database (query SQL)
│   │   ├── KategoriDAO.java
│   │   ├── KeranjangDAO.java
│   │   ├── PesanDAO.java
│   │   ├── ProdukDAO.java
│   │   └── UserDAO.java
│   ├── model/                # Representasi data / POJO
│   │   ├── Kategori.java
│   │   ├── Keranjang.java
│   │   ├── Pesan.java
│   │   ├── Produk.java
│   │   └── User.java
│   ├── servlet/              # Controller HTTP (request handler)
│   │   ├── KeranjangServlet.java
│   │   ├── KontakServlet.java
│   │   ├── LoginServlet.java
│   │   ├── LogoutServlet.java
│   │   ├── ProdukServlet.java
│   │   └── RegisterServlet.java
│   └── util/
│       └── DBConnection.java # Konfigurasi koneksi MySQL
├── src/main/webapp/
│   ├── css/style.css
│   ├── images/               # Gambar produk
│   ├── js/main.js
│   ├── WEB-INF/web.xml
│   ├── index.jsp             # Beranda
│   ├── produk.jsp            # Katalog produk
│   ├── keranjang.jsp         # Keranjang belanja
│   ├── kontak.jsp            # Form kontak
│   ├── login.jsp
│   └── register.jsp
├── database.sql              # Script inisialisasi database
└── pom.xml                   # Konfigurasi Maven
```

---

## Cara Instalasi & Menjalankan

### Prasyarat

Pastikan sudah terinstal:
- Java 11 atau lebih baru
- Apache Maven
- MySQL 8
- Apache Tomcat 9 atau 10

### 1. Clone atau ekstrak proyek

```bash
unzip warungku.zip
cd warungku
```

### 2. Buat database

Buka MySQL dan jalankan script berikut:

```bash
mysql -u root -p < database.sql
```

Script ini akan membuat database `warungku`, semua tabel yang dibutuhkan, mengisi data kategori dan produk awal, serta membuat akun admin default.

### 3. Sesuaikan konfigurasi database

Buka file `src/main/java/com/warungku/util/DBConnection.java` dan sesuaikan:

```java
private static final String USERNAME = "root";
private static final String PASSWORD = "isi_password_mysql_kamu";
```

### 4. Build aplikasi

```bash
mvn clean package
```

File hasil build akan berada di `target/warungku.war`.

### 5. Deploy ke Tomcat

Copy file `warungku.war` ke folder `webapps/` milik Tomcat, lalu jalankan Tomcat:

```bash
# Contoh di Linux/macOS
cp target/warungku.war /path/to/tomcat/webapps/
/path/to/tomcat/bin/startup.sh
```

### 6. Akses aplikasi

Buka browser dan kunjungi:

```
http://localhost:8080/warungku
```

---

## Akun Default

| Email              | Password   | Role  |
|--------------------|------------|-------|
| admin@amidis.com   | admin123   | admin |

> **Catatan keamanan:** Segera ganti password akun admin setelah pertama kali login, terutama saat deploy ke lingkungan produksi.

---

## Skema Database

| Tabel       | Deskripsi                                      |
|-------------|------------------------------------------------|
| `user`      | Data pengguna (nama, email, password, role)    |
| `produk`    | Data produk sembako (nama, harga, stok, gambar)|
| `kategori`  | Kategori produk                                |
| `keranjang` | Item yang ditambahkan pengguna ke keranjang    |
| `pesan`     | Pesan yang dikirim melalui form kontak         |

---

## Alur Penggunaan

1. Pengguna membuka aplikasi dan melakukan **register** atau **login**
2. Setelah login, pengguna masuk ke **beranda**
3. Pengguna membuka halaman **Produk** untuk melihat katalog, memfilter kategori, atau mencari produk
4. Pengguna menambahkan produk ke **Keranjang**
5. Di halaman Keranjang, pengguna dapat mengecek item dan total harga, atau menghapus item
6. Pengguna dapat menghubungi pemilik warung melalui halaman **Kontak**
7. Pengguna melakukan **Logout** saat selesai

---

## Lisensi

Proyek ini dibuat untuk keperluan pembelajaran dan pengembangan internal.
