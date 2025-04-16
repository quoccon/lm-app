import 'package:shared_preferences/shared_preferences.dart';

class SharePrefHelper {
  static final SharePrefHelper _singleton = SharePrefHelper._internal();

  factory SharePrefHelper() {
    return _singleton;
  }

  SharePrefHelper._internal();

  Future<bool> setValue(dynamic value, {required String key}) async {
    if (value == null) {
      return false;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (value is String) {
        return prefs.setString(key, value);
      } else if (value is int) {
        return prefs.setInt(key, value);
      } else if (value is bool) {
        return prefs.setBool(key, value);
      } else if (value is double) {
        return prefs.setDouble(key, value);
      } else if (value is List<String>) {
        return prefs.setStringList(key, value);
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<Object?> getValue({required String key}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.get(key);
    } catch (_) {
      return null;
    }
  }
}
