import 'package:flutter/material.dart';
import 'package:gallery/HexColor.dart';

class Config {
  static const String BASE_URL = 'https://images.unsplash.com/';
  static const String ACTION_BAT_TITLE = 'Photo';
  static const String ACCESS_TOKEN =
      'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';
  static final ThemeData themeData = ThemeData(
      primaryColor: HexColor('#D6F4FF'),
      accentColor: HexColor('#034B63'),
      textTheme: TextTheme(body1: TextStyle(color: HexColor('#86A8B5'))));
}
