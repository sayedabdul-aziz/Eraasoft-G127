import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        socialCard(AppAssets.fbLogoSvg),
        Gap(10),
        socialCard(AppAssets.googleLogoSvg),
        Gap(10),
        socialCard(AppAssets.appleLogoSvg),
      ],
    );
  }

  Widget socialCard(String imgPath) {
    return Expanded(
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: SvgPicture.asset(imgPath, width: 26, height: 26)),
      ),
    );
  }
}
