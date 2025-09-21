import 'package:flutter/material.dart';

class XolanaColors {
  // Warna logo Xolana
  static const Color xRed = Color(0xFFE53935);   // Merah (X)
  static const Color xYellow = Color(0xFFFDD835); // Kuning (o)
  static const Color xBlue = Color(0xFF1E88E5);   // Biru (la)
  static const Color xGreen = Color(0xFF43A047);  // Hijau (na)

  // Primary default (pakai biru dulu biar netral)
  static const Color primary = xBlue;
}

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: XolanaColors.primary,
    colorScheme: ColorScheme.light(
      primary: XolanaColors.primary,
      secondary: XolanaColors.xGreen,
    ),
    useMaterial3: true,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: XolanaColors.primary,
    colorScheme: ColorScheme.dark(
      primary: XolanaColors.primary,
      secondary: XolanaColors.xGreen,
    ),
    useMaterial3: true,
  );
}

