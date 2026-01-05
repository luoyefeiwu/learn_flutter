import 'package:wms/config/cache_key.dart';

class Config {
  /// 白名单
  static final List<String> whiteList = [
    '/auth/login',
    '/auth/register',
    '/public/version',
    '/captcha', // 示例
  ];

  /// 缓存key 列表
  static final List<String> cacheKeyList = [
    CacheKey.userInfo,
    CacheKey.warehouseInfo,
    CacheKey.tokenKey,
  ];
  static final baseUrl = 'https://www.xxxxx.com/';
}
