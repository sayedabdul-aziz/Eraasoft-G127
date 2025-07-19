import 'package:flutter/material.dart';
import 'package:se7ety/core/constants/app_assets.dart';
import 'package:se7ety/core/extensions/navigation.dart';
import 'package:se7ety/core/routers/routers.dart';
import 'package:se7ety/core/services/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isLoggedIn = SharedPref.getUserId().isNotEmpty;
    bool isOnboardingShown = SharedPref.getBool(SharedPref.kOnboardingShown);
    Future.delayed(const Duration(seconds: 3), () {
      if (isLoggedIn) {
        context.pushWithReplacement(Routes.patientMainApp);
      } else {
        if (isOnboardingShown) {
          context.pushWithReplacement(Routes.welcome);
        } else {
          context.pushWithReplacement(Routes.onboardingRoute);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppAssets.logo, width: 250)),
    );
  }
}
