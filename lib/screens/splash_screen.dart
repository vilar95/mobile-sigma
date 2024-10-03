import 'package:flutter/material.dart';
import 'package:sigma/_core/routes/route_transitions.dart';
import 'package:sigma/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double imageOpacity = 0;
  int timeToAnimationInMilliseconds = 2500;

  @override
  void initState() {
    waitAndShow();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Image.asset(
                'assets/logo_icon.png',
                width: 300,
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: timeToAnimationInMilliseconds),
              opacity: imageOpacity,
              curve: Curves.ease,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset(
                  'assets/logo_icon.png',
                  width: 300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  waitAndShow() {
    Future.delayed(const Duration(milliseconds: 700)).then((value) {
      setState(() {
        imageOpacity = 1;
      });
      waitAndNextScreen();
    });
  }

  waitAndNextScreen() {
    Future.delayed(Duration(milliseconds: timeToAnimationInMilliseconds + 300))
        .then(
      (value) {
        Navigator.of(context).pushReplacement(
          sliderRouteTransition(
            const AuthScreen(),
            duration: const Duration(milliseconds: 500),
            beginPosition: const Offset(0, 0)
          ),
        );
      },
    );
  }
}
