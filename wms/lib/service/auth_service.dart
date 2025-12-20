// lib/services/auth_service.dart

import 'package:wms/service/api_client.dart';
import 'package:wms/utils/ApiResult.dart';
import 'package:wms/utils/TokenManager.dart';

import '../models/MyMenu.dart';
import '../models/UserInfo.dart';

class AuthService {
  final ApiClient _api = ApiClient();

  // 登录
  Future<ApiResult<String>> login(String name, String password) async {
    var result = await _api.post<String>(
      '/ssoApi/app/doLogin',
      data: {'name': name, 'pwd': password},
    );
    return result;
  }

  //是否登录
  Future<bool> isLogin() async {
    return await TokenManager.isLoggedIn();
  }

  // 获取用户信息
  Future<ApiResult<UserInfo>> myInfo() async {
    final result = await _api.post<UserInfo>(
      '/operationApi/perm/query/myInfo',
      data: {},
      fromJson: (json) {
        final map = json as Map<String, dynamic>;
        return UserInfo.fromJson(map);
      },
    );
    return result;
  }

  // 获取我的菜单
  Future<ApiResult<List<MyMenu>>> myMenu() async {
    var result = await _api.post<List<MyMenu>>(
      '/operationApi/perm/query/myMenu',
      data: {},
      fromJson: (json) {
        if (json != null) {
          final list = json as List;
          return list
              .map((e) => MyMenu.fromJson(e as Map<String, dynamic>))
              .toList();
        } else {
          return <MyMenu>[];
        }
      },
    );
    return result;
  }
}
