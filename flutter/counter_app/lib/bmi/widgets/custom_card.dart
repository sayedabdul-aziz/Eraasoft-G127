import 'package:counter_app/core/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.title,
    required this.value,
    required this.onAdd,
    required this.onRemove,
  });
  final String title;
  final int value;
  final Function() onAdd;
  final Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(color: AppColors.white, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                value.toString(),
                style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                      style:
                          IconButton.styleFrom(backgroundColor: AppColors.grey),
                      onPressed: onRemove,
                      icon: const Icon(Icons.remove)),
                  const SizedBox(width: 10),
                  IconButton.filled(
                      style:
                          IconButton.styleFrom(backgroundColor: AppColors.grey),
                      onPressed: onAdd,
                      icon: const Icon(Icons.add))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
