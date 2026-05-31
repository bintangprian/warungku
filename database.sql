-- Buat database
CREATE DATABASE IF NOT EXISTS warungku;
USE warungku;

-- Tabel kategori
CREATE TABLE IF NOT EXISTS kategori (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel produk
CREATE TABLE IF NOT EXISTS produk (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(150) NOT NULL,
    deskripsi TEXT,
    harga DECIMAL(10,2) NOT NULL,
    stok INT DEFAULT 0,
    gambar VARCHAR(255),
    id_kategori INT,
    tersedia BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_kategori) REFERENCES kategori(id)
);

-- Tabel pesan
CREATE TABLE IF NOT EXISTS pesan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    isi_pesan TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel user
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel keranjang
CREATE TABLE IF NOT EXISTS keranjang (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    id_produk INT NOT NULL,
    jumlah INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_user) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (id_produk) REFERENCES produk(id) ON DELETE CASCADE
);

-- Data kategori sembako
INSERT INTO kategori (nama) VALUES
('Beras & Tepung'),
('Minyak & Bumbu'),
('Minuman'),
('Snack & Lainnya');

-- Data produk sembako
INSERT INTO produk (nama, deskripsi, harga, stok, gambar, id_kategori) VALUES
('Beras Premium 5kg', 'Beras putih premium pulen, cocok untuk keluarga', 65000, 100, 'beras-5kg.jpg', 1),
('Beras Medium 10kg', 'Beras medium berkualitas, hemat dan enak', 110000, 80, 'beras-10kg.jpg', 1),
('Tepung Terigu 1kg', 'Tepung terigu serbaguna untuk memasak dan membuat kue', 12000, 150, 'tepung.jpg', 1),
('Minyak Goreng 2L', 'Minyak goreng kemasan 2 liter, jernih dan sehat', 28000, 120, 'minyak-2l.jpg', 2),
('Gula Pasir 1kg', 'Gula pasir putih bersih, manis alami', 15000, 200, 'gula.jpg', 2),
('Garam Dapur 250g', 'Garam dapur beryodium, untuk masak sehari-hari', 3000, 300, 'garam.jpg', 2),
('Kecap Manis 135ml', 'Kecap manis kental, cocok untuk berbagai masakan', 8000, 100, 'kecap.jpg', 2),
('Air Mineral 600ml', 'Air mineral segar dalam kemasan botol 600ml', 3000, 500, 'air-mineral.jpg', 3),
('Teh Celup 25 pcs', 'Teh celup wangi, praktis dan nikmat', 10000, 150, 'teh.jpg', 3),
('Kopi Sachet 10 pcs', 'Kopi sachet siap saji, nikmat dan praktis', 15000, 200, 'kopi.jpg', 3),
('Mie Instan', 'Mie instan berbagai rasa, cepat saji dan lezat', 3500, 500, 'mie.jpg', 4),
('Telur Ayam 1kg', 'Telur ayam segar pilihan, kaya protein', 28000, 100, 'telur.jpg', 4);

-- Akun admin default (password: admin123)
INSERT INTO user (nama, email, password, role) VALUES
('Admin', 'admin@amidis.com', 'admin123', 'admin');
