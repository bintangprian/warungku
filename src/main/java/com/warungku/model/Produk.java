package com.warungku.model;

public class Produk {
    private int id;
    private String nama;
    private String deskripsi;
    private double harga;
    private int stok;
    private String gambar;
    private int idKategori;
    private String namaKategori;
    private boolean tersedia;

    public Produk() {}

    public Produk(int id, String nama, String deskripsi, double harga,
                  int stok, String gambar, int idKategori, boolean tersedia) {
        this.id = id;
        this.nama = nama;
        this.deskripsi = deskripsi;
        this.harga = harga;
        this.stok = stok;
        this.gambar = gambar;
        this.idKategori = idKategori;
        this.tersedia = tersedia;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }

    public String getDeskripsi() { return deskripsi; }
    public void setDeskripsi(String deskripsi) { this.deskripsi = deskripsi; }

    public double getHarga() { return harga; }
    public void setHarga(double harga) { this.harga = harga; }

    public int getStok() { return stok; }
    public void setStok(int stok) { this.stok = stok; }

    public String getGambar() { return gambar; }
    public void setGambar(String gambar) { this.gambar = gambar; }

    public int getIdKategori() { return idKategori; }
    public void setIdKategori(int idKategori) { this.idKategori = idKategori; }

    public String getNamaKategori() { return namaKategori; }
    public void setNamaKategori(String namaKategori) { this.namaKategori = namaKategori; }

    public boolean isTersedia() { return tersedia; }
    public void setTersedia(boolean tersedia) { this.tersedia = tersedia; }

    // Format harga ke Rupiah
    public String getHargaFormatted() {
        return "Rp " + String.format("%,.0f", harga);
    }
}
