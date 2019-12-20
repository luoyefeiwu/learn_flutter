import 'package:flutter/material.dart';
import './loading.dart';

//应用程序入口
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '宴会',
      //自定义主题
      theme: mDefaultTheme,
      //添加路由表
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => new Business(),
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
