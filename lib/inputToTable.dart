import 'package:flutter/material.dart';

// void main() {
//   runApp(SalesApp());
// }

class SalesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplication table',
      home: SalesPage(),
    );
  }
}

class Salesman {
  String nama;
  double totalPendapatan;
  double totalKomisi;

  Salesman({
    required this.nama,
    required this.totalPendapatan,
    required this.totalKomisi,
  });
}

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final List<Salesman> salesman = [];
  final _fromKey = GlobalKey<FormState>();

  /**
   * 'TextEditingController' digunakan untuk mengontrol teks yang dimasukkan oleh pengguna di dalam TextFormField.
   * Setelah data ditambahkan ke dalam daftar salesman, panggil clear(), 
   * pada TextEditingController untuk mengosongkan teks inputan.
   */
  // Buat TextEditingController untuk setiap TextFormField
  final TextEditingController _namaSalesController = TextEditingController();
  final TextEditingController _totalPendapatanController =
      TextEditingController();

  String _namaSales = '';
  double _totalPendapatan = 0.0;

  Future<double> komision(double upah) async {
    if (upah < 500000) {
      return 0;
    } else if (upah < 1000000 && upah >= 500000) {
      return 0.1 * upah;
    } else if (upah > 2500000) {
      bool isFirstTime = await _showFirstTimeDialog();
      if (isFirstTime) {
        return 0.12 * upah;
      }
    }
    return 0.15 * upah;
  }

  Future<bool> _showFirstTimeDialog() async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pertanyaan"),
          content: Text("Apakah Baru pertama kali mencapai > 2500? "),
          actions: [
            TextButton(
              child: Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    ).then((onValue) => onValue ?? false);
  }

  Future<void> addSales() async {
    if (_fromKey.currentState!.validate()) {
      _fromKey.currentState!.save();
      double _komisi = await komision(_totalPendapatan);
      setState(() {
        salesman.add(Salesman(
          nama: _namaSales,
          totalPendapatan: _totalPendapatan,
          totalKomisi: _komisi,
        ));
      });
      salesman.sort((a, b) => b.totalKomisi.compareTo(a.totalKomisi));

      // Clear input fields after adding the salesman
      _namaSalesController.clear();
      _totalPendapatanController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table Input"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: _fromKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller:
                          _namaSalesController, // Menggunakan controller
                      decoration: InputDecoration(labelText: "Nama"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter a name';
                        }
                        return null;
                      },
                      onSaved: (newValue) => _namaSales = newValue!,
                    ),
                    TextFormField(
                      controller:
                          _totalPendapatanController, // Menggunakan controller
                      decoration: InputDecoration(labelText: "Pendapatan"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter the your Pendapatan';
                        }
                        return null;
                      },
                      onSaved: (newValue) =>
                          _totalPendapatan = double.parse(newValue!),
                    ),
                    ElevatedButton(
                      onPressed: addSales,
                      child: Text("Add Salesman"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("No")),
                    DataColumn(label: Text("Nama Sales")),
                    DataColumn(label: Text("Pendapatan")),
                    DataColumn(label: Text("Komisi")),
                  ],
                  rows: [
                    for (int i = 0; i < salesman.length; i++)
                      DataRow(
                        cells: [
                          DataCell(Text((i + 1).toString())),
                          DataCell(Text(salesman[i].nama)),
                          DataCell(
                              Text(salesman[i].totalPendapatan.toString())),
                          DataCell(Text(salesman[i].totalKomisi.toString())),
                        ],
                      )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Positioned(
                left: 0,
                child: Column(
                  children: [
                    Text(
                      "Total bayar : ${salesman.fold(0.0, (sum, item) => sum + item.totalPendapatan)}",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      "Total bayar : ${salesman.fold(0.0, (sum, item) => sum + item.totalPendapatan)}",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
