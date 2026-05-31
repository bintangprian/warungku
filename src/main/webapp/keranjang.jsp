<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Keranjang - Agen AMIDIS</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar">
    <div class="nav-inner">
        <a href="index.jsp" class="nav-logo">🛒 Agen AMIDIS</a>
        <div class="nav-actions">
            <a href="keranjang" class="nav-cart">🛒 Keranjang</a>
            <span class="nav-user">👤 <%= session.getAttribute("namaUser") %></span>
            <a href="logout" class="btn-logout">Keluar</a>
        </div>
    </div>
</nav>

<div class="container" style="margin-top: 30px;">
    <h2 style="margin-bottom: 20px;">🛒 Keranjang Belanja</h2>

    <c:choose>
        <c:when test="${empty listKeranjang}">
            <div class="produk-kosong">
                <p>🛒 Keranjang kamu masih kosong.</p>
                <a href="produk" class="btn-hero" style="display:inline-block; margin-top:15px;">Belanja Sekarang</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="keranjang-layout">
                <div class="keranjang-list">
                    <c:forEach var="item" items="${listKeranjang}">
                        <div class="keranjang-item">
                            <div class="keranjang-img">🛍️</div>
                            <div class="keranjang-info">
                                <h3>${item.namaProduk}</h3>
                                <p class="produk-harga">${item.hargaFormatted}</p>
                                <p>Jumlah: ${item.jumlah}</p>
                                <p>Subtotal: <strong>${item.subtotalFormatted}</strong></p>
                            </div>
                            <form action="keranjang" method="post">
                                <input type="hidden" name="action" value="hapus">
                                <input type="hidden" name="idKeranjang" value="${item.id}">
                                <button type="submit" class="btn-hapus">🗑️ Hapus</button>
                            </form>
                        </div>
                    </c:forEach>
                </div>

                <div class="keranjang-summary">
                    <h3>Ringkasan Belanja</h3>
                    <div class="summary-row">
                        <span>Total</span>
                        <strong>${totalHarga}</strong>
                    </div>
                    <button class="btn-auth" onclick="alert('Fitur checkout segera hadir!')">Checkout</button>
                    <a href="produk" style="display:block; text-align:center; margin-top:10px; color:#555;">← Lanjut Belanja</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<footer class="footer" style="margin-top: 40px;">
    <div class="container">
        <p class="footer-copy">&copy; 2024 Agen AMIDIS. Semua hak dilindungi.</p>
    </div>
</footer>
</body>
</html>
