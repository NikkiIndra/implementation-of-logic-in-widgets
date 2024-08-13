import 'package:flutter/material.dart';

// void main() {
//   runApp(TableApp());
// }

class TableApp extends StatelessWidget {
  const TableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Tablelication")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text("Dessert (100g serving)")),
            DataColumn(label: Text("Calories")),
            DataColumn(label: Text("Fat (g)")),
            DataColumn(label: Text("Protein (g)")),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Frozen Yogurt")),
                DataCell(Text("159")),
                DataCell(Text("6.0")),
                DataCell(Text("4.0")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Ice Cream Sandwich")),
                DataCell(Text("237")),
                DataCell(Text("9.0")),
                DataCell(Text("4.3")),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text("Eclair")),
                DataCell(Text("262")),
                DataCell(Text("16.0")),
                DataCell(Text("6.0")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
