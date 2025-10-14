import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wedding_invitation/supabase_options.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
  );

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
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Color(0xFF000000)),
          displayMedium: TextStyle(color: Color(0xFF000000)),
          displaySmall: TextStyle(color: Color(0xFF000000)),
          headlineLarge: TextStyle(color: Color(0xFF000000)),
          headlineMedium: TextStyle(color: Color(0xFF000000)),
          headlineSmall: TextStyle(color: Color(0xFF000000)),
          titleLarge: TextStyle(color: Color(0xFF000000)),
          titleMedium: TextStyle(color: Color(0xFF000000)),
          titleSmall: TextStyle(color: Color(0xFF000000)),
          bodyLarge: TextStyle(color: Color(0xFF000000)),
          bodyMedium: TextStyle(color: Color(0xFF000000)),
          bodySmall: TextStyle(color: Color(0xFF000000)),
          labelSmall: TextStyle(color: Color(0xFF000000)),
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