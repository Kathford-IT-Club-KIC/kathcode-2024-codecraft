import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Quicksand",
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkBlue,
      brightness: Brightness.light,
    ),
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.transparent,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.lightBlue,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.lightBlue,
    ),

    textTheme: const TextTheme(
      headlineSmall: TextStyle(
          fontSize: 20.0,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w500),
      headlineMedium: TextStyle(
          fontSize: 24.0,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600),
      headlineLarge: TextStyle(
          fontSize: 28.0,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          fontSize: 16.0,
          color: AppColors.secondaryText,
          fontWeight: FontWeight.w500),
      titleMedium: TextStyle(
          fontSize: 18.0,
          color: AppColors.secondaryText,
          fontWeight: FontWeight.w600),
      titleLarge: TextStyle(
          fontSize: 20.0,
          color: AppColors.secondaryText,
          fontWeight: FontWeight.w700),
      bodySmall: TextStyle(
          fontSize: 14.0,
          color: AppColors.secondaryText,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          fontSize: 16.0,
          color: AppColors.secondaryText,
          fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(
          fontSize: 18.0,
          color: AppColors.secondaryText,
          fontWeight: FontWeight.w400),
      displaySmall: TextStyle(
          fontSize: 12.0,
          color: AppColors.hintTextColor,
          fontWeight: FontWeight.w400),
      displayMedium: TextStyle(
          fontSize: 14.0,
          color: AppColors.hintTextColor,
          fontWeight: FontWeight.w500),
      displayLarge: TextStyle(
          fontSize: 20.0,
          color: AppColors.hintTextColor,
          fontWeight: FontWeight.w600,
          height: 1.25),
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: AppColors.white,
    ),
  );
}
