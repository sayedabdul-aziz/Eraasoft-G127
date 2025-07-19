import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/services/local_storage.dart';
import 'package:note_app/core/utils/app_colors.dart';
import 'package:note_app/feature/home/page/home_screen.dart';
import 'package:note_app/feature/shared/cubit/note_cubit.dart';
import 'package:note_app/feature/shared/model/note_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<NoteModel>(NoteModelAdapter());
  await Hive.openBox<NoteModel>(AppLocalStorage.noteBoxName);
  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.darkColor,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.darkColor,
            centerTitle: false,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
