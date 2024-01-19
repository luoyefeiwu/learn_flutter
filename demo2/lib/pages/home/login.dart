import 'package:flutter/material.dart';
import 'package:demo2/r.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Image.asset(
                R.assetsImagesHomeIndex,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text("欢迎登录鼎腾WMS",
                  style: new TextStyle(color: Colors.black, fontSize: 25)),
            ),
            Container(
              // margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              height: 200,
              padding: EdgeInsets.all(20),
              color: Colors.black12,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Container(
                              width: 10,
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Colors.red, size: 10),
                                  Text("账号")
                                ],
                              )),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Container(
                            width: 10,
                            child: Row(
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
              child: Row(
                children: [
                  Radio(value: 1, groupValue: 1, onChanged: (e) => {}),
                  Text("请阅读并勾选隐私条款")
                ],
              ),
            ),
            Container(
              child: MaterialButton(
                onPressed: () {},
                child: Text("登录"),
                color: Colors.black26,
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
}
