import 'package:flutter/material.dart';
import 'package:route/SecondScreen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("导航页面例子"),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("查看商品详情页面"),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new SecondScreen()));
          },
        ),
      ),
    );
  }
}
