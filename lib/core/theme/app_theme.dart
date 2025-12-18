import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF1E1E1E); // Deep Black/Gray
  static const Color accent = Color(0xFFC7F456); // Neon Green (Lime)
  static const Color cardBg = Color(0xFF2C2C2C); // Card Background
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: const Color(0xFFF5F5F7),
    fontFamily: GoogleFonts.outfit().fontFamily,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black)),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.accent,
    scaffoldBackgroundColor: AppColors.primary,
    fontFamily: GoogleFonts.outfit().fontFamily,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
        primary: AppColors.accent, surface: AppColors.cardBg),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
