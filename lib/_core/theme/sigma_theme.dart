import 'package:flutter/material.dart';
import 'package:sigma/_core/theme/sigma_colors.dart';

class SigmaTheme {
  static ThemeData mainTheme = ThemeData(
    // Usar Material Design 3
    useMaterial3: true,

    // Paleta de cores principal
    primaryColor:  const Color.fromARGB( 255, 22, 102, 109),

    // Cor de fundo em telas que usam Scaffold
    scaffoldBackgroundColor: const Color.fromARGB(255, 240, 239, 235),

    // Tema dos FloatingActionButton
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB( 255, 22, 102, 109),
    ),

    // Temas dos ListTiles
    listTileTheme: const ListTileThemeData(
      iconColor: SigmaColors.green,
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
      color: SigmaColors.green,
    ),

    // Tema dos TextFormFields
    inputDecorationTheme: const InputDecorationTheme(
      iconColor: Colors.black,
      labelStyle: TextStyle(color: Colors.black),
    ),
  );
}
