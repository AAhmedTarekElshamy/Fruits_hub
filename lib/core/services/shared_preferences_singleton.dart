import 'package:shared_preferences/shared_preferences.dart';

class Prefs  {
  static late SharedPreferences _prefs;

  /// Initialize the instance
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save data
  static Future setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  /// Read data
  static bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  static Future setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  static Future remove(String key) async {
    await _prefs.remove(key);
  }

  static Future clear() async {
    await _prefs.clear();
  }
}