/*
import 'package:flutter/material.dart';
import 'package:healt_app/aktivityPage/complete.dart';
import 'cancled.dart';
import 'upcoming.dart';

class StoreSecreen extends StatefulWidget {
  // const StoreSecreen({.key});

  @override
  State<StoreSecreen> createState() => _StoreSecreenState();
}
// "image/assets_docter/$imageUrl",

class _StoreSecreenState extends State<StoreSecreen> {
  int _buttonIndex = 0;
  final _StoreWidgets = [
    // upComingStore
    UpComingScreen(),
    CompletePage(),
    CancledPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: _builTempaleteText(
                  "Your Aktivity", 32, FontWeight.w500, Colors.black),
            ),
            Container(
              color: Colors.black12,
              height: 70,
              width: MediaQuery.of(context).size.width,
              child:
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.horizontal,
                  //   // mengambil dari list yang sudah di tentukan
                  //   itemCount: 1,
                  //   itemBuilder: (contex, index) {
                  //     return
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   margin: const EdgeInsets.symmetric(vertical: 10),
                  //   padding: const EdgeInsets.symmetric(horizontal: 25),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.zero),
                  //     border: Border.all(
                  //       color: const Color(0xFF7165D6),
                  //     ),
                  //   ),
                  //   child:

                  // fiel daftar keluhan
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildYourActivity("Following Store", 0),
                  _buildYourActivity("Order Product", 1),
                  _buildYourActivity("Cancel Product", 2),
                ],
              ),
              // },
              // ),
            ),
            SizedBox(height: 10),
            _StoreWidgets[_buttonIndex],
          ],
        ),
      ),
    );
  }

  Widget _buildYourActivity(String text, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _buttonIndex = index;
        });
      },
      child: Container(
          width: 130,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
          decoration: BoxDecoration(
            color:
                _buttonIndex == index ? Color(0xFF7165D6) : Colors.transparent,
            borderRadius: BorderRadius.zero,
          ),
          child: FittedBox(
              child:
                  _builTempaleteText(text, 15, FontWeight.w500, Colors.black))),
    );
  }

  // build methode
  Widget _builTempaleteText(
      String label, double size, FontWeight fontWeight, Color color) {
    return Text(
      label,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

*/