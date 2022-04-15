// ignore: uri_does_not_exist
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AlertDialog组件",
      home: Scaffold(
        appBar: AppBar(
          title: Text("AlertDialog组件"),
        ),
        body: Center(
          child: AlertDialog(
            title: Text("提示"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("是否删除？"),
                  Text("一但删除数据不可恢复！"),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(onPressed: () {}, child: Text("确定")),
              FlatButton(onPressed: () {}, child: Text("取消"))
            ],
          ),
        ),
      ),
    );
  }
}
