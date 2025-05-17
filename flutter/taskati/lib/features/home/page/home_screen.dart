import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/features/home/widgets/home_header.dart';
import 'package:taskati/features/home/widgets/task_list_builder.dart';
import 'package:taskati/features/home/widgets/today_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const HomeHeader(),
              const Gap(15),
              const TodayHeader(),
              const Gap(15),
              DatePicker(
                height: 90,
                width: 70,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {},
              ),
              const Gap(15),
              const TaskListBuilder()
            ],
          ),
        ),
      ),
    );
  }
}
