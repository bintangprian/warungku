<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kontak - Agen AMIDIS</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- NAVBAR -->
    <nav class="navbar">
        <div class="container">
            <a href="index.jsp" class="logo">💧 Agen AMIDIS</a>
            <ul class="nav-links">
                <li><a href="index.jsp">Beranda</a></li>
                <li><a href="produk">Produk</a></li>
                <li><a href="kontak" class="active">Kontak</a></li>
            </ul>
        </div>
    </nav>

    <!-- HEADER -->
    <section class="page-header">
        <h1>Hubungi Kami</h1>
        <p>Ada pertanyaan atau saran? Kami siap membantu!</p>
    </section>

    <!-- KONTEN KONTAK -->
    <section class="kontak-section">
        <div class="container">
            <div class="kontak-wrapper">

                <!-- INFO KONTAK -->
                <div class="kontak-info">
                    <h2>Informasi Agen AMIDIS</h2>
                    <div class="info-item">
                        <span class="info-icon">📍</span>
                        <div>
                            <strong>Alamat</strong>
                            <p>Jl. Muararajeun Baru 3 No. 1A</p>
                        </div>
                    </div>
                    <div class="info-item">
                        <span class="info-icon">📞</span>
                        <div>
                            <strong>Telepon</strong>
                            <p>08953652282</p>
                        </div>
                    </div>
                    <div class="info-item">
                        <span class="info-icon">🕐</span>
                        <div>
                            <strong>Jam Buka</strong>
                            <p>Senin - Minggu: 06.00 - 21.00 WIB</p>
                        </div>
                    </div>
                    <div class="info-item">
                        <span class="info-icon">💧</span>
                        <div>
                            <strong>Produk</strong>
                            <p>Air Minum Galon AMIDIS</p>
                        </div>
                    </div>
                </div>

                <!-- FORM KONTAK -->
                <div class="kontak-form">
                    <h2>Kirim Pesan</h2>

                    <!-- Notifikasi sukses -->
                    <% if (request.getAttribute("sukses") != null) { %>
                        <div class="alert alert-sukses">
                            <%= request.getAttribute("sukses") %>
                        </div>
                    <% } %>

                    <!-- Notifikasi error -->
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-error">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <form action="kontak" method="post">
                        <div class="form-group">
                            <label for="nama">Nama Lengkap</label>
                            <input type="text" id="nama" name="nama"
                                   placeholder="Masukkan nama kamu" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email"
                                   placeholder="Masukkan email kamu" required>
                        </div>
                        <div class="form-group">
                            <label for="pesan">Pesan</label>
                            <textarea id="pesan" name="pesan" rows="5"
                                      placeholder="Tulis pesanmu di sini..." required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-full">
                            Kirim Pesan 📨
                        </button>
                    </form>
                </div>

            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Agen AMIDIS. Semua hak dilindungi.</p>
            <p>📍 Jl. Muararajeun Baru 3 No. 1A | 📞 08953652282</p>
        </div>
    </footer>

    <script src="js/main.js"></script>
</body>
</html>
