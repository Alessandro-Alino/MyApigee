import 'package:myapigee/config/shared_prefs/app_shared_prefs.dart';

class CreateProxyRepo {
  static const String _outputPathKey = 'create_proxy_output_folder';

  // Use the singleton instance of AppSharedPrefs
  final AppSharedPrefs _prefs = AppSharedPrefs();

  // Save OutputPath
  Future<bool> saveOutputPath(String value) {
    return _prefs.saveString(_outputPathKey, value);
  }

  // Get OutputPath
  String? getOutputPath() {
    return _prefs.getString(_outputPathKey);
  }

  // Delete OutputPath
  Future<bool> deleteOutputPath() {
    return _prefs.remove(_outputPathKey);
  }
}
