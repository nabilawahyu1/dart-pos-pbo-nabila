// lib/cashier.dart
import 'cart.dart';
import 'produk.dart';
import 'transaksi.dart';

class Cashier {
  String nama;
  List<Transaction> riwayatTransaksi = [];

  // Constructor Cashier
  Cashier(this.nama);

  // Method untuk membuat transaksi
  void buatTransaksi(Cart cart) {
    if (cart.produkList.isEmpty) {
      print('Keranjang kosong. Tidak bisa melakukan transaksi.');
      return;
    }
    double total = cart.hitungTotal();
    Transaction transaksi = Transaction(DateTime.now(), cart.produkList, total);
    riwayatTransaksi.add(transaksi);
    cart.produkList.clear();  // Kosongkan keranjang setelah transaksi
    transaksi.cetakStruk();  // Cetak struk transaksi
  }

  // Method untuk menampilkan riwayat transaksi
  void tampilkanRiwayat() {
    print('\n=== RIWAYAT TRANSAKSI ===');
    if (riwayatTransaksi.isEmpty) {
      print('Belum ada transaksi.');
    } else {
      for (var transaksi in riwayatTransaksi) {
        print('Tanggal: ${transaksi.tanggal} | Total: Rp${transaksi.total}');
      }
    }
  }
}