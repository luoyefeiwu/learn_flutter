import 'package:flutter/material.dart';

//商机
class Business extends StatefulWidget {
  @override
  _BusinessState createState() => new _BusinessState();
}

class _BusinessState extends State<Business>{
  @override
  void initState() {
    super.initState();
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
