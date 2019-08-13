import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 添加文本编辑控制器，监听文本输入内容变化
    final TextEditingController controller = TextEditingController();
    controller.addListener(() {
      print("你输入的内容为：${controller.text}");
    });
    return MaterialApp(
      title: "TextField组件例子",
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextField组件例子"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              //绑定 controller
              controller: controller,
              maxLength: 30,
              maxLines: 1,
              //是否自动更正
              autocorrect: true,
              //是否自动对焦
              autofocus: true,
              //是否是密码
              obscureText: false,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26.0, color: Colors.green),
              onChanged: (text) {
                print("文本内容改变时回调 $text");
              },
              //内容提交时回调
              onSubmitted: (text) {
                print("内容提交时回调 $text");
              },
            ),
          ),
        ),
      ),
    );
  }
}
