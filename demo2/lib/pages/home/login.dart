import 'dart:convert';

import 'package:demo2/config/HttpUtil.dart';
import 'package:flutter/material.dart';
import 'package:demo2/r.dart';
import 'package:demo2/config/Api.dart';

import '../../common/Token.dart';
import '../../config/ApiResponse.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _loginNameController = TextEditingController(text: 'HuangChuanWang');
  final TextEditingController _passWorldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Center(child: Text(widget.title)),
      // ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                R.assetsImagesHomeIndex,
                fit: BoxFit.cover,
              ),
              padding: EdgeInsets.only(top: 200),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text("欢迎登录鼎腾WMS",
                  style: TextStyle(color: Colors.black, fontSize: 25)),
            ),
            Container(
              // margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              height: 200,
              padding: const EdgeInsets.all(20),
              //color: Colors.black12,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: TextField(
                      controller: _loginNameController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          prefixIcon: Container(
                              width: 10,
                              child: const Row(
                                children: [
                                  Icon(Icons.star, color: Colors.red, size: 10),
                                  Text("账号")
                                ],
                              )),
                          filled: true,
                          fillColor: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: _passWorldController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Container(
                            width: 10,
                            child: const Row(
                              children: [
                                Icon(Icons.star, color: Colors.red, size: 10),
                                Text("密码")
                              ],
                            ),
                          ),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: MaterialButton(
                onPressed: () async {
                  String username = _loginNameController.value.text;
                  String pwd = _passWorldController.value.text;
                  var data = {"name": username, "pwd": pwd};
                  var response = await HttpUtils.post(
                      servicePath["login"].toString(),
                      data: data);
                  if (response['code'] == 200) {
                    String token = response['data'];
                    // 存储token
                    await saveToken(token);
                    //跳转至搜索页面
                    Navigator.pushNamed(context, '/index');
                  } else {
                    _showDialog(context,  response['msg']);
                  }
                },
                child: Text("登录"),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: double.infinity,
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context,String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text(msg),
            actions: <Widget>[
              TextButton(
                  onPressed: () =>
                  {Navigator.of(context).pop(true)},
                  child: const Text("确认")),
              TextButton(
                  onPressed: () =>
                  {Navigator.of(context).pop(true)},
                  child: const Text("取消"))
            ],
          );
        });
  }
}
