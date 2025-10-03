import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget _buildTitle() {
  return Column (
    children: [
      /*
      const Text (
        '26 | 02 | 08',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      const Text (
        'SUNDAY',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, letterSpacing: 2.0),
      ),
      */
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
    color: const Color.fromARGB(255, 247, 245, 242),
    child: Column (
      children: [
        const Text (
          '관영과 보광',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        // Text (
        //   '🤵💒👰',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(fontSize: 16.0, height: 2),
        // ),
        // Text (
        //   '결혼합니다',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 2),
        // ),
        Container (
          height: 100,
          // color: Colors.white,
          child: Image.asset(
            'assets/images/welcome_boris_barbara.png',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
        const Text (
          '2026.02.08 SUN 1:00 PM',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22.0, height: 2),
          // style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, height: 2),
        ),
        const Text (
          '노블발렌티 삼성점',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22.0, height: 2),
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
        color: const Color.fromARGB(255, 247, 245, 242),
        margin: const EdgeInsetsDirectional.all(20.0),
        child: Column (
          children: [
            const SizedBox(height: 80),
            _buildTitle(),
            const SizedBox(height: 40),
            _buildEventInfo(),
            // Container (
            //   // height: 600.0,
            //   width: 500.0,
            //   child: Image.asset(
            //     'assets/images/intro_02.png',
            //     fit: BoxFit.fitWidth,
            //   ),
            // ),
            const SizedBox(height: 60),
          ],
        )
      )
    );
  }
}