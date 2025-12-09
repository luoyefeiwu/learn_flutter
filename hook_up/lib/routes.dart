import 'package:fluro/fluro.dart';
import 'package:hook_up/pages/home/index.dart';
import 'package:hook_up/pages/home/setting.dart';
import 'package:hook_up/pages/login.dart';
import 'package:hook_up/pages/not_found.dart';
import 'package:hook_up/pages/register.dart';
import 'package:hook_up/pages/room_add/index.dart';
import 'package:hook_up/pages/room_detail/index.dart';

import 'pages/room_manage/RoomManagePage.dart';

class Routes {
  //定义路由名称
  static String home = '/';
  static String login = '/login';
  static String redister = '/regsiter';
  static String roomDetail = '/roomDetail/:roomId';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';


  static final Handler _notFoundHandler =
  Handler(handlerFunc: (context, params) {
    return const NotFoundPage();
  });

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

  static final Handler _settingHandler =
      Handler(handlerFunc: (context, params) {
    return const SettingPage();
  });

  static final Handler _roomManageHandler =
      Handler(handlerFunc: (context, params) {
    return const RoomManagePage();
  });

  static final Handler _roomAddHandler =
      Handler(handlerFunc: (context, params) {
    return const RoomAddPage();
  });

  static final Handler _roomDetailHandler =
      Handler(handlerFunc: (context, params) {
    final String roomId = params['roomId']?.first ?? '';
    return RoomDetailPage(roomId: roomId);
  });

  //编写函数 configureRoutes 关联路由名称和处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(redister, handler: _registerHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
