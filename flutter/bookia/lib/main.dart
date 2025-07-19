import 'package:bookia/core/routers/routers.dart';
import 'package:bookia/core/services/dio_provider.dart';
import 'package:bookia/core/services/shared_pref.dart';
import 'package:bookia/core/utils/themes.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioProvider.init();
  await SharedPref.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routers,
      theme: AppThemes.lightTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
