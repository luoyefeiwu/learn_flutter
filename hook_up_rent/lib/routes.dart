import 'package:fluro/fluro.dart';
import 'package:hook_up_rent/pages/home/index.dart';
import 'package:hook_up_rent/pages/login.dart';
import 'package:hook_up_rent/pages/not_found.dart';
import 'package:hook_up_rent/pages/register.dart';

class Routes {
  //定义路由名称
  static String home = '/';
  static String login = '/login';
  static String redister = '/regsiter';

  //定义路由处理函数
  static final Handler _homeHandler = Handler(handlerFunc: (context, params) {
    return const HomePage();
  });

  static final Handler _loginHandler = Handler(handlerFunc: (context, params) {
    return const LoginPage();
  });

  static final Handler _registerHandler =
      Handler(handlerFunc: (context, params) {
    return const RegisterPage();
  });

  static final Handler _notFoundHandler =
      Handler(handlerFunc: (context, params) {
    return const NotFoundPage();
  });

  //编写函数 configureRoutes 关联路由名称和处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(redister, handler: _registerHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
