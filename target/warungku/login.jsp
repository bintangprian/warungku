<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Agen AMIDIS</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="auth-page">
    <div class="auth-container">
        <div class="auth-logo">
            <a href="index.jsp">🛒 Agen AMIDIS</a>
        </div>
        <div class="auth-box">
            <h2>Masuk ke Akun</h2>
            <% if (request.getAttribute("sukses") != null) { %>
                <div class="alert alert-sukses"><%= request.getAttribute("sukses") %></div>
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-error"><%= request.getAttribute("error") %></div>
            <% } %>
            <form action="login" method="post">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" placeholder="Masukkan email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Masukkan password" required>
                </div>
                <button type="submit" class="btn-auth">Masuk</button>
            </form>
            <p class="auth-switch">Belum punya akun? <a href="register">Daftar sekarang</a></p>
        </div>
    </div>
</body>
</html>
