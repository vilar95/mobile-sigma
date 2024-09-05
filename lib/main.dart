import 'package:flutter/material.dart';
import 'package:sigma/screens/auth_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String authScreenRoute = '/auth';
    return MaterialApp(
      title: 'Sigma',
      initialRoute: authScreenRoute,
      routes: {
        authScreenRoute: (context) => const AuthScreen(),
      },
    );
  }
}


