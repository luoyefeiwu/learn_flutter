//路由守卫
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wms/router/routes.dart';

import '../service/auth_service.dart';

Future<String?> checkAuth(BuildContext context, GoRouterState state) async {
  // 模拟检查登录状态（实际应从状态管理获取）
  final isLoggedIn = await AuthService().isLogin();
  if (!isLoggedIn) {
    // 拦截并跳转到登录页，携带原路径
    // return {Routes.login}?redirect=${Uri.encodeFull(state.uri.toString())}';
    return Routes.login;
  }
  return null; // 允许访问
}
