import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.model,
  });
  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: model.isCompleted == true
              ? AppColors.greenColor
              : model.color == 0
                  ? AppColors.primaryColor
                  : model.color == 1
                      ? AppColors.orangeColor
                      : AppColors.redColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title ?? '',
                  style: TextStyles.getBodyTextStyle(context,
                      fontWeight: FontWeight.w600, color: AppColors.whiteColor),
                ),
                const Gap(5),
                Row(
                  children: [
                    const Icon(
                      Icons.watch_later_outlined,
                      color: AppColors.whiteColor,
                      size: 18,
                    ),
                    const Gap(5),
                    Text(
                      '${model.startTime} - ${model.endTime}',
                      style: TextStyles.getSmallTextStyle(
                          color: AppColors.whiteColor),
                    )
                  ],
                ),
                const Gap(5),
                Text(
                  model.description ?? '',
                  style: TextStyles.getBodyTextStyle(context,
                      color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 60,
            color: AppColors.whiteColor,
          ),
          const Gap(4),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              model.isCompleted == true ? 'COMPLETED' : 'TODO',
              style: TextStyles.getSmallTextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.whiteColor),
            ),
          )
        ],
      ),
    );
  }
}
