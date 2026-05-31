<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produk - Agen AMIDIS</title>
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
                <a href="keranjang" class="nav-cart">🛒 Keranjang</a>
                <span class="nav-user">👤 <%= session.getAttribute("namaUser") %></span>
                <a href="logout" class="btn-logout">Keluar</a>
            <% } else { %>
                <a href="login" class="btn-nav-login">Masuk</a>
                <a href="register" class="btn-nav-register">Daftar</a>
            <% } %>
        </div>
    </div>
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

<!-- FILTER & PRODUK -->
<div class="container" style="margin-top: 20px;">
    <div class="produk-layout">

        <!-- SIDEBAR FILTER -->
        <div class="sidebar">
            <h3>Kategori</h3>
            <ul class="filter-list">
                <li><a href="produk" class="${kategoriAktif == 0 ? 'aktif' : ''}">Semua Produk</a></li>
                <c:forEach var="kat" items="${listKategori}">
                    <li><a href="produk?kategori=${kat.id}" class="${kategoriAktif == kat.id ? 'aktif' : ''}">${kat.nama}</a></li>
                </c:forEach>
            </ul>
        </div>

        <!-- PRODUK GRID -->
        <div class="produk-main">
            <div class="produk-header">
                <h2>
                    <c:choose>
                        <c:when test="${not empty cariKata}">Hasil pencarian: "${cariKata}"</c:when>
                        <c:otherwise>Semua Produk</c:otherwise>
                    </c:choose>
                </h2>
                <span>${listProduk.size()} produk</span>
            </div>

            <c:choose>
                <c:when test="${empty listProduk}">
                    <div class="produk-kosong">
                        <p>😔 Produk tidak ditemukan.</p>
                        <a href="produk">Lihat semua produk</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="produk-grid">
                        <c:forEach var="produk" items="${listProduk}">
                            <div class="produk-card">
                                <div class="produk-img">
                                    <div class="img-placeholder">🛍️</div>
                                </div>
                                <div class="produk-detail">
                                    <p class="produk-kategori">${produk.namaKategori}</p>
                                    <h3>${produk.nama}</h3>
                                    <p class="produk-desc">${produk.deskripsi}</p>
                                    <p class="produk-harga">${produk.hargaFormatted}</p>
                                    <p class="produk-stok">Stok: ${produk.stok}</p>
                                    <% if (session.getAttribute("user") != null) { %>
                                    <form action="keranjang" method="post">
                                        <input type="hidden" name="action" value="tambah">
                                        <input type="hidden" name="idProduk" value="${produk.id}">
                                        <input type="hidden" name="jumlah" value="1">
                                        <button type="submit" class="btn-tambah">+ Tambah</button>
                                    </form>
                                    <% } else { %>
                                    <a href="login" class="btn-tambah">+ Tambah</a>
                                    <% } %>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- FOOTER -->
<footer class="footer">
    <div class="container">
        <p class="footer-copy">&copy; 2024 Agen AMIDIS. Semua hak dilindungi. | 📍 Jl. Muararajeun Baru 3 No. 1A | 📞 08953652282</p>
    </div>
</footer>

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
