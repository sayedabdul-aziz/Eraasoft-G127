import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref _instance = SharedPref._internal();
  static late SharedPreferences prefs;

  static String kUserId = 'kUserId';
  static String kOnboardingShown = 'kOnboardingShown';

  SharedPref._internal();

  factory SharedPref() {
    return _instance;
  }

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveUserId(String userId) {
    setString(kUserId, userId);
  }

  static String getUserId() {
    return getString(kUserId);
  }

  static Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  static String getString(String key) {
    return prefs.getString(key) ?? '';
  }

  static Future<void> setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  static bool getBool(String key) {
    return prefs.getBool(key) ?? false;
  }

  static Future<void> remove(String key) async {
    await prefs.remove(key);
  }

  static Future<void> clear() async {
    await prefs.clear();
  }

  static Future<void> setInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  static int getInt(String key) {
    return prefs.getInt(key) ?? 0;
  }

  static Future<void> setDouble(String key, double value) async {
    await prefs.setDouble(key, value);
  }

  static double getDouble(String key) {
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future<void> setStringList(String key, List<String> value) async {
    await prefs.setStringList(key, value);
  }

  static List<String> getStringList(String key) {
    return prefs.getStringList(key) ?? [];
  }
}
