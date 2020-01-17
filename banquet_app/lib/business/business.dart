import 'package:flutter/material.dart';

//商机
class Business extends StatefulWidget {
  @override
  _BusinessState createState() => new _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "创建商机",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  //点击回调事件 弹出一句提示框
                  Scaffold.of(context)
                      .showSnackBar(new SnackBar(content: Text("返回")));
                }),
            centerTitle: true,
            backgroundColor: Colors.green),
    );
  }
}
