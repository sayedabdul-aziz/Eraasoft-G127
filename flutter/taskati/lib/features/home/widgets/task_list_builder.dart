import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/home/widgets/task_card.dart';

class TaskListBuilder extends StatelessWidget {
  const TaskListBuilder({
    super.key,
    required this.selectedDate,
  });
  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder(
        valueListenable: LocalStorage.tasksBox.listenable(),
        builder: (context, box, child) {
          List<TaskModel> tasks = [];
          for (var task in box.values) {
            if (selectedDate == task.date) {
              tasks.add(task);
            }
          }

          if (tasks.isEmpty) {
            return Center(
              child: Lottie.asset(AppImages.empty, width: 300),
            );
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                background: completeTaskUi(),
                secondaryBackground: deleteTaskUi(),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    box.delete(tasks[index].id);
                  } else {
                    box.put(tasks[index].id,
                        tasks[index].copyWith(isCompleted: true));
                  }
                },
                child: TaskCard(model: tasks[index]),
              );
            },
          );
        },
      ),
    );
  }

  Container completeTaskUi() {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.check,
            color: AppColors.whiteColor,
          ),
          Gap(10),
          Text(
            'Complete Task',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(10),
        ],
      ),
    );
  }

  Container deleteTaskUi() {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.redColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.delete,
            color: AppColors.whiteColor,
          ),
          Gap(10),
          Text(
            'Delete Task',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
