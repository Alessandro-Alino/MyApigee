import 'package:myapigee/config/shared_prefs/app_shared_prefs.dart';

class AppSidebarService {
  static const String _sideBarKey = 'app_sidebar';

  // Use the singleton instance of AppSharedPrefs
  final AppSharedPrefs _prefs = AppSharedPrefs();

  // Save Status Sidebar
  Future<bool> saveStatusSidebar(bool value) async {
    final bool result = await _prefs.saveBool(_sideBarKey, value);
    return result;
  }

  // Get Status Sidebar
  bool? getStatusSidebar() {
    return _prefs.getBool(_sideBarKey);
  }
}
