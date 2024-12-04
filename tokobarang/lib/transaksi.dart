// lib/transaksi.dart
import 'produk.dart';

class Transaction {
  DateTime tanggal;
  List<Map<String, dynamic>> items;
  double total;

  // Constructor Transaction
  Transaction(this.tanggal, this.items, this.total);

  // Method untuk mencetak struk transaksi
  void cetakStruk() {
    print('\n=== STRUK BELANJA ===');
    print('Tanggal: $tanggal');
    for (var item in items) {
      Produk produk = item['produk'];
      int jumlah = item['jumlah'];
      print('${produk.nama} x$jumlah = Rp${produk.harga * jumlah}');
    }
    print('Total: Rp$total');
  }
}