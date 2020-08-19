import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class Login extends StatefulWidget {
  @override
  State createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _checkboxRememberSelected = false; //记住密码
  bool _checkboxAutomaticSelected = false; //立即登录
  @override
  Widget build(BuildContext context) {
    return Material(
      // height: ScreenUtil().setHeight(800),
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "images/loginbj.jpg",
                width: ScreenUtil().setSp(1200),
                fit: BoxFit.cover,
              ),
              Positioned(
                child: Text(
                  "海淀区",
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(80)),
                ),
                top: 40,
                left: 150,
              ),
              Positioned(
                child: Text(
                  "门前三包移动巡更系统",
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(50)),
                ),
                top: 100,
                left: 120,
              ),
            ],
          ),
          Container(
            //height: ScreenUtil().setSp(100),
            margin: EdgeInsets.all(20),
            //alignment: Alignment.centerLeft,
            child: TextField(
              decoration: InputDecoration(
                hintText: "用户名",
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                contentPadding: EdgeInsets.all(5),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            //alignment: Alignment.centerLeft,
            child: TextField(
              decoration: InputDecoration(
                hintText: "密码",
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                contentPadding: EdgeInsets.all(5),
              ),
              obscureText: true,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _checkboxRememberSelected,
                      activeColor: Colors.red, //选中时的颜色
                      onChanged: (value) {
                        setState(() {
                          _checkboxRememberSelected = value;
                        });
                      },
                    ),
                    Text("记住密码"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _checkboxAutomaticSelected,
                      activeColor: Colors.red, //选中时的颜色
                      //checkColor: Colors.red,
                      onChanged: (bool value) {
                        setState(() {
                          _checkboxAutomaticSelected = value;
                        });
                      },
                    ),
                    Text("自动登录")
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setSp(1000),
            child: FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("立即登录"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("提示"),
                      content: Text("您确定忘记密码?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("取消"),
                          onPressed: () => Navigator.of(context).pop(), //关闭对话框
                        ),
                        FlatButton(
                          child: Text("确认"),
                          onPressed: () {
                            // ... 执行删除操作
                            Navigator.of(context).pop(true); //关闭对话框
                          },
                        ),
                      ],
                    );
                  });
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "忘记密码",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
