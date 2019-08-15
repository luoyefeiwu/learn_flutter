import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Container 容器例子",
      home: new Layoutdemo(),
    );
  }
}

class Layoutdemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //返回一个 Container 对象
    Widget container = new Container(
      //添加装饰效果
      decoration: new BoxDecoration(color: Colors.grey),
      //子元素指定一个垂直水平嵌套布局的组件
      child: new Column(
        children: <Widget>[
          //使用 Expanded防止内存溢出
          new Expanded(
              child: new Container(
            width: 150.0,
            height: 150.0,
            decoration: new BoxDecoration(
                //上下左右边框设置为宽度10.0，颜色为蓝灰色
                border: new Border.all(width: 10.0, color: Colors.blueGrey),
                //上下左右边框弧度设置为 8.0
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0))),
            //上下左右增加边框距
            margin: const EdgeInsets.all(4.0),
            //添加图片
            child: new Image.asset("images/1.png"),
          )),
          new Expanded(
              child: new Container(
            width: 150.0,
            height: 150.0,
            decoration: new BoxDecoration(),
            //上下左右增加边框距
            margin: const EdgeInsets.all(4.0),
            //添加图片
            child: new Image.asset("images/2.jpg"),
          )),
          new Expanded(
              child: new Container(
            width: 150.0,
            height: 150.0,
            decoration: new BoxDecoration(
                border: new Border.all(width: 10.0, color: Colors.blueGrey),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0))),
            //上下左右增加边框距
            margin: const EdgeInsets.all(4.0),
            //添加图片
            child: new Image.asset("images/3.jpg"),
          )),
          new Expanded(
              child: new Container(
            width: 150.0,
            height: 150.0,
            decoration: new BoxDecoration(
                border: new Border.all(width: 10.0, color: Colors.blueGrey),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0))),
            //上下左右增加边框距
            margin: const EdgeInsets.all(4.0),
            //添加图片
            child: new Image.asset("images/4.jpg"),
          ))
        ],
      ),
    );
    return new Scaffold(
      appBar: AppBar(
        title: Text("Container布局容器例子"),
      ),
      body: container,
    );
  }
}
