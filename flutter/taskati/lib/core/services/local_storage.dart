import 'package:hive/hive.dart';
import 'package:taskati/core/model/task_model.dart';

class LocalStorage {
  static late Box userBox;
  static late Box<TaskModel> tasksBox;
  static const String name = 'name';
  static const String image = 'image';
  static const String isDarkMode = 'isDarkMode';

  static init() {
    userBox = Hive.box('user');
    tasksBox = Hive.box<TaskModel>('tasks');
  }

  static cacheData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getData(String key) {
    return userBox.get(key);
  }

  static cacheTask(String key, TaskModel value) {
    tasksBox.put(key, value);
  }

  static TaskModel? getTask(String key) {
    return tasksBox.get(key);
  }
}
