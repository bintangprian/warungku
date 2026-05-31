<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.warungku.dao.KeranjangDAO" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agen AMIDIS - Sembako Lengkap</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar">
    <div class="nav-inner">
        <a href="index.jsp" class="nav-logo">🛒 Agen AMIDIS</a>
        <div class="nav-search">
            <input type="text" placeholder="Cari produk sembako..." id="searchInput">
            <button onclick="cariProduk()">🔍</button>
        </div>
        <div class="nav-actions">
            <% if (session.getAttribute("user") != null) { %>
                <a href="keranjang" class="nav-cart">
                    🛒 Keranjang
                    <%
                        com.warungku.model.User u = (com.warungku.model.User) session.getAttribute("user");
                        com.warungku.dao.KeranjangDAO kDAO = new com.warungku.dao.KeranjangDAO();
                        int jmlItem = kDAO.getJumlahItem(u.getId());
                        if (jmlItem > 0) { %><span class="cart-badge"><%= jmlItem %></span><% } %>
                </a>
                <span class="nav-user">👤 <%= session.getAttribute("namaUser") %></span>
                <a href="logout" class="btn-logout">Keluar</a>
            <% } else { %>
                <a href="login" class="btn-nav-login">Masuk</a>
                <a href="register" class="btn-nav-register">Daftar</a>
            <% } %>
        </div>
    </div>
    <!-- KATEGORI NAV -->
    <div class="nav-kategori">
        <div class="nav-inner">
            <a href="produk">Semua Produk</a>
            <a href="produk?kategori=1">Beras & Tepung</a>
            <a href="produk?kategori=2">Minyak & Bumbu</a>
            <a href="produk?kategori=3">Minuman</a>
            <a href="produk?kategori=4">Snack & Lainnya</a>
            <a href="kontak">Kontak</a>
        </div>
    </div>
</nav>

<!-- HERO BANNER -->
<section class="hero-banner">
    <div class="hero-content">
        <h1>Belanja Sembako <span>Mudah & Hemat</span></h1>
        <p>Kebutuhan dapur lengkap tersedia di Agen AMIDIS.<br>Harga terjangkau, kualitas terjamin!</p>
        <a href="produk" class="btn-hero">Belanja Sekarang</a>
    </div>
</section>

<!-- KATEGORI GRID -->
<section class="kategori-section">
    <div class="container">
        <h2 class="section-title">Kategori Belanja</h2>
        <div class="kategori-grid">
            <a href="produk?kategori=1" class="kategori-card">
                <div class="kat-icon">🌾</div>
                <span>Beras & Tepung</span>
            </a>
            <a href="produk?kategori=2" class="kategori-card">
                <div class="kat-icon">🧴</div>
                <span>Minyak & Bumbu</span>
            </a>
            <a href="produk?kategori=3" class="kategori-card">
                <div class="kat-icon">🥤</div>
                <span>Minuman</span>
            </a>
            <a href="produk?kategori=4" class="kategori-card">
                <div class="kat-icon">🍜</div>
                <span>Snack & Lainnya</span>
            </a>
        </div>
    </div>
</section>

<!-- PRODUK TERBARU -->
<section class="produk-section">
    <div class="container">
        <div class="section-header">
            <h2 class="section-title">Produk Unggulan</h2>
            <a href="produk" class="lihat-semua">Lihat Semua →</a>
        </div>
        <%
            com.warungku.dao.ProdukDAO pDAO = new com.warungku.dao.ProdukDAO();
            java.util.List<com.warungku.model.Produk> produkList = pDAO.getAllProduk();
            int count = 0;
            for (com.warungku.model.Produk p : produkList) {
                if (count >= 8) break;
        %>
        <div class="produk-grid" id="produkGrid">
        <%      count++; %>
            <div class="produk-card">
                <div class="produk-img">
                    <div class="img-placeholder">🛍️</div>
                </div>
                <div class="produk-detail">
                    <p class="produk-kategori"><%= p.getNamaKategori() %></p>
                    <h3><%= p.getNama() %></h3>
                    <p class="produk-harga"><%= p.getHargaFormatted() %></p>
                    <p class="produk-stok">Stok: <%= p.getStok() %></p>
                    <% if (session.getAttribute("user") != null) { %>
                    <form action="keranjang" method="post">
                        <input type="hidden" name="action" value="tambah">
                        <input type="hidden" name="idProduk" value="<%= p.getId() %>">
                        <input type="hidden" name="jumlah" value="1">
                        <button type="submit" class="btn-tambah">+ Tambah</button>
                    </form>
                    <% } else { %>
                    <a href="login" class="btn-tambah">+ Tambah</a>
                    <% } %>
                </div>
            </div>
        <% } %>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer class="footer">
    <div class="container">
        <div class="footer-grid">
            <div>
                <h3>🛒 Agen AMIDIS</h3>
                <p>Toko sembako terpercaya untuk kebutuhan sehari-hari.</p>
            </div>
            <div>
                <h3>Informasi</h3>
                <p>📍 Jl. Muararajeun Baru 3 No. 1A</p>
                <p>📞 08953652282</p>
                <p>🕐 06.00 - 21.00 WIB</p>
            </div>
            <div>
                <h3>Menu</h3>
                <a href="produk">Produk</a>
                <a href="kontak">Kontak</a>
                <a href="login">Login</a>
                <a href="register">Daftar</a>
            </div>
        </div>
        <p class="footer-copy">&copy; 2024 Agen AMIDIS. Semua hak dilindungi.</p>
    </div>
</footer>

<script src="js/main.js"></script>
<script>
function cariProduk() {
    var kata = document.getElementById('searchInput').value;
    if (kata.trim()) window.location.href = 'produk?cari=' + encodeURIComponent(kata);
}
document.getElementById('searchInput').addEventListener('keypress', function(e) {
    if (e.key === 'Enter') cariProduk();
});
</script>
</body>
</html>
