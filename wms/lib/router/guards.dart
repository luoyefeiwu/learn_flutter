//路由守卫
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wms/router/routes.dart';

import '../service/auth_service.dart';

Future<String?> checkAuth(BuildContext context, GoRouterState state) async {
  final location = state.uri.toString();
  final isLoggedIn = await AuthService().isLogin();
  if (!isLoggedIn && location != '/login') {
    return Routes.login;
  }
  // 如果已登录但访问登录页，则跳转首页
  if (isLoggedIn && location == '/login') {
    return "/";
  }
  return null; // 允许访问
}
