//主路由

import 'package:go_router/go_router.dart';
import 'package:wms/pages/receive/receive_cross_page.dart';

import '../pages/error_page.dart';
import '../pages/home/home_page.dart';
import '../pages/home/index_page.dart';
import '../pages/login_page.dart';

import '../pages/receive/receive_config_page.dart';
import 'guards.dart';
import 'routes.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.index,
  redirect: checkAuth,
  routes: [
    GoRoute(
      path: Routes.index,
      name: 'index',
      builder: (context, state) => IndexPage(),
    ),
    GoRoute(
      path: Routes.home,
      name: 'home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: Routes.login,
      name: 'login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: Routes.receiveConfig,
      name: 'receiveConfig',
      builder: (context, state) => ReceiveConfigPage(),
    ),
    GoRoute(
      path: Routes.receiveCross,
      name: 'receiveCross',
      builder: (context, state) => ReceiveCrossPage(),
    ),
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);
