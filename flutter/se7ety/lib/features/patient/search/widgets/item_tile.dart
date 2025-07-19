import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/app_colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';

class TileWidget extends StatelessWidget {
  const TileWidget({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 27,
            width: 27,
            color: AppColors.primaryColor,
            child: Icon(icon, color: Colors.white, size: 16),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: getBodyStyle())),
      ],
    );
  }
}
