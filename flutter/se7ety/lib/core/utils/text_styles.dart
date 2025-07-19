import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/app_colors.dart';

TextStyle getHeadline1Style({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize ?? 24,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? AppColors.darkColor,
  );
}

TextStyle getHeadline2Style({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize ?? 20,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? AppColors.darkColor,
  );
}

TextStyle getTitleStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    fontWeight: fontWeight ?? FontWeight.w600,
    color: color ?? AppColors.primaryColor,
  );
}

TextStyle getBodyStyle({
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

TextStyle getSmallStyle({
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
