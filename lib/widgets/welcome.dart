import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget _buildTitle() {
  return Column (
    children: [
      const AutoSizeText (
        'Come join us\n'
        'on our wedding day!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w400, fontFamily: 'SpecialElite'),
        maxLines: 2,
      ),
      const SizedBox(height: 40),
      Container (
        height: 340.0,
        child: Image.asset(
          'assets/images/welcome.webp',
          //fit: BoxFit.fitWidth,
        ),
      ),
    ]
  );
}

Widget _buildDday(BuildContext context) {
  final dday = DateTime(2026, 2, 8);
  final today = DateTime.now();
  final difference = dday.difference(today).inDays;

  var ddayText = difference > 0 ? 'D-$difference' : '';

  return Column (
    children: [
      const Text(
        '2026년 2월 8일 일요일 13시',
        style: TextStyle(fontSize: 18),   
      ),
      const SizedBox(height: 10),
      AutoSizeText(
        ddayText,
        style: const TextStyle(fontSize: 15, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget _buildEventInfo() {
  return Container(
    //color: const Color.fromARGB(255, 247, 245, 242),
    child: const Column (
      children: [
        // Text (
        //   '박관영 ❤️ 전보광',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        // ),
        // SizedBox(height: 20),
        Text (
          'NOBLE VALENTI SAMSUNG, SEOUL',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, height: 2, fontWeight: FontWeight.w400, fontFamily: 'SpecialElite'),
        ),
        Text (
          'Everyday is a journey,\n'
          'and journey itself is home.\n'
          'Now we go on a whole new journey together.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: 'SpecialElite'),
        ),
      ]
    ),
  );
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container (
        width: 500.0,
        //color: const Color.fromARGB(255, 247, 245, 242),
        margin: const EdgeInsetsDirectional.all(20.0),
        child: Column (
          children: [
            const SizedBox(height: 80),
            _buildTitle(),
            const SizedBox(height: 40),
            _buildEventInfo(),
            const SizedBox(height: 60),
            const SizedBox(height: 40),
          ],
        )
      )
    );
  }
}