import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jerry Flutter Demo',
      home: Scaffold(
        appBar: new AppBar(title: new Text("ListView Widget")),
        body: new ListView(
          children: <Widget>[
            new ListTile(

            )
          ],
        ),
      ),
    );
  }
}
