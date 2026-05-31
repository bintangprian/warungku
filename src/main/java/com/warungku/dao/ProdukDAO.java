package com.warungku.dao;

import com.warungku.model.Produk;
import com.warungku.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProdukDAO {

    // Ambil semua produk
    public List<Produk> getAllProduk() {
        List<Produk> list = new ArrayList<>();
        String sql = "SELECT p.*, k.nama AS nama_kategori " +
                     "FROM produk p LEFT JOIN kategori k ON p.id_kategori = k.id " +
                     "WHERE p.tersedia = TRUE ORDER BY p.id";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Ambil produk berdasarkan kategori
    public List<Produk> getProdukByKategori(int idKategori) {
        List<Produk> list = new ArrayList<>();
        String sql = "SELECT p.*, k.nama AS nama_kategori " +
                     "FROM produk p LEFT JOIN kategori k ON p.id_kategori = k.id " +
                     "WHERE p.id_kategori = ? AND p.tersedia = TRUE ORDER BY p.id";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idKategori);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Ambil produk berdasarkan ID
    public Produk getProdukById(int id) {
        String sql = "SELECT p.*, k.nama AS nama_kategori " +
                     "FROM produk p LEFT JOIN kategori k ON p.id_kategori = k.id " +
                     "WHERE p.id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Mapping ResultSet ke objek Produk
    private Produk mapRow(ResultSet rs) throws SQLException {
        Produk p = new Produk();
        p.setId(rs.getInt("id"));
        p.setNama(rs.getString("nama"));
        p.setDeskripsi(rs.getString("deskripsi"));
        p.setHarga(rs.getDouble("harga"));
        p.setStok(rs.getInt("stok"));
        p.setGambar(rs.getString("gambar"));
        p.setIdKategori(rs.getInt("id_kategori"));
        p.setNamaKategori(rs.getString("nama_kategori"));
        p.setTersedia(rs.getBoolean("tersedia"));
        return p;
    }

    // Cari produk berdasarkan kata kunci
    public List<Produk> cariProduk(String kata) {
        List<Produk> list = new ArrayList<>();
        String sql = "SELECT p.*, k.nama AS nama_kategori " +
                     "FROM produk p LEFT JOIN kategori k ON p.id_kategori = k.id " +
                     "WHERE p.tersedia = TRUE AND (p.nama LIKE ? OR p.deskripsi LIKE ?) ORDER BY p.id";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String keyword = "%" + kata + "%";
            ps.setString(1, keyword);
            ps.setString(2, keyword);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}