import 'package:flutter/material.dart';

import 'chat/message_page.dart';

//应用页面使用有状态 Widget
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

//应用页面状态实现类
class AppState extends State<App> {

  //当前选中页面索引
  var _currentIndex=0;

  //聊天页面
  MessagePage message;

  //好友页面

  //我的页面

  currentPage(){

  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
