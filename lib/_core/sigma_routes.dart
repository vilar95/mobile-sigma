import 'package:flutter/material.dart';
import 'package:sigma/authentication/services/model/mock_user.dart';
import 'package:sigma/screens/auth_screen.dart';
import 'package:sigma/screens/home_screen.dart';
import 'package:sigma/screens/schedule_screen.dart';
import 'package:sigma/screens/support_screen.dart';

class SigmaRoutes {
  static const String auth = "auth";
  static const String home = "home";
  static const String schedule = "schedule";
  static const String support = "support";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case home:
        //TODO: Ao implementar autenticação, substituir usuário mockado.
        return MaterialPageRoute(builder: (_) => HomeScreen(user: MockUser()));
      case schedule:
        //Schedule schedule = settings.arguments as Schedule;
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());
      case support:
        return MaterialPageRoute(builder: (_) => const SupportScreen());
      default:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
    }
  }
}
