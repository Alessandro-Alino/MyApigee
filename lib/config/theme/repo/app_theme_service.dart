
import 'package:myapigee/config/shared_prefs/app_shared_prefs.dart';

class AppThemeService {
  static const String _themeKey = 'app_theme';

  // Use the singleton instance of AppSharedPrefs
  final AppSharedPrefs _prefs = AppSharedPrefs();

  // Save Theme
  Future<bool> saveTheme(String value) {
    return _prefs.saveString(_themeKey,value);
  }

  // Get Theme
  String? getTheme() {
    return _prefs.getString(_themeKey);
  }

  // Delete Theme
  Future<bool> deleteTheme() {
    return _prefs.remove(_themeKey);
  }

}