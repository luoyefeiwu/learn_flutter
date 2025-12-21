// lib/utils/token_manager.dart
import 'package:shared_preferences/shared_preferences.dart';

import '../config/Config.dart';
import '../config/cache_key.dart';

class TokenManager {
  // 保存 Token
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(CacheKey.tokenKey, token);
  }

  // 获取 Token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheKey.tokenKey);
  }

  // 删除 Token（退出登录）
  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(CacheKey.tokenKey);
  }

  // 检查是否已登录
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  static Future<void> saveCache(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString(key);
  }

  static Future<void> clearCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> clearAllCache() async {
    final prefs = await SharedPreferences.getInstance();
    Config.cacheKeyList.forEach((key) async {
      await prefs.remove(key);
    });
  }
}
