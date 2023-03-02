import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> fetchData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString(key);
  }
}
