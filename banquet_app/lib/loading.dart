import 'package:flutter/material.dart';

// 加载页面
class LoadingPage extends StatefulWidget {
  @override
  _LoadingState createState() => new _LoadingState();
}

class _LoadingState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    //在加载页面停顿3秒
    new Future.delayed(Duration(seconds: 3), () {
      print("宴会app接口文档....");
      Navigator.of(context).pushReplacementNamed("app");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Stack(
        children: <Widget>[
          //加载页面居中背景图 使用cover模式
          Image.asset(
            "images/loading.jpeg",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
