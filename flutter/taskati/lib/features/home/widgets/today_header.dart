import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/add_task/add_task_screen.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: TextStyles.getBodyTextStyle(context,
                  fontWeight: FontWeight.bold),
            ),
            Text('Today',
                style: TextStyles.getBodyTextStyle(context,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        MainButton(
          width: 137,
          title: '+ Add Task',
          onPressed: () {
            context.pushTo(const AddTaskScreen());
          },
        )
      ],
    );
  }
}
