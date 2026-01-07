import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
  Future<bool> isLoggedIn();
  Future<bool> isFirstTime();
  Future<void> setFirstTimeFalse();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const _tokenKey = 'token';
  static const _firstTimeKey = 'is_first_time';
  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    if (token == null || token.trim().isEmpty) return false;
    return true;
  }

  @override
  Future<bool> isFirstTime() async {
    final prefs = await _prefs;
    return prefs.getBool(_firstTimeKey) ?? true;
  }

  @override
  Future<void> setFirstTimeFalse() async {
    final prefs = await _prefs;
    await prefs.setBool(_firstTimeKey, false);
  }
}
