import 'package:flutter/material.dart';

void main() {
  runApp(SalesApp());
}

class SalesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SalesPage(),
    );
  }
}

class Salesman {
  String namaSales;
  double totalPendapatan;
  double totalKomisi;

  Salesman({
    required this.namaSales,
    required this.totalPendapatan,
    required this.totalKomisi,
  });
}

class SalesPage extends StatefulWidget {
  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  // list ini akan menampung data yang ada pada type data Salesman
  final List<Salesman> salesmen = [];

  // Membuat kunci global untuk formulir.
  // GlobalKey<FormState> memungkinkan kita untuk mengontrol dan memvalidasi form dari luar widget Form itu sendiri.
  final _formKey = GlobalKey<FormState>();
  // inisialisasi namaSales kosong
  String _namaSales = '';
  // inisialisasi type totalPendapatan
  double _totalPendapatan = 0.0;

  // membuat fungsi komission dengan type data double
  double komission(double upah) {
    if (upah < 600000) {
      return 0;
    } else if (upah > 1000000 && upah < 2500000) {
      return 0.1 * upah;
    } else if (upah > 2500000) {
      // Asumsikan input pengguna untuk skenario ini, Anda bisa menyesuaikannya.
      return 0.12 * upah;
    }
    return 0.15 * upah;
  }

  // Fungsi void untuk menambah data salesman
  void _addSalesman() {
    // Memvalidasi dan menyimpan data dari formulir.
    // "Jika form yang sedang kita akses (melalui _formKey) berhasil divalidasi (artinya semua input valid),
    // maka jalankan kode di dalam blok if."
    if (_formKey.currentState!.validate()) {
      // currentState memungkinkan kita mengakses berbagai metode yang ada di dalam FormState,
      // seperti validate(), save(), dan reset().
      // .save Memungkinkan penyimpanan nilai input ke dalam variabel yang diinginkan.
      _formKey.currentState!.save();
      // KOMISI BARU DI INISIALISASI KARENA NANTI INPUTAN HANYA 2 YAITU NAMA & PENJUALAN
      // Menghitung komisi berdasarkan total pendapatan yang telah disimpan
      double komisi = komission(_totalPendapatan);

      // Menggunakan setState untuk memperbarui UI
      setState(
        () {
          // Menambahkan data baru ke dalam daftar list salesmen
          salesmen.add(
            Salesman(
              // Menggunakan nilai namaSales yang telah disimpan
              namaSales: _namaSales,
              // Menggunakan nilai totalPendapatan yang telah disimpan
              totalPendapatan: _totalPendapatan,
              // Menggunakan nilai komisi yang telah dihitung
              totalKomisi: komisi,
            ),
          );
          // Mengurutkan daftar salesmen berdasarkan total komisi terbesar
          salesmen.sort((a, b) => b.totalKomisi.compareTo(a.totalKomisi));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey, // Menggunakan kunci global untuk formulir.
              child: Column(
                children: [
                  // TextFormField untuk input Nama Sales
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nama Sales'),
                    // Validator untuk memeriksa apakah input Nama Sales tidak kosong
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name'; // Mengembalikan pesan error jika kosong
                      }
                      // Kembalikan null untuk menunjukkan bahwa tidak ada kesalahan pada input tersebut.
                      return null; // Mengembalikan null jika valid
                    },
                    // Menyimpan nilai input ke variabel _namaSales saat formulir disimpan
                    onSaved: (value) {
                      _namaSales = value!;
                    },
                  ),
                  // TextFormField untuk input Total Pendapatan
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Total Pendapatan'),
                    // Menentukan bahwa input ini adalah tipe angka
                    keyboardType: TextInputType.number,
                    // Validator untuk memeriksa apakah input Total Pendapatan tidak kosong
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the total pendapatan'; // Mengembalikan pesan error jika kosong
                      }
                      return null; // Mengembalikan null jika valid
                    },
                    // Menyimpan nilai input ke variabel _totalPendapatan saat formulir disimpan
                    onSaved: (value) {
                      _totalPendapatan = double.parse(value!);
                    },
                  ),
                  // SizedBox untuk memberikan jarak antara TextFormField dan ElevatedButton
                  SizedBox(height: 20),
                  // ElevatedButton untuk menambah data salesman
                  ElevatedButton(
                    // Saat tombol ditekan, fungsi _addSalesman akan dijalankan
                    onPressed: _addSalesman,
                    // Teks yang ditampilkan pada tombol
                    child: Text('Add Salesman'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: salesmen.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(salesmen[index].namaSales),
                    subtitle: Text(
                      'Pendapatan: ${salesmen[index].totalPendapatan}, Komisi: ${salesmen[index].totalKomisi}',
                    ),
                  );
                },
              ),
            ),
            Text(
              'Total Pendapatan: ${salesmen.fold<double>(0.0, (sum, item) => sum + item.totalPendapatan)}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Total Komisi: ${salesmen.fold<double>(0.0, (sum, item) => sum + item.totalKomisi)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
