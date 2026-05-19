<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Warungku - Makanan Enak, Harga Terjangkau</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- NAVBAR -->
    <nav class="navbar">
        <div class="container">
            <a href="index.jsp" class="logo">🍜 Warungku</a>
            <ul class="nav-links">
                <li><a href="index.jsp" class="active">Beranda</a></li>
                <li><a href="produk">Menu</a></li>
                <li><a href="kontak">Kontak</a></li>
            </ul>
        </div>
    </nav>

    <!-- HERO SECTION -->
    <section class="hero">
        <div class="hero-content">
            <h1>Selamat Datang di <span>Warungku</span></h1>
            <p>Nikmati aneka makanan dan minuman lezat dengan harga terjangkau.<br>
               Dibuat dengan cinta, untuk perut yang lapar!</p>
            <a href="produk" class="btn btn-primary">Lihat Menu Kami</a>
            <a href="kontak" class="btn btn-outline">Hubungi Kami</a>
        </div>
    </section>

    <!-- FITUR / KEUNGGULAN -->
    <section class="fitur">
        <div class="container">
            <h2 class="section-title">Kenapa Pilih Warungku?</h2>
            <div class="fitur-grid">
                <div class="fitur-card">
                    <div class="fitur-icon">🍽️</div>
                    <h3>Menu Beragam</h3>
                    <p>Tersedia berbagai pilihan makanan, minuman, dan snack untuk semua selera.</p>
                </div>
                <div class="fitur-card">
                    <div class="fitur-icon">💰</div>
                    <h3>Harga Terjangkau</h3>
                    <p>Harga bersahabat tanpa mengorbankan kualitas dan rasa.</p>
                </div>
                <div class="fitur-card">
                    <div class="fitur-icon">✨</div>
                    <h3>Bahan Segar</h3>
                    <p>Semua bahan dipilih segar setiap hari untuk menjaga kualitas terbaik.</p>
                </div>
                <div class="fitur-card">
                    <div class="fitur-icon">⚡</div>
                    <h3>Pelayanan Cepat</h3>
                    <p>Pesanan kamu disiapkan dengan cepat tanpa harus menunggu lama.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Warungku. Semua hak dilindungi.</p>
            <p>📍 Jl. Contoh No. 123, Bandung | 📞 0812-3456-7890</p>
        </div>
    </footer>

    <script src="js/main.js"></script>
</body>
</html>
