import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding_invitation/common/app_radii.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  _launchNaverMap() async {
    const query = "노블발렌티 삼성점";
    final encodedQuery = Uri.encodeComponent(query);
    const appname = "com.example.wedding_invitation";
    final naverMapAppUrl = Uri.parse('nmap://search?query=$encodedQuery&appname=$appname');
    final naverMapWebUrl = Uri.parse('https://map.naver.com/v5/search/$encodedQuery');

    if (await canLaunchUrl(naverMapAppUrl)) {
      await launchUrl(naverMapAppUrl);
    } else {
      await launchUrl(naverMapWebUrl, mode: LaunchMode.externalApplication);
    }
  }

  _launchKakaoMap() async {
    const query = "노블발렌티 삼성점";
    const lat = 37.515488;
    const lng = 127.064848;
    final encodedQuery = Uri.encodeComponent(query);

    final kakaoMapAppUrl = Uri.parse('kakaomap://search?q=$encodedQuery&p=$lat,$lng');
    final kakaoMapWebUrl = Uri.parse('http://m.map.kakao.com/scheme/search?q=$encodedQuery&p=$lat,$lng');

    if (await canLaunchUrl(kakaoMapAppUrl)) {
      await launchUrl(kakaoMapAppUrl);
    } else {
      await launchUrl(kakaoMapWebUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500.0,
        margin: const EdgeInsetsDirectional.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(bigRadius),
                border: Border.all(
                  width: 0.25,
                  color: const Color.fromRGBO(41, 82, 56, 1.0)
                ),
              ),
              child: ClipRRect (
                borderRadius: BorderRadius.circular(bigRadius),
                child: Image.asset(
                  'assets/images/map.webp',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _launchNaverMap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(bigRadius),
                      ),
                    ),
                    icon: Image.asset('assets/images/navermap_icon_2.png', width: 24, height: 24),
                    label: const Text('네이버지도'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _launchKakaoMap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(bigRadius),
                      ),
                    ),
                    icon: Image.asset('assets/images/kakaomap_basic.png', width: 24, height: 24),
                    label: const Text('카카오맵'),
                  ),
                ),
              ],
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
              '- 셔틀 운행: 봉은사역 5번 출구, 제2주차장 (5분 간격)',
              style: TextStyle(height: 2,)
            ),
            const SizedBox(height: 30),

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
