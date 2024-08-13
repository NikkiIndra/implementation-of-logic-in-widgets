import 'package:flutter/material.dart';

import '../inputToTable.dart';
import '../main.dart';
import '../quiz.dart';

void main() {
  runApp(MaterialApp(
    title: "aplication",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _buttonIndex = 0;
  final List<Widget> myList = [
    sumclick(),
    TableApp(),
    SalesApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigasi"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildButton(0, "Page 1"),
                    _buildButton(1, "Page 2"),
                    _buildButton(2, "Page 3"),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildButton(0, "Page 1"),
                    _buildButton(1, "Page 2"),
                    _buildButton(2, "Page 3"),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.cyan,
                child: myList[_buttonIndex],
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell _buildButton(int index, String title) {
    return InkWell(
      onTap: () {
        setState(
          () {
            _buttonIndex = index;
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: _buttonIndex == index ? Colors.greenAccent : Colors.grey,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class pertama extends StatelessWidget {
  const pertama({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        child: const Text("Page Pertama"),
      ),
    );
  }
}

class kedua extends StatelessWidget {
  const kedua({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amber,
        child: const Text("Page kedua"),
      ),
    );
  }
}
