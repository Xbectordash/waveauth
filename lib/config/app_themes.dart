import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart'; // Make sure you have this in pubspec.yaml
import 'package:waveauth/util/const_colors.dart';
import 'package:waveauth/util/const_text_style.dart';

class AppTheme {
  AppTheme._();

  static final defaultPinTheme = PinTheme(
    width: 60,
    height: 64,
    textStyle: AppTextStyles.heading.copyWith(
      color: AppColors.textPrimary,
      fontSize: 20,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.border),
    ),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.accent,
      ),
      textTheme: const TextTheme(
        titleLarge: AppTextStyles.heading,
        bodyLarge: AppTextStyles.subheading,
        bodyMedium: AppTextStyles.body,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.textTernary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        hintStyle: AppTextStyles.body.copyWith(color: Colors.grey),
        labelStyle: AppTextStyles.subheading.copyWith(color: Colors.grey),
      ),
    );
  }
}
