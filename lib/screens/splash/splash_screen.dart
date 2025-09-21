import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:xolana/screens/login/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, __, ___) => const LoginPage(),
          transitionsBuilder: (_, anim, __, child) {
            final offsetAnim = Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(anim);
            return SlideTransition(position: offsetAnim, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'animations/xolana_splash.json',
          width: 240,
          repeat: false,
        ),
      ),
    );
  }
}

