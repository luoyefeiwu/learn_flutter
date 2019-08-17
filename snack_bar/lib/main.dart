import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "SnackBar组件",
          ),
        ),
        body: Center(
          child: Text(
            "SnackBar示例",
            style: TextStyle(fontSize: 28.0),
          ),
        ),
        floatingActionButton: new Builder(builder: (BuildContext context) {
          return new FloatingActionButton(
              onPressed: () {
                //点击回调事件 弹出一句提示框
                Scaffold.of(context)
                    .showSnackBar(new SnackBar(content: Text("显示 SnackBar")));
              },
              child: const Icon(Icons.add),
              shape: new CircleBorder());
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
