import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  //Create  Singleton
  static final AppSharedPrefs _instance = AppSharedPrefs._internal();

  late SharedPreferences _prefs;

  factory AppSharedPrefs() {
    return _instance;
  }

  AppSharedPrefs._internal();

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> saveString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> saveStringList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  Future<bool> saveBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
