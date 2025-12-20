import 'dart:convert';

import 'package:wms/models/UserInfo.dart';
import 'package:wms/models/Warehouse.dart';

import 'TokenManager.dart';

class WarehouseUtils {
  /// 获取仓库信息
  static Future<Warehouse?> getWarehouseInfo() async {
    var cache = await TokenManager.getCache(TokenManager.warehouseInfo);
    if (cache == null) {
      return null;
    } else {
      return Warehouse.fromJson(json.decode(cache));
    }
  }

  /// 获取用户信息
  static Future<UserInfo?> getUserInfo() async {
    var cache = await TokenManager.getCache(TokenManager.userInfo);
    if (cache == null) {
      return null;
    } else {
      return UserInfo.fromJson(json.decode(cache));
    }
  }
}
