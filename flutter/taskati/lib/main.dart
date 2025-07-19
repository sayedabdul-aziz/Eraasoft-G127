import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/cubit/theme_cubit.dart';
import 'package:taskati/core/cubit/theme_state.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/themes.dart';
import 'package:taskati/features/intro/splash_screen.dart';

// add to dev dep. => build_runner , hive_generator
// create your model with annotation
// => hive_type(id) for class , hive_field() for field
// run command => dart run build_runner build
// register Your adapter in main function

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('user');
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');
  LocalStorage.init();
  runApp(const MainApp());
}

// to Apply Theme in our Apps
// create theme class with 2 methods for light and dark theme
// call them in MartialApp (theme : light)  (darkTheme : dark)
// toggle themes with theme mode property and use listenable to update theme

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          bool isDarkTheme = context.read<ThemeCubit>().isDarkTheme;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            darkTheme: AppThemes.darkTheme,
            theme: AppThemes.lightTheme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
