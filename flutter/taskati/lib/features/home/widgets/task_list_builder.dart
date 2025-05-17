import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class TaskListBuilder extends StatelessWidget {
  const TaskListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'fLUTTER tASK - 1',
                        style: TextStyles.getBodyTextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor),
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
                            '09:00 AM',
                            style: TextStyles.getSmallTextStyle(
                                color: AppColors.whiteColor),
                          )
                        ],
                      ),
                      const Gap(5),
                      Text(
                        'fLUTTER tASK - 1',
                        style: TextStyles.getBodyTextStyle(
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
                    'TODO',
                    style: TextStyles.getSmallTextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.whiteColor),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
