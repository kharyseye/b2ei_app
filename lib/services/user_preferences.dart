import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _userIdKey = 'user_id';

  static Future<void> saveUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
  }

  static Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }
}

