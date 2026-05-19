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

-- Tabel pesan (form kontak)
CREATE TABLE IF NOT EXISTS pesan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    isi_pesan TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Data contoh kategori
INSERT INTO kategori (nama) VALUES
('Makanan'),
('Minuman'),
('Snack');

-- Data contoh produk
INSERT INTO produk (nama, deskripsi, harga, stok, gambar, id_kategori) VALUES
('Nasi Goreng Spesial', 'Nasi goreng dengan telur, ayam, dan sayuran segar', 15000, 50, 'nasi-goreng.jpg', 1),
('Mie Ayam', 'Mie ayam dengan kuah kaldu gurih dan bakso', 12000, 40, 'mie-ayam.jpg', 1),
('Ayam Bakar', 'Ayam bakar bumbu kecap dengan lalapan', 20000, 30, 'ayam-bakar.jpg', 1),
('Es Teh Manis', 'Teh manis dingin segar', 5000, 100, 'es-teh.jpg', 2),
('Es Jeruk', 'Jeruk peras segar dengan es batu', 7000, 80, 'es-jeruk.jpg', 2),
('Jus Alpukat', 'Jus alpukat segar dengan susu kental manis', 12000, 50, 'jus-alpukat.jpg', 2),
('Keripik Singkong', 'Keripik singkong renyah aneka rasa', 8000, 60, 'keripik.jpg', 3),
('Pisang Goreng', 'Pisang goreng crispy dengan topping coklat/keju', 10000, 40, 'pisang-goreng.jpg', 3);
