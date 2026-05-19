package com.warungku.servlet;

import com.warungku.dao.KategoriDAO;
import com.warungku.dao.ProdukDAO;
import com.warungku.model.Kategori;
import com.warungku.model.Produk;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/produk")
public class ProdukServlet extends HttpServlet {

    private ProdukDAO produkDAO = new ProdukDAO();
    private KategoriDAO kategoriDAO = new KategoriDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Ambil parameter filter kategori (opsional)
        String kategoriParam = request.getParameter("kategori");

        List<Produk> listProduk;
        List<Kategori> listKategori = kategoriDAO.getAllKategori();

        if (kategoriParam != null && !kategoriParam.isEmpty()) {
            try {
                int idKategori = Integer.parseInt(kategoriParam);
                listProduk = produkDAO.getProdukByKategori(idKategori);
                request.setAttribute("kategoriAktif", idKategori);
            } catch (NumberFormatException e) {
                listProduk = produkDAO.getAllProduk();
            }
        } else {
            listProduk = produkDAO.getAllProduk();
            request.setAttribute("kategoriAktif", 0);
        }

        request.setAttribute("listProduk", listProduk);
        request.setAttribute("listKategori", listKategori);
        request.getRequestDispatcher("/produk.jsp").forward(request, response);
    }
}
