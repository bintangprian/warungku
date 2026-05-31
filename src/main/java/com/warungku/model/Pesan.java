package com.warungku.model;

public class Pesan {
    private int id;
    private String nama;
    private String email;
    private String isiPesan;

    public Pesan() {}

    public Pesan(String nama, String email, String isiPesan) {
        this.nama = nama;
        this.email = email;
        this.isiPesan = isiPesan;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNama() { return nama; }
    public void setNama(String nama) { this.nama = nama; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getIsiPesan() { return isiPesan; }
    public void setIsiPesan(String isiPesan) { this.isiPesan = isiPesan; }
}
