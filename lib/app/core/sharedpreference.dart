import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefStore {
  static const _tokenKey = 'token';
  static const _userIdKey = 'userId';

  static Future<void> setBearerToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_tokenKey, token);
  }

  static Future<void> setUserId(String userId) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_userIdKey, userId);
  }

  static Future<String?> getBearerToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_tokenKey);
  }

  static Future<String?> getUserId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_userIdKey);
  }

  static Future<void> removeBearerToken() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove(_tokenKey);
    await pref.remove(_userIdKey);
  }
}
