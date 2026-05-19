<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Warungku</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <!-- NAVBAR -->
    <nav class="navbar">
        <div class="container">
            <a href="index.jsp" class="logo">🍜 Warungku</a>
            <ul class="nav-links">
                <li><a href="index.jsp">Beranda</a></li>
                <li><a href="produk" class="active">Menu</a></li>
                <li><a href="kontak">Kontak</a></li>
            </ul>
        </div>
    </nav>

    <!-- HEADER HALAMAN -->
    <section class="page-header">
        <h1>Menu Kami</h1>
        <p>Pilih makanan dan minuman favoritmu</p>
    </section>

    <!-- FILTER KATEGORI -->
    <section class="filter-section">
        <div class="container">
            <div class="filter-buttons">
                <a href="produk" class="btn-filter ${kategoriAktif == 0 ? 'aktif' : ''}">Semua</a>
                <c:forEach var="kat" items="${listKategori}">
                    <a href="produk?kategori=${kat.id}"
                       class="btn-filter ${kategoriAktif == kat.id ? 'aktif' : ''}">
                        ${kat.nama}
                    </a>
                </c:forEach>
            </div>
        </div>
    </section>

    <!-- DAFTAR PRODUK -->
    <section class="produk-section">
        <div class="container">
            <c:choose>
                <c:when test="${empty listProduk}">
                    <div class="produk-kosong">
                        <p>😔 Belum ada produk di kategori ini.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="produk-grid">
                        <c:forEach var="produk" items="${listProduk}">
                            <div class="produk-card">
                                <div class="produk-gambar">
                                    <c:choose>
                                        <c:when test="${not empty produk.gambar}">
                                            <img src="images/${produk.gambar}" alt="${produk.nama}"
                                                 onerror="this.src='images/default.jpg'">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="gambar-placeholder">🍴</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="produk-info">
                                    <span class="produk-kategori">${produk.namaKategori}</span>
                                    <h3>${produk.nama}</h3>
                                    <p>${produk.deskripsi}</p>
                                    <div class="produk-footer">
                                        <span class="harga">${produk.hargaFormatted}</span>
                                        <span class="stok">Stok: ${produk.stok}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
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
