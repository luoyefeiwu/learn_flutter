import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mini_calendar/mini_calendar.dart';

class ScheduleInfo extends StatefulWidget {
  @override
  State createState() => _ScheduleInfoState();
}

class _ScheduleInfoState extends State<ScheduleInfo> {
  int _currentIndex = 0;

  //日历
  Widget _calendar() {
    return Container(
      child: MonthWidget(),
    );
  }

  //标题
  Widget _title() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "位置分布",
            style: TextStyle(fontSize: ScreenUtil().setSp(40)),
          ),
          Text(
            "责任单位名称",
            style: TextStyle(fontSize: ScreenUtil().setSp(40)),
          ),
          Text(
            "签到时间",
            style: TextStyle(fontSize: ScreenUtil().setSp(40)),
          ),
          Text(
            "已巡查次数",
            style: TextStyle(fontSize: ScreenUtil().setSp(40)),
          ),
        ],
      ),
    );
  }

  //左侧
  Widget _contentLeft() {
    return Container(
      color: Colors.white,
      //margin: EdgeInsets.only(left: 20),
      padding: EdgeInsets.only(top: 10, bottom: 20, left: 10),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        children: [
          Text(
            "知春路",
            style: TextStyle(fontSize: ScreenUtil().setSp(40)),
          ),
          Text(
            "海淀南路",
            style: TextStyle(fontSize: ScreenUtil().setSp(40)),
          ),
          Text(
            "科学院南路",
            style: TextStyle(fontSize: ScreenUtil().setSp(40)),
          ),
          Text(
            "中关村东路",
            style: TextStyle(fontSize: ScreenUtil().setSp(40)),
          ),
        ],
      ),
    );
  }

  //右侧
  Widget _contentRight(int index) {
    return Container(
      child: Text("123"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(67, 120, 188, 1.0),
          title: Text("我的排班"),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    size: ScreenUtil().setSp(40),
                  ),
                  Text("返回")
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Text(
              "...",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(80),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            _calendar(),
            _title(),
            Row(
              children: [
                _contentLeft(),
                _contentRight(_currentIndex),
              ],
            ),
          ],
        )));
  }
}
