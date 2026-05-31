package com.warungku.model;

public class Keranjang {
    private int id;
    private int idUser;
    private int idProduk;
    private int jumlah;
    private String namaProduk;
    private double hargaProduk;
    private String gambarProduk;

    public Keranjang() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getIdUser() { return idUser; }
    public void setIdUser(int idUser) { this.idUser = idUser; }

    public int getIdProduk() { return idProduk; }
    public void setIdProduk(int idProduk) { this.idProduk = idProduk; }

    public int getJumlah() { return jumlah; }
    public void setJumlah(int jumlah) { this.jumlah = jumlah; }

    public String getNamaProduk() { return namaProduk; }
    public void setNamaProduk(String namaProduk) { this.namaProduk = namaProduk; }

    public double getHargaProduk() { return hargaProduk; }
    public void setHargaProduk(double hargaProduk) { this.hargaProduk = hargaProduk; }

    public String getGambarProduk() { return gambarProduk; }
    public void setGambarProduk(String gambarProduk) { this.gambarProduk = gambarProduk; }

    public double getSubtotal() { return hargaProduk * jumlah; }

    public String getSubtotalFormatted() {
        return "Rp " + String.format("%,.0f", getSubtotal());
    }

    public String getHargaFormatted() {
        return "Rp " + String.format("%,.0f", hargaProduk);
    }
}
