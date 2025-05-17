import 'package:hive/hive.dart';

class LocalStorage {
  static late Box _box;
  static const String name = 'name';
  static const String image = 'image';

  static init() {
    _box = Hive.box('user');
  }

  static cacheData(String key, String value) {
    _box.put(key, value);
  }

  static getData(String key) {
    return _box.get(key);
  }
}
