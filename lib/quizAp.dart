// ignore_for_file: file_names
import 'package:flutter/material.dart';

void main() {
  runApp(const SalesApp());
}

class SalesApp extends StatelessWidget {
  const SalesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Input to Table",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SalesPage(),
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
  const SalesPage({super.key});

  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  final List<Salesman> salesman = [];
  final _formKey = GlobalKey<FormState>();
  String _namaSales = '';
  double _totalPendapatan = 0.0;

  Future<double> komission(double upah) async {
    if (upah < 500000) {
      return 0;
    } else if (upah < 1000000) {
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
          title: const Text("Pertanyaan"),
          content: const Text("Apakah baru pertama kali?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Tidak"),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text("Ya"),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
      // Jika onValue adalah null, maka akan mengembalikan false.
      // Ini memastikan hasil tidak null
    ).then((value) => value ?? false);
  }

  void _addSalesman() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      double komisi = await komission(_totalPendapatan);
      setState(() {
        salesman.add(Salesman(
          namaSales: _namaSales,
          totalPendapatan: _totalPendapatan,
          totalKomisi: komisi,
        ));
        salesman.sort((a, b) => b.totalKomisi.compareTo(a.totalKomisi));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Management"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Nama Sales'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _namaSales = newValue!;
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Total Pendapatan'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the total pendapatan';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _totalPendapatan = double.parse(newValue!);
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _addSalesman,
                      child: const Text('Add Salesman'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("No")),
                    DataColumn(label: Text("Nama Sales")),
                    DataColumn(label: Text("Penjualan")),
                    DataColumn(label: Text("Komisi")),
                  ],
                  rows: [
                    for (int index = 0; index < salesman.length; index++)
                      DataRow(
                        cells: [
                          DataCell(Text((index + 1).toString())),
                          DataCell(Text(salesman[index].namaSales)),
                          DataCell(
                              Text(salesman[index].totalPendapatan.toString())),
                          DataCell(
                              Text(salesman[index].totalKomisi.toString())),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Total Pendapatan: ${salesman.fold(0.0, (sum, item) => sum + item.totalPendapatan)}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Total Komisi: ${salesman.fold(0.0, (sum, item) => sum + item.totalKomisi)}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
