import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle getHeadline1({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 30,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.darkColor,
    );
  }

  static TextStyle getHeadline2({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 24,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.darkColor,
    );
  }

  static TextStyle getTitle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.darkColor,
    );
  }

  static TextStyle getBody({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.darkColor,
    );
  }

  static TextStyle getSmall({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.greyColor,
    );
  }
}
