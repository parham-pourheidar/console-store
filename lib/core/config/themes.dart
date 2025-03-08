import 'package:flutter/material.dart';
import 'package:console_store/core/config/fonts/lateef.dart';

class Themes {
  static ThemeData blueLight = ThemeData(
      fontFamily: Lateef.font,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromRGBO(26, 95, 199, 1),
          onPrimary: Color.fromRGBO(28, 31, 36, 1),
          secondary: Color.fromRGBO(65, 76, 92, 0.6),
          onSecondary: Color.fromRGBO(223, 228, 237, 0.6),
          error: Colors.redAccent,
          onError: Colors.black87,
          surface: Color.fromRGBO(232, 234, 237, 1),
          onSurface: Color.fromRGBO(91, 118, 163, 1)));
  static ThemeData blueDark = ThemeData(
      fontFamily: Lateef.font,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color.fromRGBO(26, 95, 199, 1),
          onPrimary: Color.fromRGBO(28, 31, 36, 1),
          secondary: Color.fromRGBO(97, 109, 128, 0.7),
          onSecondary: Color.fromRGBO(223, 228, 237, 0.6),
          error: Colors.redAccent,
          onError: Colors.black87,
          surface: Color.fromRGBO(28, 31, 36, 1),
          onSurface: Color.fromRGBO(91, 118, 163, 1)));
  static ThemeData greenLight = ThemeData(
      fontFamily: Lateef.font,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromRGBO(0, 204, 0, 1),
          onPrimary: Color.fromRGBO(28, 31, 36, 1),
          secondary: Color.fromRGBO(65, 76, 92, 0.6),
          onSecondary: Color.fromRGBO(223, 228, 237, 0.6),
          error: Colors.redAccent,
          onError: Colors.black87,
          surface: Color.fromRGBO(232, 234, 237, 1),
          onSurface: Color.fromRGBO(153, 150, 102, 1)));
  static ThemeData greenDark = ThemeData(
      fontFamily: Lateef.font,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color.fromRGBO(0, 204, 0, 1),
          onPrimary: Color.fromRGBO(28, 31, 36, 1),
          secondary: Color.fromRGBO(97, 109, 128, 0.7),
          onSecondary: Color.fromRGBO(223, 228, 237, 0.6),
          error: Colors.redAccent,
          onError: Colors.black87,
          surface: Color.fromRGBO(28, 31, 36, 1),
          onSurface: Color.fromRGBO(153, 255, 102, 1)));
  static ThemeData redLight = ThemeData(
      fontFamily: Lateef.font,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromRGBO(230, 0, 0, 1),
          onPrimary: Color.fromRGBO(28, 31, 36, 1),
          secondary: Color.fromRGBO(65, 76, 92, 0.6),
          onSecondary: Color.fromRGBO(223, 228, 237, 0.6),
          error: Colors.redAccent,
          onError: Colors.black87,
          surface: Color.fromRGBO(232, 234, 237, 1),
          onSurface: Color.fromRGBO(255, 102, 102, 1)));
  static ThemeData redDark = ThemeData(
      fontFamily: Lateef.font,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Color.fromRGBO(230, 0, 0, 1),
          onPrimary: Color.fromRGBO(28, 31, 36, 1),
          secondary: Color.fromRGBO(97, 109, 128, 0.7),
          onSecondary: Color.fromRGBO(223, 228, 237, 0.6),
          error: Colors.redAccent,
          onError: Colors.black87,
          surface: Color.fromRGBO(28, 31, 36, 1),
          onSurface: Color.fromRGBO(255, 102, 102, 1)));
}
