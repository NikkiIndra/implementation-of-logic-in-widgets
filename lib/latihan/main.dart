import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Responshive(),
    );
  }
}

class Responshive extends StatelessWidget {
  const Responshive({super.key, this.mobilPage, this.dekstopPage});

  final dynamic mobilPage;
  final dynamic dekstopPage;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 560) {
        return mobilPage;
      } else {
        return dekstopPage;
      }
    });
  }
}
