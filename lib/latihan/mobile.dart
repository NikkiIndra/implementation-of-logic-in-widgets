import 'package:flutter/material.dart';

void main() {
  runApp(MyProfile());
}

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  get containerWidth => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Page One"),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: MediaQuery.of(context).size.width > 600
                      ? Colors.red
                      : Colors.blue,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: MediaQuery.of(context).size.width > 600
                      ? Colors.green
                      : Colors.blueGrey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
