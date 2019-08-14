import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CupertionActivityIndicator例子",
      home: Scaffold(
        appBar: AppBar(
          title: Text("CupertionActivityIndicator例子"),
        ),
        body: Center(
          child: CupertinoActivityIndicator(
            radius: 60.0, //值越大加载的图形越大
          ),
        ),
      ),
    );
  }
}
