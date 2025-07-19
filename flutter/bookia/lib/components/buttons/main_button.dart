import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.height,
    this.width,
    required this.text,
    required this.onPressed,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
  });

  final double? height;
  final double? width;
  final String text;
  final Function() onPressed;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.primaryColor,
          side: borderColor != null
              ? BorderSide(color: borderColor ?? AppColors.darkColor)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
        child: Text(
          text,
          style: TextStyles.getBody(color: textColor ?? AppColors.whiteColor),
        ),
      ),
    );
  }
}
