import 'package:flutter/material.dart';

class AppLocale {
  static const String _code =
      String.fromEnvironment('APP_LOCALE', defaultValue: 'ko');

  static bool get isKo => _code == 'ko';
  static bool get isEn => _code == 'en';

  static Locale get locale => Locale(_code);
}

String tr2({
  required String ko,
  required String en,
}) {
  return AppLocale.isEn ? en : ko;
}

