import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  _launchMaps() async {
    final availableMaps = await MapLauncher.installedMaps;
    final destination = Coords(37.515488, 127.064848);
    const destinationTitle = "노블발렌티 삼성점";

    if (availableMaps.length > 1) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showDirections(
                          destination: destination,
                          destinationTitle: destinationTitle,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else if (availableMaps.length == 1) {
      await availableMaps.first.showDirections(
        destination: destination,
        destinationTitle: destinationTitle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsetsDirectional.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            ClipRRect (
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/map.webp',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _launchMaps,
              child: const Text('지도로 길 찾기'),
            ),
            const SizedBox(height: 12),
            const Text(
              '노블발렌티 삼성점',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
            ),
            const Text('서울 강남구 봉은사로 637',),
            const Text('02-540-0711',),
            const SizedBox(height: 30),

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