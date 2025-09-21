import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../login/login_page.dart';

class SplashFirst extends StatefulWidget {
  const SplashFirst({super.key});

  @override
  State<SplashFirst> createState() => _SplashFirstState();
}

class _SplashFirstState extends State<SplashFirst>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Jalankan splash 3 detik lalu navigate ke login
    Future.delayed(const Duration(seconds: 3), () {
      _fadeController.forward().then((_) {
        Navigator.of(context).pushReplacement(_createRoute());
      });
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 1.0, end: 0.0).animate(_fadeController),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Lottie.asset(
            'assets/animations/xolana_splash.json',
            width: 240,
            height: 240,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  /// Custom Route: Login masuk dari bawah ke atas
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeOutCubic;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}

