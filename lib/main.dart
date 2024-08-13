import 'package:flutter/material.dart';

// void main() {
//   runApp(const sumclick());
// }

class sumclick extends StatefulWidget {
  const sumclick({super.key});

  @override
  State<sumclick> createState() => _sumclickState();
}

class _sumclickState extends State<sumclick> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("My Application"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: count > 0
                      ? () {
                          setState(() {
                            count--;
                          });
                        }
                      : null,
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
