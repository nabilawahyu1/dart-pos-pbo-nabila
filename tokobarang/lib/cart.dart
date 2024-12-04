import 'produk.dart';

class Cart {
  List<Map<String, dynamic>> produkList = [];

  // Method untuk menambah produk ke keranjang
  void tambahProduk(Produk produk, int jumlah) {
    if (produk.stok >= jumlah) {
      produk.stok -= jumlah; // Mengurangi stok produk yang ada
      produkList.add({'produk': produk, 'jumlah': jumlah});
      print('${produk.nama} berhasil ditambahkan ke keranjang.');
    } else {
      print('Stok ${produk.nama} tidak cukup.');
    }
  }

  // Method untuk menghapus produk dari keranjang
  void hapusProduk(String namaProduk) {
    bool ditemukan = false;
    for (var item in produkList) {
      if (item['produk'].nama == namaProduk) {
        Produk produk = item['produk'];
        produk.stok += (item['jumlah'] as int); // Konversi item['jumlah'] ke int
        produkList.remove(item); // Menghapus produk dari keranjang
        print('$namaProduk dihapus dari keranjang.');
        ditemukan = true;
        break;
      }
    }
    if (!ditemukan) {
      print('$namaProduk tidak ditemukan di keranjang.');
    }
  }

  // Method untuk menampilkan produk di keranjang
  void tampilkanKeranjang() {
    if (produkList.isEmpty) {
      print('Keranjang kosong.');
    } else {
      print('Isi Keranjang:');
      for (var item in produkList) {
        Produk produk = item['produk'];
        int jumlah = item['jumlah'] as int; 
        print('${produk.nama} x$jumlah = Rp${produk.harga * jumlah}');
      }
    }
  }

  // Method untuk menghitung total harga semua produk di keranjang
  double hitungTotal() {
    double total = 0;
    for (var item in produkList) {
      Produk produk = item['produk'];
      int jumlah = item['jumlah'] as int; // Konversi item['jumlah'] ke int
      total += produk.harga * jumlah;
    }
    return total;
  }
}