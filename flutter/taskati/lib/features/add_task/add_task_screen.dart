import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/main_button.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int selectedColor = 0;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat("yyyy-MM-dd").format(DateTime.now());
    startTimeController.text = DateFormat("hh:mm a").format(DateTime.now());
    endTimeController.text = DateFormat("hh:mm a").format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title(),
              const Gap(10),
              description(),
              const Gap(10),
              date(),
              const Gap(10),
              Row(
                children: [
                  startTime(),
                  const Gap(10),
                  endTime(),
                ],
              ),
              const Gap(10),
              color()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: MainButton(width: 160, title: 'Create Task', onPressed: () {}),
      ),
    );
  }

  Column title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Title',
            style: TextStyles.getBodyTextStyle(fontWeight: FontWeight.w500)),
        const Gap(5),
        TextFormField(
          controller: titleController,
          decoration: const InputDecoration(
            hintText: 'Enter title',
          ),
        ),
      ],
    );
  }

  Column description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description',
            style: TextStyles.getBodyTextStyle(fontWeight: FontWeight.w500)),
        const Gap(5),
        TextFormField(
          controller: descriptionController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Enter description',
          ),
        ),
      ],
    );
  }

  Column date() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Date',
            style: TextStyles.getBodyTextStyle(fontWeight: FontWeight.w500)),
        const Gap(5),
        TextFormField(
          readOnly: true,
          controller: dateController,
          onTap: () async {
            await selectTaskDate();
          },
          decoration: const InputDecoration(
              suffixIcon: Icon(Icons.calendar_month_outlined)),
        ),
      ],
    );
  }

  Future<void> selectTaskDate() async {
    var pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));

    if (pickedDate != null) {
      dateController.text = DateFormat("yyyy-MM-dd").format(pickedDate);
    }
  }

  Expanded startTime() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Start Time',
              style: TextStyles.getBodyTextStyle(fontWeight: FontWeight.w500)),
          const Gap(5),
          TextFormField(
            readOnly: true,
            onTap: () async {
              var pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (pickedTime != null) {
                startTimeController.text = pickedTime.format(context);
              }
            },
            controller: startTimeController,
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.watch_later_outlined)),
          ),
        ],
      ),
    );
  }

  Expanded endTime() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('End Time',
              style: TextStyles.getBodyTextStyle(fontWeight: FontWeight.w500)),
          const Gap(5),
          TextFormField(
            readOnly: true,
            onTap: () async {
              var pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (pickedTime != null) {
                endTimeController.text = pickedTime.format(context);
              }
            },
            controller: endTimeController,
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.watch_later_outlined)),
          ),
        ],
      ),
    );
  }

  Column color() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color',
            style: TextStyles.getBodyTextStyle(fontWeight: FontWeight.w500)),
        const Gap(5),
        Row(
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: CircleAvatar(
                  backgroundColor: index == 0
                      ? AppColors.primaryColor
                      : index == 1
                          ? AppColors.orangeColor
                          : AppColors.redColor,
                  child: index == selectedColor
                      ? const Icon(
                          Icons.check,
                          color: AppColors.whiteColor,
                        )
                      : null,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
