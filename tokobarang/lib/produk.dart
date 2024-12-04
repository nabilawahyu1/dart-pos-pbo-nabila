// lib/produk.dart

// Superclass Produk
class Produk {
  String nama;
  double harga;
  int stok;

  // Constructor untuk Produk
  Produk(this.nama, this.harga, this.stok);

  // Method untuk menampilkan informasi produk
  void tampilkanProduk() {
    print('$nama | Harga: Rp$harga | Stok: $stok');
  }

  // Method kategori produk, dapat dioverride di subclass
  void kategoriProduk() {
    print('Produk Umum');
  }
}

// Subclass Baju yang mewarisi Produk
class Baju extends Produk {
  String ukuran; // Atribut tambahan untuk Baju
  String warna;  // Atribut tambahan untuk Baju

  // Constructor untuk Baju
  Baju(String nama, double harga, int stok, this.ukuran, this.warna) : super(nama, harga, stok);

  // Override kategoriProduk untuk menampilkan jenis produk
  @override
  void kategoriProduk() {
    print('Produk Baju');
  }

  // Method untuk menampilkan ukuran dan warna
  void tampilkanUkuran() {
    print('Ukuran: $ukuran');
  }

  void tampilkanWarna() {
    print('Warna: $warna');
  }
}

// Subclass Celana yang mewarisi Produk
class Celana extends Produk {
  String ukuran;       // Atribut tambahan untuk Celana
  String jenisCelana;  // Atribut tambahan untuk Celana

  // Constructor untuk Celana
  Celana(String nama, double harga, int stok, this.ukuran, this.jenisCelana) : super(nama, harga, stok);

  // Override kategoriProduk untuk menampilkan jenis produk
  @override
  void kategoriProduk() {
    print('Produk Celana');
  }

  // Method untuk menampilkan ukuran dan jenis celana
  void tampilkanUkuran() {
    print('Ukuran: $ukuran');
  }

  void tampilkanJenisCelana() {
    print('Jenis Celana: $jenisCelana');
  }
}