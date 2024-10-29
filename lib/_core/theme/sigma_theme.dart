import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';

class SigmaTheme {
  static ThemeData mainTheme = ThemeData(
    // Usar Material Design 3
    useMaterial3: true,

    // Paleta de cores principal
    primaryColor: const Color.fromARGB(255, 25, 57, 105),

    // Cor de fundo em telas que usam Scaffold
    scaffoldBackgroundColor: const Color.fromARGB(255, 240, 239, 235),

    // Cor do primeiro plano
    primarySwatch: const MaterialColor(0xFF193969, {
      50: Color(0xFF193969),
      100: Color(0xFF193969),
      200: Color(0xFF193969),
      300: Color(0xFF193969),
      400: Color(0xFF193969),
      500: Color(0xFF193969),
      600: Color(0xFF193969),
      700: Color(0xFF193969),
      800: Color(0xFF193969),
      900: Color(0xFF193969),
    }),
    indicatorColor: const Color.fromARGB(255, 25, 57, 105),
    // Cor do icone principal
    primaryIconTheme: const IconThemeData(color: SigmaColors.blue),

    // Tema dos FloatingActionButton
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 25, 57, 105),
    ),

    // Temas dos ListTiles
    listTileTheme: const ListTileThemeData(
      iconColor: Color.fromARGB(255, 25, 57, 105),
      contentPadding: EdgeInsets.zero,
    ),

    // Tema das AppBars
    appBarTheme: const AppBarTheme(
      backgroundColor: SigmaColors.lavandalightAccent,
      toolbarHeight: 72,
      centerTitle: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
    ),

    // Tema dos Dividers
    dividerTheme: const DividerThemeData(
      color: Color.fromARGB(255, 18, 72, 111),
    ),

    // Tema dos TextFormFields
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: Colors.black,
      labelStyle: TextStyle(color: Colors.black),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.black),
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.white,
    ),


    colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(0xFF193969, {
      50: Color(0xFF193969),
      100: Color(0xFF193969),
      200: Color(0xFF193969),
      300: Color(0xFF193969),
      400: Color(0xFF193969),
      500: Color(0xFF193969),
      600: Color(0xFF193969),
      700: Color(0xFF193969),
      800: Color(0xFF193969),
      900: Color(0xFF193969),
    })),
  );
}
