//主路由

import 'package:go_router/go_router.dart';

import '../pages/error_page.dart';
import '../pages/home/home_page.dart';
import '../pages/home/index_page.dart';
import '../pages/login_page.dart';

import 'guards.dart';
import 'routes.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.index,
  redirect: checkAuth,
  routes: [
    GoRoute(
      path: '/index',
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
      // LoginPage(redirect: state.uri.queryParameters['redirect']),
    ),
    // GoRoute(
    //   path: Routes.user,
    //   name: 'user',
    //   builder: (context, state) => const UserPage(),
    //   redirect: checkAuth, // ← 应用守卫
    // ),
    // GoRoute(
    //   path: Routes.search,
    //   name: 'search',
    //   builder: (context, state) {
    //     final q = state.uri.queryParameters['q'] ?? '';
    //     return SearchPage(keyword: q);
    //   },
    // ),
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);
