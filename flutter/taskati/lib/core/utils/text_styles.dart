import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';

class TextStyles {
  static TextStyle getTitleTextStyle({
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.bold,
    Color color = AppColors.primaryColor,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle getBodyTextStyle(
    BuildContext context, {
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).colorScheme.onSurface,
    );
  }

  static TextStyle getSmallTextStyle(
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.normal,
      Color color = AppColors.greyColor}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
