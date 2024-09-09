import 'package:flutter/material.dart';

class SigmaColors {
  static const MaterialColor blue =
      MaterialColor(_greenPrimaryValue, <int, Color>{
    50: Color.fromARGB(255, 174, 240, 250),
    100: Color.fromARGB(255, 150, 227, 247),
    200: Color.fromARGB(255, 107, 219, 247),
    300: Color.fromARGB(255, 92, 177, 192),
    400: Color.fromARGB(255, 25, 57, 105),
    500: Color(_greenPrimaryValue),
    600: Color.fromARGB(255, 62, 145, 156),
    700: Color.fromARGB(255, 50, 135, 138),
    800: Color.fromARGB(255, 35, 97, 105),
    900: Color.fromARGB(255, 18, 65, 73),
  });
  static const int _greenPrimaryValue = 0xFF009688;

  static const MaterialColor greenAccent =
      MaterialColor(_greenAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_greenAccentValue),
    400: Color(0xFFECFFB7),
    700: Color(0xFFE6FF9D),
  });
  static const int _greenAccentValue = 0xFF009688;

  static const MaterialColor purple =
      MaterialColor(_purplePrimaryValue, <int, Color>{
    50: Color(0xFFEDEAF4),
    100: Color(0xFFD1CBE4),
    200: Color(0xFFB3A8D2),
    300: Color(0xFF9585BF),
    400: Color(0xFF7E6AB2),
    500: Color(_purplePrimaryValue),
    600: Color(0xFF5F499C),
    700: Color(0xFF544092),
    800: Color(0xFF4A3789),
    900: Color(0xFF392778),
  });
  static const int _purplePrimaryValue = 0xFF009688;

  static const MaterialColor purpleAccent =
      MaterialColor(_aquaAccentValue, <int, Color>{
    100: Color.fromARGB(255, 187, 245, 255),
    200: Color(_aquaAccentValue),
    400: Color.fromARGB(255, 85, 255, 246),
    700: Color.fromARGB(255, 59, 242, 255),
  });
  static const int _aquaAccentValue = 0xFF009688;

  static const MaterialColor lavandalight =
      MaterialColor(_lightPrimaryValue, <int, Color>{
    50: Color(0xFFFCFBFF),
    100: Color(0xFFF9F5FF),
    200: Color(0xFFF5EEFF),
    300: Color(0xFFF0E7FF),
    400: Color(0xFFEDE2FF),
    500: Color(_lightPrimaryValue),
    600: Color(0xFFE7D9FF),
    700: Color(0xFFE4D4FF),
    800: Color(0xFFE1CFFF),
    900: Color(0xFFDBC7FF),
  });
  static const int _lightPrimaryValue = 0xFF009688;

  static const MaterialColor lavandalightAccent =
      MaterialColor(_lightAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_lightAccentValue),
    400: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
  });
  static const int _lightAccentValue = 0xFFFFFFFF;

  static const MaterialColor greydark =
      MaterialColor(_greydarkPrimaryValue, <int, Color>{
    50: Color(0xFFE6E6E7),
    100: Color(0xFFC2C1C2),
    200: Color(0xFF99979A),
    300: Color(0xFF706D72),
    400: Color(0xFF514E53),
    500: Color(_greydarkPrimaryValue),
    600: Color(0xFF2D2A30),
    700: Color(0xFF262328),
    800: Color(0xFF1F1D22),
    900: Color(0xFF131216),
  });
  static const int _greydarkPrimaryValue = 0xFF02A50;

  static const MaterialColor graydarkAccent =
      MaterialColor(_graydarkAccentValue, <int, Color>{
    100: Color.fromARGB(255, 92, 244, 255),
    200: Color(_graydarkAccentValue),
    400: Color.fromARGB(255, 14, 118, 153),
    700: Color.fromARGB(255, 11, 95, 112),
  });
  static const int _graydarkAccentValue = 0xFF22102109;

  
}
