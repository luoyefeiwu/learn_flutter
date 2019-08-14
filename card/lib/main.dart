import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: "Card 卡片使用",
      home: new MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = new SizedBox(
      height: 250.0,
      child: new Card(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(
                "北京市世方豪庭1602A",
                style: new TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: new Text("升官发财公司"),
              leading: new Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text(
                "升官发大财公司",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              subtitle: new Text("一木培训机构"),
              leading: new Icon(
                Icons.school,
                color: Colors.lightBlue,
              ),
            ),
            new Divider(),
          ],
        ),
      ),
    );    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Card布局例子"),
      ),
      body: new Center(
        child: card,
      ),
    );
  }
}
