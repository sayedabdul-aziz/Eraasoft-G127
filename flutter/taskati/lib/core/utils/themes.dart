import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_fonts.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class AppThemes {
  static get lightTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.whiteColor,
      fontFamily: AppFonts.poppins,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.whiteColor,
          centerTitle: true,
          foregroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(
            fontSize: 18,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.poppins,
          )),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor, onSurface: AppColors.blackColor),
      datePickerTheme:
          const DatePickerThemeData(backgroundColor: AppColors.whiteColor),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyles.getSmallTextStyle(),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(10)),
      ));

  static get darkTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.darkColor,
      fontFamily: AppFonts.poppins,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.darkColor,
          centerTitle: true,
          foregroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(
            fontSize: 18,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.poppins,
          )),
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor, onSurface: AppColors.whiteColor),
      datePickerTheme:
          const DatePickerThemeData(backgroundColor: AppColors.blackColor),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyles.getSmallTextStyle(),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.redColor),
            borderRadius: BorderRadius.circular(10)),
      ));
}
