// lib/services/auth_service.dart

import 'package:wms/service/api_client.dart';
import 'package:wms/utils/ApiResult.dart';
import 'package:wms/utils/TokenManager.dart';

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

  Future<bool> isLogin() async {
    return await TokenManager.isLoggedIn();
  }

  //


  // 获取用户信息
  // Future<Map<String, dynamic>> getUserInfo() async {
  //   final data = await _api.get<Map<String, dynamic>>('/user/profile');
  //   return data;
  // }
}
