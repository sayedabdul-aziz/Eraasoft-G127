import 'package:counter_app/core/colors.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.bgColor,
  });
  final IconData icon;
  final String text;
  final Function() onTap;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColors.white, size: 100),
                Text(
                  text,
                  style: const TextStyle(color: AppColors.white, fontSize: 22),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
