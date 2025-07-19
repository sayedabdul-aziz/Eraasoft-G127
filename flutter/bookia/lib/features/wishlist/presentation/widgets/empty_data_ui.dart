import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyDataUi extends StatelessWidget {
  const EmptyDataUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.not_interested_rounded,
            size: 100,
            color: AppColors.greyColor,
          ),
          Gap(20),
          Text('Your wishlist is empty', style: TextStyles.getTitle()),
        ],
      ),
    );
  }
}
