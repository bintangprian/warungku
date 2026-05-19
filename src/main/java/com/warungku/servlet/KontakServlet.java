package com.warungku.servlet;

import com.warungku.dao.PesanDAO;
import com.warungku.model.Pesan;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/kontak")
public class KontakServlet extends HttpServlet {

    private PesanDAO pesanDAO = new PesanDAO();

    // Tampilkan halaman kontak
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/kontak.jsp").forward(request, response);
    }

    // Proses form kontak yang dikirim
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nama     = request.getParameter("nama");
        String email    = request.getParameter("email");
        String isiPesan = request.getParameter("pesan");

        // Validasi sederhana
        if (nama == null || nama.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            isiPesan == null || isiPesan.trim().isEmpty()) {

            request.setAttribute("error", "Semua kolom harus diisi!");
            request.getRequestDispatcher("/kontak.jsp").forward(request, response);
            return;
        }

        Pesan pesan = new Pesan(nama.trim(), email.trim(), isiPesan.trim());
        boolean berhasil = pesanDAO.simpanPesan(pesan);

        if (berhasil) {
            request.setAttribute("sukses", "Pesan berhasil dikirim! Kami akan segera menghubungi kamu.");
        } else {
            request.setAttribute("error", "Gagal mengirim pesan. Silakan coba lagi.");
        }

        request.getRequestDispatcher("/kontak.jsp").forward(request, response);
    }
}
