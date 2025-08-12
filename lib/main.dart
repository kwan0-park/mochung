import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: '박관영❤️전보광 결혼합니다.',
      theme: ThemeData (
        fontFamily: 'GowunBatang',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: const Color(0xFF000000)), // 일반 텍스트 (검은색)
          bodyText2: TextStyle(color: const Color(0xFF000000)), // 일반 텍스트 (검은색)
          subtitle1: TextStyle(color: const Color(0xFF000000)), // 부제목 1 (검은색)
          subtitle2: TextStyle(color: const Color(0xFF000000)), // 부제목 2 (검은색)
          headline1: TextStyle(color: const Color(0xFF000000)), // 제목 1 (검은색)
          headline2: TextStyle(color: const Color(0xFF000000)), // 제목 2 (검은색)
          headline3: TextStyle(color: const Color(0xFF000000)), // 제목 3 (검은색)
          headline4: TextStyle(color: const Color(0xFF000000)), // 제목 4 (검은색)
          headline5: TextStyle(color: const Color(0xFF000000)), // 제목 5 (검은색)
          headline6: TextStyle(color: const Color(0xFF000000)), // 제목 6 (검은색)
          overline: TextStyle(color: const Color(0xFF000000)), // 오버라인 (검은색)
        ),
      ),
      darkTheme: ThemeData.light(),
      themeMode: ThemeMode.light,
      home: Container(
        width: 500.0,
        child: MyHomePage(),
      ),
    );
  }
}