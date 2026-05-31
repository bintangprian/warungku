package com.warungku.dao;

import com.warungku.model.Keranjang;
import com.warungku.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class KeranjangDAO {

    // Ambil semua item keranjang milik user
    public List<Keranjang> getKeranjangByUser(int idUser) {
        List<Keranjang> list = new ArrayList<>();
        String sql = "SELECT k.*, p.nama AS nama_produk, p.harga AS harga_produk, p.gambar AS gambar_produk " +
                     "FROM keranjang k JOIN produk p ON k.id_produk = p.id " +
                     "WHERE k.id_user = ? ORDER BY k.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Keranjang k = new Keranjang();
                k.setId(rs.getInt("id"));
                k.setIdUser(rs.getInt("id_user"));
                k.setIdProduk(rs.getInt("id_produk"));
                k.setJumlah(rs.getInt("jumlah"));
                k.setNamaProduk(rs.getString("nama_produk"));
                k.setHargaProduk(rs.getDouble("harga_produk"));
                k.setGambarProduk(rs.getString("gambar_produk"));
                list.add(k);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Tambah produk ke keranjang
    public boolean tambahKeranjang(int idUser, int idProduk, int jumlah) {
        // Cek apakah produk sudah ada di keranjang
        String cek = "SELECT id, jumlah FROM keranjang WHERE id_user = ? AND id_produk = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(cek)) {
            ps.setInt(1, idUser);
            ps.setInt(2, idProduk);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Update jumlah
                int jumlahBaru = rs.getInt("jumlah") + jumlah;
                String update = "UPDATE keranjang SET jumlah = ? WHERE id = ?";
                PreparedStatement psUpdate = conn.prepareStatement(update);
                psUpdate.setInt(1, jumlahBaru);
                psUpdate.setInt(2, rs.getInt("id"));
                return psUpdate.executeUpdate() > 0;
            } else {
                // Insert baru
                String insert = "INSERT INTO keranjang (id_user, id_produk, jumlah) VALUES (?, ?, ?)";
                PreparedStatement psInsert = conn.prepareStatement(insert);
                psInsert.setInt(1, idUser);
                psInsert.setInt(2, idProduk);
                psInsert.setInt(3, jumlah);
                return psInsert.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Hapus item dari keranjang
    public boolean hapusKeranjang(int idKeranjang, int idUser) {
        String sql = "DELETE FROM keranjang WHERE id = ? AND id_user = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idKeranjang);
            ps.setInt(2, idUser);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Hitung total harga keranjang
    public double getTotalHarga(int idUser) {
        String sql = "SELECT SUM(k.jumlah * p.harga) AS total " +
                     "FROM keranjang k JOIN produk p ON k.id_produk = p.id " +
                     "WHERE k.id_user = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getDouble("total");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Hitung jumlah item di keranjang
    public int getJumlahItem(int idUser) {
        String sql = "SELECT COUNT(*) AS total FROM keranjang WHERE id_user = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, idUser);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("total");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
