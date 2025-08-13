import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final API_KEY = "AIzaSyBA0lA83HAYq0dIAIncAznqQgW7RWR0nNY";

  Widget getMap() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = 'https://www.google.com/maps/embed/v1/place?key=$API_KEY&q=노블발렌티 삼성점';
      iframe.style.border = 'none';
      return iframe;
    });

    return const HtmlElementView(viewType: 'iframe');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsetsDirectional.all(20.0),
        child: Column(
          children: [
            // Container (
            //   height: 150.0,
            //   child: Image.asset(
            //     'assets/images/express.png',
            //     fit: BoxFit.fitWidth,
            //   ),
            // ),
            const Text(
              '노블발렌티 삼성점',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
            ),
            const Text('서울 강남구 봉은사로 637',),
            const Text('02-540-0711',),
            const SizedBox(height: 30),

            Container(
              width: 500,
              height: 200,
              child: getMap(),
            ),
            const SizedBox(height: 10,),

            const Text(
              '지하철',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
            ),
            const Text(
              '봉은사역 4번 출구에서 도보 5분 거리',
              style: TextStyle(height: 2,)
            ),
            const Text(
              '9호선 봉은사역 5번 출구 셔틀버스 운행',
              style: TextStyle(height: 2,)
            ),

            const Text(
              '주차',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
            ),
            const Text(
              '주차는 본관 100대, 별관 200대 가능합니다.',
              style: TextStyle(height: 2,)
            ),
            const Text(
              '별관에서는 웨딩홀까지 셔틀버스가 운행됩니다.',
              style: TextStyle(height: 2,)
            ),
          ],
        ),
      ),
    );
  }
}

