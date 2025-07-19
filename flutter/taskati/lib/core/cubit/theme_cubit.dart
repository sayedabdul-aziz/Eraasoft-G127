import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskati/core/cubit/theme_state.dart';
import 'package:taskati/core/services/local_storage.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState());

  bool isDarkTheme = LocalStorage.getData(LocalStorage.isDarkMode) ?? false;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    LocalStorage.cacheData(LocalStorage.isDarkMode, isDarkTheme);
    emit(ThemeUpdatesState());
  }
}
