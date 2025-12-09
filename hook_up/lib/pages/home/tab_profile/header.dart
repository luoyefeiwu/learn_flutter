import 'package:flutter/material.dart';
import 'package:hook_up/utils/common_toast.dart';

var loginRegisterStyle = TextStyle(fontSize: 20.0, color: Colors.white);

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    var isLogin = true;
    return isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }

  //未登录
  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 80.0,
      child: Row(
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://ts2.tc.mm.bing.net/th/id/ODF.Dkl7m1Kvx2HmyF847flnaw?w=32&h=32&qlt=90&pcl=fffffa&o=6&cb=12&pid=1.2"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 6.0)),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("login");
                    },
                    child: Text(
                      "登录",
                      style: loginRegisterStyle,
                    ),
                  ),
                  Text(
                    "/",
                    style: loginRegisterStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("register");
                    },
                    child: Text(
                      "注册",
                      style: loginRegisterStyle,
                    ),
                  ),
                ],
              ),
              Text(
                "登录后可体验更多",
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  //已登录
  Widget _loginBuilder(BuildContext context) {
    String userName = '已登录用户';
    String userImage =
        'https://ts2.tc.mm.bing.net/th/id/ODF.Dkl7m1Kvx2HmyF847flnaw?w=32&h=32&qlt=90&pcl=fffffa&o=6&cb=12&pid=1.2")';
    return Container(
      decoration: BoxDecoration(color: Colors.green),
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 80.0,
      child: Row(
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 6.0)),
              Text(
                userName,
                style: loginRegisterStyle,
              ),
              Text(
                "查看编辑个人资料",
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
