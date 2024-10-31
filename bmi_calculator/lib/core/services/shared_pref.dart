import 'package:shared_preferences/shared_preferences.dart';

class CachedData {
  static late SharedPreferences sharedPref;

  static Future<void> cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future<bool> setDate(
      {required String key, required dynamic value}) async {
    if (value is String) {
      sharedPref.setString(key, value);
    }
    if (value is int) {
      sharedPref.setInt(key, value);
    }
    if (value is double) {
      sharedPref.setDouble(key, value);
    }
    if (value is bool) {
      sharedPref.setBool(key, value);
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return sharedPref.getString(key);
  }

  static void deleteData({required String key}) {
    sharedPref.remove(key);
  }
}
