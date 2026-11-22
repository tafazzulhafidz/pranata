import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryNavy = Color(0xFF00447B);
  static const Color darkNavy = Color(0xFF002F56);
  static const Color skyBlue = Color(0xFF69C0F5);
  static const Color softBlueBg = Color(0xFFEEF4FB);
  static const Color softBlueBadge = Color(0xFFD6ECFA);
  static const Color scaffoldBg = Color(0xFFF8FAFC);
  static const Color cardBorder = Color(0xFFE2E8F0);

  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textMuted = Color(0xFF64748B);

  static const Color softYellowBg = Color(0xFFFDE68A);
  static const Color amberDark = Color(0xFF92400E);
  static const Color softRedBg = Color(0xFFFEE2E2);
  static const Color redDanger = Color(0xFFDC2626);
  static const Color redDarkText = Color(0xFF7F1D1D);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffoldBg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryNavy,
        primary: AppColors.primaryNavy,
        surface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0.5,
      ),
    );
  }
}