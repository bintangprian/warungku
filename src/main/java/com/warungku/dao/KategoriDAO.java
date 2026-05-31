package com.warungku.dao;

import com.warungku.model.Kategori;
import com.warungku.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class KategoriDAO {

    // Ambil semua kategori
    public List<Kategori> getAllKategori() {
        List<Kategori> list = new ArrayList<>();
        String sql = "SELECT * FROM kategori ORDER BY id";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Kategori k = new Kategori();
                k.setId(rs.getInt("id"));
                k.setNama(rs.getString("nama"));
                list.add(k);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
