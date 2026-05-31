package com.warungku.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    // ⚠️ Sesuaikan dengan konfigurasi MySQL kamu
    private static final String HOST     = "localhost";
    private static final String PORT     = "3306";
    private static final String DATABASE = "warungku";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "123"; // isi password MySQL kamu

    private static final String URL =
        "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE +
        "?useSSL=false&serverTimezone=Asia/Jakarta&allowPublicKeyRetrieval=true";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver tidak ditemukan: " + e.getMessage());
        }
    }
}
