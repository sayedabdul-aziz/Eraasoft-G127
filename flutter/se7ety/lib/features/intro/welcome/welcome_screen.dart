import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/extensions/navigation.dart';
import 'package:se7ety/core/routers/routers.dart';
import 'package:se7ety/core/utils/app_colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/auth/data/models/user_enum.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome-bg.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          PositionedDirectional(
            // padding: const EdgeInsets.only(top: 100, right: 25),
            top: 100,
            start: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('اهلا بيك', style: getTitleStyle(fontSize: 38)),
                const Gap(15),
                Text('سجل واحجز عند دكتورك وانت فالبيت', style: getBodyStyle()),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 80,
            start: 25,
            end: 25,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: .5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .3),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'سجل دلوقتي كــ',
                    style: getBodyStyle(fontSize: 18, color: AppColors.white),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushTo(
                            Routes.login,
                            extra: UserTypeEnum.doctor,
                          );
                        },
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: AppColors.accentColor.withValues(alpha: .7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'دكتور',
                              style: getTitleStyle(color: AppColors.darkColor),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          context.pushTo(
                            Routes.login,
                            extra: UserTypeEnum.patient,
                          );
                        },
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            color: AppColors.accentColor.withValues(alpha: .7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'مريض',
                              style: getTitleStyle(color: AppColors.darkColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
