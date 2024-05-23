import 'package:demo2/pages/home/Index.dart';
import 'package:demo2/pages/outStorage/FreeContainer.dart';
import 'package:flutter/material.dart';

import 'config/HttpUtil.dart';
import 'pages/home/login.dart';
import 'config/Api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HttpUtils.init(
      baseUrl: serviceUrl,
    );
    return MaterialApp(
        title: 'wms',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.white),
        home: Login(title: "dtwms"),
        //home: Index(),
        routes: <String, WidgetBuilder>{
          "/login": (BuildContext context) => Login(title: "dtwms"),
          "/index": (BuildContext context) => Index(title: "dtwms"),
          "/free": (BuildContext context) => FreeContainer(title: "dtwms")
        });
  }
}
