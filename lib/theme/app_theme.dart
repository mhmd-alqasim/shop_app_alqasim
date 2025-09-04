import 'package:alqasim_market/const/appColors.dart';
import 'package:flutter/material.dart';

//
//  سمة الوضع النهاري (Light Theme)
//
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.lightPrimary,
      hintColor:
          AppColors.lightAccent, // لون التأكيد (Accent) يستخدم كـ hintColor
      scaffoldBackgroundColor: AppColors.lightBackground,
      cardColor: AppColors.lightSurface,
      canvasColor: AppColors.lightSurface, // لون خلفية القوائم المنبثقة
      dividerColor: AppColors.lightOnSurface.withOpacity(0.12), // لون الفواصل
      fontFamily: 'Cairo', // مثال لخط، يمكنك تغييره
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor:
            AppColors.lightOnPrimary, // لون الأيقونات والنص في AppBar
        elevation: 0, // إزالة الظل من AppBar
        titleTextStyle: TextStyle(
          color: AppColors.lightOnPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: AppColors.lightPrimary,
        onPrimary: AppColors.lightOnPrimary,
        secondary: AppColors.lightAccent,
        onSecondary: AppColors.lightOnPrimary, // لون النص على secondary
        background: AppColors.lightBackground,
        onBackground: AppColors.lightOnBackground,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightOnSurface,
        error: AppColors.lightError,
        onError: AppColors.lightOnPrimary, // لون النص على error
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        displayMedium: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
        headlineMedium: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      ).apply(
        bodyColor: AppColors.lightOnBackground,
        displayColor: AppColors.lightOnBackground,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.lightPrimary,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.lightOnPrimary,
          backgroundColor: AppColors.lightPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.lightAccent),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.lightAccent,
        foregroundColor: AppColors.lightOnPrimary, // لون الأيقونة داخل الـ FAB
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  //الوضع المظلم الله لايظلمها علينا
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkPrimary,

      hintColor: AppColors.darkAccent,
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardColor: AppColors.darkSurface,
      canvasColor: AppColors.darkSurface,
      dividerColor: AppColors.darkOnSurface.withOpacity(0.12),
      fontFamily: 'Cairo', // مثال لخط، يمكنك تغييره
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: AppColors.darkOnPrimary,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.darkOnPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkPrimary,
        onPrimary: AppColors.darkOnPrimary,
        secondary: AppColors.darkAccent,
        onSecondary: AppColors.darkBackground, // لون النص على secondary
        background: AppColors.darkBackground,
        onBackground: AppColors.darkOnBackground,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkOnSurface,
        error: AppColors.darkError,
        onError: AppColors.darkBackground, // لون النص على error
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
        ),
        displayMedium: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
        ),
        displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
        headlineMedium: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      ).apply(
        bodyColor: AppColors.darkOnBackground,
        displayColor: AppColors.darkOnBackground,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.darkPrimary,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.darkOnPrimary,
          backgroundColor: AppColors.darkPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.darkAccent),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.darkAccent,
        foregroundColor: AppColors.darkBackground, // لون الأيقونة داخل الـ FAB
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.darkPrimary, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.darkSurface.withOpacity(0.7),
            width: 1,
          ),
        ),
        labelStyle: TextStyle(color: AppColors.darkOnSurface.withOpacity(0.7)),
        hintStyle: TextStyle(color: AppColors.darkOnSurface.withOpacity(0.5)),
      ),
    );
  }
}
