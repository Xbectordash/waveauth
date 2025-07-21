import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Solid Colors
  static const Color primary = Color(0xFF3D5AFE);
  static const Color accent = Color(0xFF00CFFF);
  static const Color background = Color(0xFFF5F7FA);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textTernary = Colors.grey;
  static final Color blue100 = Colors.blue.shade100;
  static final Color blue300 = Colors.blue.shade300;
  static final Color blue500 = Colors.blue.shade500;
  static final Color blue700 = Colors.blue.shade700;
  static final Color blue900 = Colors.blue.shade900;
  static const Color border = Color(0xFFBDBDBD); // Grey 400
  static const Color purple = Color(0xFF8E00FF);
}

class AppGradients {
  AppGradients._();

  static final LinearGradient mainGradient = LinearGradient(
    colors: [
      AppColors.primary, // Deep bluish
      AppColors.accent, // Lighter cyan
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static final LinearGradient mainGradientWithPurple = LinearGradient(
    colors: [AppColors.accent,AppColors.primary,AppColors.purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static final SweepGradient swirlGradient = SweepGradient(
    colors: [
      AppColors.primary,
      AppColors.accent,
      AppColors.primary, // looping back for smooth swirl
    ],
    center: Alignment.center,
    startAngle: 0.0,
    endAngle: 6.28319, // 2π for full circle
  );
}
