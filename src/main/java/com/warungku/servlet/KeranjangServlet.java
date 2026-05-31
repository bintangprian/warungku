package com.warungku.servlet;

import com.warungku.dao.KeranjangDAO;
import com.warungku.model.Keranjang;
import com.warungku.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/keranjang")
public class KeranjangServlet extends HttpServlet {

    private KeranjangDAO keranjangDAO = new KeranjangDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        User user = (User) session.getAttribute("user");
        List<Keranjang> listKeranjang = keranjangDAO.getKeranjangByUser(user.getId());
        double total = keranjangDAO.getTotalHarga(user.getId());

        request.setAttribute("listKeranjang", listKeranjang);
        request.setAttribute("totalHarga", "Rp " + String.format("%,.0f", total));
        request.getRequestDispatcher("/keranjang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");

        if ("tambah".equals(action)) {
            int idProduk = Integer.parseInt(request.getParameter("idProduk"));
            int jumlah = Integer.parseInt(request.getParameter("jumlah"));
            keranjangDAO.tambahKeranjang(user.getId(), idProduk, jumlah);
            response.sendRedirect("keranjang");

        } else if ("hapus".equals(action)) {
            int idKeranjang = Integer.parseInt(request.getParameter("idKeranjang"));
            keranjangDAO.hapusKeranjang(idKeranjang, user.getId());
            response.sendRedirect("keranjang");
        }
    }
}
