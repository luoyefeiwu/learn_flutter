import 'dart:io';

import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Drawer抽屉实例"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text("落叶飞舞"),
              accountEmail: new Text("897796171@qq.com"),
              //设置用户头像
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage("images/qq.jpg"),
              ),
              onDetailsPressed: () {},
              otherAccountsPictures: <Widget>[
                new Container(child: Image.asset("images/alipay.png")),
              ],
            ),
            ListTile(
              //导航菜单
              leading: new CircleAvatar(
                child: Icon(Icons.color_lens),
              ),
              title: Text("个性装扮"),
            ),
            ListTile(
              leading: new CircleAvatar(
                child: Icon(Icons.phone),
              ),
              title: Text("我的相册"),
            ),
            ListTile(
              leading: new CircleAvatar(
                child: Icon(Icons.wifi),
              ),
              title: Text("免流量特权"),
            ),
          ],
        ),
      ),
    );
  }
}
