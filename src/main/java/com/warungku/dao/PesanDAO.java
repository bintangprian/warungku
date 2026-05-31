package com.warungku.dao;

import com.warungku.model.Pesan;
import com.warungku.util.DBConnection;

import java.sql.*;

public class PesanDAO {

    // Simpan pesan baru dari form kontak
    public boolean simpanPesan(Pesan pesan) {
        String sql = "INSERT INTO pesan (nama, email, isi_pesan) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, pesan.getNama());
            ps.setString(2, pesan.getEmail());
            ps.setString(3, pesan.getIsiPesan());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
