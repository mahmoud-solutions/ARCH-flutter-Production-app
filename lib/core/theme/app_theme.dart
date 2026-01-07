import 'package:flutter/material.dart';
import 'app_colors.dart'; // نفترض إن AppColors في ملف app_colors.dart

class AppTheme {
  // ه الثيم الفاتح
  static final ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: AppColors.unSelectItemSelectedColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      selectedItemColor: AppColors.primary,
      selectedLabelStyle: TextStyle(
        color: AppColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    primaryColor: AppColors.primary, // ه اللون الأساسي
    scaffoldBackgroundColor: AppColors.background, // ه الخلفية الرئيسية
    cardColor: AppColors.surface, // ه خلفية الكروت
    disabledColor: AppColors.disabled, // ه لون الأزرار المعطلة
    dividerColor: AppColors.divider, // ه لون الخطوط الفاصلة
    shadowColor: AppColors.shadow, // ه لون ظل الكروت

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.background,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.textPrimary, // ه النص على اللون الأساسي
      onBackground: AppColors.textPrimary, // ه النص على الخلفية
      onSurface: AppColors.textPrimary, // ه النص على الكروت
      onSecondary: AppColors.textPrimary, // ه النص على اللون الثانوي
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary), // ه النصوص الرئيسية
      bodyMedium: TextStyle(
        color: AppColors.textSecondary,
      ), // ه النصوص الثانوية
    ),
  );

  // ه الثيم الغامق
  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors
        .textPrimary, // ه الخلفية الغامقة ممكن نستخدم لون نص أساسي فاتح
    cardColor: AppColors.surface, // ه الكروت لسه فاتحة شويه عشان تبان النصوص
    disabledColor: AppColors.disabled,
    dividerColor: AppColors.divider,
    shadowColor: AppColors.shadow,

    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.textPrimary, // ه الخلفية الغامقة
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.background, // ه النص على اللون الأساسي في الداكن
      onBackground: AppColors.onDarkBackground, // ه النص على الخلفية الداكنة
      onSurface: AppColors.onDarkBackground,
      onSecondary: AppColors.background,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.onDarkBackground),
      bodyMedium: TextStyle(color: AppColors.textSecondary),
    ),
  );
}
