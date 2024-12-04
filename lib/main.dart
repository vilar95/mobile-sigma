import 'package:flutter/material.dart';
import 'package:sigma/_core/routes/sigma_routes.dart';
import 'package:sigma/_core/theme/sigma_theme.dart';
import 'package:sigma/screens/auth_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('pt', 'BR'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      theme: SigmaTheme.mainTheme,
      title: 'Sigma',
      debugShowCheckedModeBanner: false,
      initialRoute: SigmaRoutes.splash,
      onGenerateRoute: SigmaRoutes.generateRoute,
      home: const AuthScreen(),
    );
  }
}
