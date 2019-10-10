import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import './loading.dart';

//应用程序入口
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '宴会',
      //自定义主题
      theme: mDefaultTheme,
      //添加路由表
      routes: <String, WidgetBuilder>{
        "app": (_) => new WebviewScaffold(
              //Webview插件
              url: "http://218.245.1.14:8000",
              appBar: new AppBar(
                title: new Text("接口文档"),
              ),
              withZoom: true,
              withLocalStorage: true,
            ),
      },
      //指定首页 默认为加载页面
      home: new LoadingPage(),
    ));

//自定义主题 绿色小清新风格
final ThemeData mDefaultTheme = new ThemeData(
  primaryColor: Colors.green,
  scaffoldBackgroundColor: Color(0xFFebebeb),
  cardColor: Colors.green,
);
