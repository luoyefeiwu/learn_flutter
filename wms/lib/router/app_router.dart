//主路由

import 'package:go_router/go_router.dart';

import '../pages/error_page.dart';
import '../pages/home/home_page.dart';
import '../pages/login_page.dart';

import 'guards.dart';
import 'routes.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: '/',
      name: 'index',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: Routes.home,
      name: 'home',
      builder: (context, state) => HomePage(),
      redirect: checkAuth,
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
