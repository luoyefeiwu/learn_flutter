import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "FloatingActionButton示例",
        home: Scaffold(
          appBar: AppBar(
            title: Text("FloatingActionButton示例"),
          ),
          body: Center(
            child: Text(
              "FloatingActionButton示例",
              style: TextStyle(fontSize: 28.0),
            ),
          ),
          floatingActionButton: new Builder(builder: (BuildContext context) {
            return new FloatingActionButton(
              child: const Icon(Icons.add),
              tooltip: "请求点击FloatingActionButton示例",
              //前景色为白色
              foregroundColor: Colors.white,
              //背景为蓝色
              backgroundColor: Colors.blue,
              //未点击阴影值
              elevation: 7.0,
              highlightElevation: 14.0,
              onPressed: () {
                //点击回调事件 弹出一句提示语句
                Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text("你点击了请求点击FloatingActionButton示例")));
              },
              mini: false,
              //圆形边
              shape: new CircleBorder(),
              isExtended: false,
            );
          }),
          //居中放置，位置可以设置成左居中
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}
