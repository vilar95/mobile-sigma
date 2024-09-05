import 'package:flutter/material.dart';
import 'package:sigma/authentication/services/model/mock_user.dart';
import 'package:sigma/model/schedule.dart';
import 'package:sigma/screens/auth_screen.dart';
import 'package:sigma/screens/dashboard_screen.dart';
import 'package:sigma/screens/schedule_screen.dart';


class SigmaRoutes {
  static const String auth = "auth";
  static const String dasboard = "dasboard";
  static const String schedule = "schedule";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case dasboard:
        //TODO: Ao implementar autenticação, substituir usuário mockado.
        return MaterialPageRoute(builder: (_) => DashboardScreen(user: MockUser()));
      case schedule:
        //Schedule schedule = settings.arguments as Schedule;
        return MaterialPageRoute(
            builder: (_) => const ScheduleScreen());
      default:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
    }
  }
}
