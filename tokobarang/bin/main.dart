// bin/main.dart
import 'dart:io';
import '../lib/produk.dart';
import '../lib/cart.dart';
import '../lib/cashier.dart';
import '../lib/transaksi.dart';

void main() {
  // Daftar produk yang ada di toko
  List<Produk> daftarProduk = [
    Baju('Kaos Polos', 75000, 20, 'L', 'Merah'),
    Celana('Jeans Pria', 150000, 15, 'M', 'Jeans'),
    Baju('Sweater', 120000, 10, 'S', 'Hitam'),
    Celana('Celana Chino', 130000, 8, 'L', 'Chino'),
  ];

  // Membuat objek Kasir dan Keranjang
  Cashier kasir = Cashier('Andi');
  Cart keranjang = Cart();

  while (true) {
    print('\n=== SISTEM KASIR ===');
    print('1. Lihat Daftar Produk');
    print('2. Tambahkan Produk ke Keranjang');
    print('3. Lihat Keranjang');
    print('4. Hapus Produk dari Keranjang');
    print('5. Buat Transaksi');
    print('6. Lihat Riwayat Transaksi');
    print('7. Keluar');
    stdout.write('Pilih menu: ');
    String? pilihan = stdin.readLineSync();

    if (pilihan == '1') {
      print('\n=== Daftar Produk ===');
      for (int i = 0; i < daftarProduk.length; i++) {
        Produk produk = daftarProduk[i];
        produk.kategoriProduk(); // Menampilkan kategori produk (Baju/Celana)
        produk.tampilkanProduk();
        print('----------------------');
      }
    } else if (pilihan == '2') {
      print('\nPilih produk berdasarkan nomor:');
      int? nomorProduk = int.tryParse(stdin.readLineSync() ?? '');
      if (nomorProduk == null || nomorProduk < 1 || nomorProduk > daftarProduk.length) {
        print('Nomor produk tidak valid.');
        continue;
      }
      stdout.write('Masukkan jumlah: ');
      int? jumlah = int.tryParse(stdin.readLineSync() ?? '');
      if (jumlah == null || jumlah <= 0) {
        print('Jumlah tidak valid.');
        continue;
      }
      keranjang.tambahProduk(daftarProduk[nomorProduk - 1], jumlah);
    } else if (pilihan == '3') {
      keranjang.tampilkanKeranjang();
    } else if (pilihan == '4') {
      print('Masukkan nama produk yang akan dihapus: ');
      String? namaProduk = stdin.readLineSync();
      if (namaProduk != null && namaProduk.isNotEmpty) {
        keranjang.hapusProduk(namaProduk);
      } else {
        print('Nama produk tidak valid.');
      }
    } else if (pilihan == '5') {
      kasir.buatTransaksi(keranjang);
    } else if (pilihan == '6') {
      kasir.tampilkanRiwayat();
    } else if (pilihan == '7') {
      print('Keluar dari sistem.');
      break;
    } else {
      print('Pilihan tidak valid.');
    }
  }
}