import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mqsb/violation/violationList.dart';

class Index extends StatefulWidget {
  @override
  State createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;

  void _onTaphandler(int index) {
    setState(() {
      if (index != _currentIndex) {
        _body();
//        if (index == 1) {
//        //  Navigator.pushNamed(context, "/violationList");
//        } else {
//         // Navigator.pushNamed(context, "/index");
//        }
      }
      _currentIndex = index;
    });
  }

  //绑定内容
  Widget _content(Color color, Icon icon, String title) {
    return Container(
      height: ScreenUtil().setHeight(150),
      margin: EdgeInsets.all(ScreenUtil().setSp(30)),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color, width: ScreenUtil().setSp(20))),
      child: Row(
        children: [
          icon,
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(50), color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: ScreenUtil().setSp(10)),
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  //绑定 违规列表
  Widget _violationList() {
    return ViolationList();
  }

  //绑定列表
  Widget _list() {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/near", arguments: {"type": 1});
            },
            child: _content(
                Colors.red,
                Icon(
                  Icons.book,
                  color: Colors.white,
                ),
                "上报违规和签到"),
          ),
          GestureDetector(
            child: _content(
                Colors.blue,
                Icon(
                  Icons.business,
                  color: Colors.white,
                ),
                "责任单位管理"),
            onTap: () {
              Navigator.pushNamed(context, "/near", arguments: {"type": 2});
            },
          ),
          GestureDetector(
            child: _content(
                Colors.lightBlueAccent,
                Icon(
                  Icons.date_range,
                  color: Colors.white,
                ),
                "我的排班"),
            onTap: () {
              Navigator.pushNamed(context, "/scheduleInfo");
            },
          ),
        ],
      ),
    );
  }

  Widget _body() {
    if (_currentIndex == 0) {
      return _list();
    } else {
      return _violationList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("首页"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(67, 120, 188, 1.0),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.green,
          currentIndex: _currentIndex,
          onTap: _onTaphandler,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: ScreenUtil().setSp(70),
                ),
                label: '工作面板'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box,
                  size: ScreenUtil().setSp(70),
                ),
                label: '违规管理'),
          ]),
      body: _body(),
    );
  }
}
