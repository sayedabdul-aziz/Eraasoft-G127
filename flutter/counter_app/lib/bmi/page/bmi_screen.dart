import 'package:counter_app/bmi/page/result_screen.dart';
import 'package:counter_app/bmi/widgets/custom_card.dart';
import 'package:counter_app/bmi/widgets/gender_card.dart';
import 'package:counter_app/core/colors.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int height = 170;
  int weight = 60;
  int age = 20;
  bool isMale = true;

// Color res = (isMale) ? Colors.white : 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: AppColors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            genderType(),
            heightUi(),
            weightAndAge(),
            const SizedBox(height: 10),
            calculateBtn(),
          ],
        ),
      ),
    );
  }

  Expanded genderType() {
    return Expanded(
        child: Row(
      children: [
        GenderCard(
          icon: Icons.male,
          text: 'Male',
          bgColor: (isMale) ? AppColors.primary : AppColors.secondary,
          onTap: () {
            setState(() {
              isMale = true;
            });
          },
        ),
        const SizedBox(width: 10),
        GenderCard(
          icon: Icons.female,
          text: 'Female',
          bgColor: (isMale) ? AppColors.secondary : AppColors.primary,
          onTap: () {
            setState(() {
              isMale = false;
            });
          },
        ),
      ],
    ));
  }

  Expanded heightUi() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Height',
                style: TextStyle(color: AppColors.white, fontSize: 22),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.toString(),
                    style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    'cm',
                    style: TextStyle(color: AppColors.white, fontSize: 14),
                  ),
                ],
              ),
              Slider(
                value: height.toDouble(),
                min: 90,
                max: 240,
                activeColor: AppColors.primary,
                inactiveColor: AppColors.grey,
                onChanged: (value) {
                  setState(() {
                    height = value.toInt();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded weightAndAge() {
    return Expanded(
        child: Row(
      children: [
        CustomCard(
          title: 'Weight',
          value: weight,
          onAdd: () {
            setState(() {
              weight++;
            });
          },
          onRemove: () {
            if (weight > 10) {
              setState(() {
                weight--;
              });
            }
          },
        ),
        const SizedBox(width: 10),
        CustomCard(
          title: 'Age',
          value: age,
          onAdd: () {
            setState(() {
              age++;
            });
          },
          onRemove: () {
            if (age > 1) {
              setState(() {
                age--;
              });
            }
          },
        ),
      ],
    ));
  }

  SizedBox calculateBtn() {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              //  kg/m2
              double result = weight / ((height / 100) * (height / 100));

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(result: result)));
            },
            child: const Text(
              'Calculate',
              style: TextStyle(color: AppColors.white),
            )));
  }
}
