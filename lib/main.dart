import 'package:flutter/material.dart';
import 'package:xolana/screens/login/login_page.dart';

void main() {
  runApp(const XolanaApp());
}

class XolanaApp extends StatelessWidget {
  const XolanaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xolana',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // default light
      home: const LoginPage(),  // ⬅️ langsung login page
    );
  }
}

