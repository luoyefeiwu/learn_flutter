// 路由
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 所有路由路径常量
class Routes {
  static const String home = '/home';
  static const String index = '/index';
  static const String login = '/login';
  static const String receiveConfig = '/receiveConfig';
  static const String receiveCross = '/receiveCross';
  static const String qrScanner = '/qrScanner';
  static const String packingCross = '/packingCross';
}

/// 路由参数封装（可选，用于复杂场景）
// class UserArgs {
//   final String id;
//
//   UserArgs(this.id);
// }

/// 路由跳转扩展（核心！）
extension GoRouterX on BuildContext {
  // 无参跳转
  void pushRoute(String path) => go(path);

  // 命名跳转（推荐）
  void pushNamed(
    String name, {
    Map<String, String>? pathParameters,
    Map<String, dynamic>? queryParameters,
  }) => goNamed(
    name,
    pathParameters: pathParameters!,
    queryParameters: queryParameters!,
  );

  // 特定页面跳转（类型安全）
  void toHome() => go(Routes.home);

  void toLogin({String? redirect}) {
    go(Routes.login, extra: redirect);
  }

  // void toUser(String id) => go(Routes.user.replaceAll(':id', id));
  //
  // void toSearch(String keyword) => go('${Routes.search}?q=$keyword');
}
