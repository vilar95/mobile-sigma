import 'package:flutter/material.dart';
import 'package:sigma/_core/sigma_routes.dart';
import 'package:sigma/_core/theme/sigma_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: SigmaTheme.mainTheme,
      title: 'Sigma',
      debugShowCheckedModeBanner: false,
      initialRoute: SigmaRoutes.auth,
      onGenerateRoute: SigmaRoutes.generateRoute,
    );
  }
}
