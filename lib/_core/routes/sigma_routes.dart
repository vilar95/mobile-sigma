import 'package:flutter/material.dart';
import 'package:sigma/authentication/model/mock_user.dart';
import 'package:sigma/screens/auth_screen.dart';
import 'package:sigma/screens/home_screen.dart';
import 'package:sigma/screens/my_schedule_screen.dart';
import 'package:sigma/screens/schedule_screen.dart';
import 'package:sigma/screens/splash_screen.dart';
import 'package:sigma/screens/support_screen.dart';

class SigmaRoutes {
  static const String splash = "splash";
  static const String auth = "auth";
  static const String home = "home";
  static const String schedule = "schedule";
  static const String mySchedule = "mySchedule";
  static const String support = "support";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return switch (settings.name) {
      splash => MaterialPageRoute(builder: (_) => const SplashScreen()),
      auth => MaterialPageRoute(builder: (_) => const AuthScreen()),
      home => MaterialPageRoute(builder: (_) => HomeScreen(user: MockUser())),
      schedule => MaterialPageRoute(builder: (_) => const ScheduleScreen()),
      mySchedule => MaterialPageRoute(builder: (_) => const MyScheduleScreen()),
      support => MaterialPageRoute(builder: (_) => const SupportScreen()),
      _ => MaterialPageRoute(builder: (_) => const AuthScreen()),
    };
  }
}
