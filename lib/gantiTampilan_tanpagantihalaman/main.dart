import 'package:flutter/material.dart';

void main() {
  runApp(const MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int buttonIndex = 0;
  final List<Widget> _pindah = const [
    First(),
    Seccond(),
    Therd(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buttonInkwell("First", 0),
                _buttonInkwell("Seccond", 1),
                _buttonInkwell("Therd", 2),
              ],
            ),
            Expanded(
              // Container di sini digunakan untuk menampilkan widget dari daftar _pindah
              // sesuai dengan buttonIndex yang aktif
              child: Container(
                color: Colors.blue[50],
                child: _pindah[buttonIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buttonInkwell(String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          buttonIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: buttonIndex == index ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Ini page pertama"),
    );
  }
}

class Seccond extends StatelessWidget {
  const Seccond({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Ini page kedua"),
    );
  }
}

class Therd extends StatelessWidget {
  const Therd({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Ini page ketiga"),
    );
  }
}
