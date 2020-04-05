import 'package:flutter/material.dart';
import 'AlertDialogDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SimpleDialog组件示例",
      home: Scaffold(
        appBar: AppBar(
          title: Text("SimpleDialog组件示例"),
        ),
        body: AlertDialogDemo(),
      ),
    );
  }
}
