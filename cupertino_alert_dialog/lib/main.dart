import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CupertinoAlertDialog例子",
      home: Scaffold(
        appBar: AppBar(
          title: Text("CupertinoAlertDialog例子AppBar"),
        ),
        body: Center(
          child: CupertinoAlertDialog(
            title: Text("提示!"),
            content: SingleChildScrollView(
              //对话框内容部分
              child: ListBody(
                children: <Widget>[
                  Text("是否删除?"),
                  Text("一单删除数据不可恢复!"),
                ],
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("确定"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: Text("取消"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
