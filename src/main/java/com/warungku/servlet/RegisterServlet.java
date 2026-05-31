package com.warungku.servlet;

import com.warungku.dao.UserDAO;
import com.warungku.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("index.jsp");
            return;
        }
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String nama     = request.getParameter("nama");
        String email    = request.getParameter("email");
        String password = request.getParameter("password");
        String konfirmasi = request.getParameter("konfirmasi");

        // Validasi
        if (nama == null || nama.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Semua kolom harus diisi!");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(konfirmasi)) {
            request.setAttribute("error", "Password dan konfirmasi password tidak sama!");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        if (password.length() < 6) {
            request.setAttribute("error", "Password minimal 6 karakter!");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        User user = new User(nama.trim(), email.trim(), password.trim(), "user");
        boolean berhasil = userDAO.register(user);

        if (berhasil) {
            request.setAttribute("sukses", "Akun berhasil dibuat! Silakan login.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Email sudah terdaftar! Gunakan email lain.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
