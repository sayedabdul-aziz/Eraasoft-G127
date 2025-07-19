import 'dart:convert';

import 'package:bookia/features/auth/data/model/response/user_response/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref _instance = SharedPref._internal();
  static late SharedPreferences prefs;

  SharedPref._internal();

  factory SharedPref() {
    return _instance;
  }

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String kToken = 'kToken';
  static const String kUserInfo = 'kUserInfo';

  static Future<void> setUserInfo(User user) async {
    var modelToJson = user.toJson();
    String jsonToString = json.encode(modelToJson);
    setString(kUserInfo, jsonToString);
  }

  static User? getUserInfo() {
    var cachedUserString = getString(kUserInfo);
    if (cachedUserString.isEmpty) return null;
    var stringToJson = json.decode(cachedUserString);
    var jsonToModel = User.fromJson(stringToJson);
    return jsonToModel;
  }

  static Future<void> setUserToken(String value) async {
    setString(kToken, value);
  }

  static String getUserToken() {
    return getString(kToken);
  }

  static Future<void> removeUserData() async {
    await remove(kToken);
    await remove(kUserInfo);
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
