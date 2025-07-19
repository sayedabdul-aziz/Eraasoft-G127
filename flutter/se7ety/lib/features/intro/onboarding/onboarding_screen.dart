import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/components/buttons/main_button.dart';
import 'package:se7ety/core/extensions/navigation.dart';
import 'package:se7ety/core/routers/routers.dart';
import 'package:se7ety/core/services/shared_pref.dart';
import 'package:se7ety/core/utils/app_colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/intro/onboarding/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          if (_currentIndex != onboardingList.length - 1)
            TextButton(
              onPressed: () {
                SharedPref.setBool(SharedPref.kOnboardingShown, true);
                context.pushWithReplacement(Routes.welcome);
              },
              child: Text(
                'تخطي',
                style: getBodyStyle(color: AppColors.primaryColor),
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Spacer(flex: 1),
                      SvgPicture.asset(
                        onboardingList[index].imagePath,
                        width: 250,
                      ),
                      Spacer(flex: 1),
                      Text(
                        onboardingList[index].title,
                        style: getTitleStyle(color: AppColors.primaryColor),
                      ),
                      Gap(15),
                      Text(
                        onboardingList[index].description,
                        style: getBodyStyle(),
                        textAlign: TextAlign.center,
                      ),
                      Spacer(flex: 4),
                    ],
                  );
                },
              ),
            ),

            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: WormEffect(
                      dotWidth: 14,
                      dotHeight: 9,
                      activeDotColor: AppColors.primaryColor,
                      dotColor: AppColors.greyColor,
                    ),
                  ),
                  if (_currentIndex == onboardingList.length - 1)
                    MainButton(
                      width: 100,
                      height: 40,
                      text: 'هيا بنا',
                      onPressed: () {
                        SharedPref.setBool(SharedPref.kOnboardingShown, true);
                        context.pushWithReplacement(Routes.welcome);
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
