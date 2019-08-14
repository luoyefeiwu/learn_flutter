import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CupertinoButton例子",
      home: Scaffold(
        appBar: AppBar(
          title: Text("CupertinoButton组件例子"),
        ),
        body: Center(
          child: CupertinoButton(
              child: Text("CupertinoButton组件例子"),
              color: Colors.blue,
              onPressed: () {}),
        ),
      ),
    );
  }
}
