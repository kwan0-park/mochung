import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui;

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final API_KEY = "AIzaSyBA0lA83HAYq0dIAIncAznqQgW7RWR0nNY";

  Widget getMap() {
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
            Container (
              child: Image.asset(
                'assets/images/map.webp',
                fit: BoxFit.fitWidth,
              ),
            ),
            const Text(
              '노블발렌티 삼성점',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
            ),
            const Text('서울 강남구 봉은사로 637',),
            const Text('02-540-0711',),
            const SizedBox(height: 30),

            // Container(
            //   width: 500,
            //   height: 200,
            //   child: getMap(),
            // ),
            // const SizedBox(height: 10,),

            const Text(
              '교통 안내',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
            ),
            const Text(
              '- 지하철: 9호선 봉은사역 4번 출구 도보 5분\n'
              '- 버스: 봉은사역 3번 출구, 삼성 1파출소 정류장\n'
              '  지선(초록): 2413, 2415, 3217, 3414, 4318\n'
              '  간선(파랑): 143, 146, 301, 343, 345, 401\n'
              '  직행(빨강): 9407, 9507, 9607\n'
              '- 셔틀 운행: 봉은사역 5번 출구, 제2주차장 (5분 간격)',
              style: TextStyle(height: 2,)
            ),

            const Text(
              '주차 안내',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
            ),
            const Text(
              '본관 및 제2주차장 이용 가능\n'
              '(2시간 무료, 제2주차장 도보 4분)',
              style: TextStyle(height: 2,)
            ),
          ],
        ),
      ),
    );
  }
}

