import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mini_calendar/mini_calendar.dart';

class ScheduleInfo extends StatefulWidget {
  @override
  State createState() => _ScheduleInfoState();
}

class _ScheduleInfoState extends State<ScheduleInfo> {
  int _currentIndex = 0;
  List<String> listRoad = ["知春路", "海淀南路", "科学院南路", "中关村东路"];

  //日历
  Widget _calendar() {
    return Container(
      //height: ScreenUtil().setHeight(800),
      child: MonthPageView(
        padding: EdgeInsets.all(1),
        scrollDirection: Axis.horizontal,
        // 水平滑动或者竖直滑动
        option: MonthOption(
          enableContinuous: true, // 单选、连选控制
//          marks: {
//            DateDay.now().copyWith(day: 1): '111',
//            DateDay.now().copyWith(day: 5): '222',
//            DateDay.now().copyWith(day: 13): '333',
//            DateDay.now().copyWith(day: 19): '444',
//            DateDay.now().copyWith(day: 26): '444',
//          },
        ),
        showWeekHead: true,
        // 显示星期头部
        onContinuousSelectListen: (firstDay, endFay) {},
        // 连选回调
        onMonthChange: (month) {},
        // 月份更改回调
        onDaySelected: (day, data) {},
        // 日期选中会迪欧啊
        onCreated: (controller) {}, // 控制器回调
      ),
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
      padding: EdgeInsets.only(bottom: 10, left: 10),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width / 4,
      height: ScreenUtil().setHeight(450),
      child: _contentLeftListView(),
    );
  }

  //左侧listview
  Widget _contentLeftListView() {
    return ListView.builder(
        itemCount: listRoad.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              color: _currentIndex == index ? Colors.grey[100] : Colors.white,
              child: Text(
                listRoad[index],
                style: TextStyle(fontSize: ScreenUtil().setSp(35)),
              ),
            ),
          );
        });
  }

  //右侧
  Widget _contentRight() {
    return Container(
        margin: EdgeInsets.only(top: 20),
        width: (MediaQuery.of(context).size.width / 4) * 3,
        height: ScreenUtil().setHeight(450),
        child: ListView.builder(
            itemCount: _currentIndex + 4,
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("王婆大虾"),
                      Text("10:10   "),
                      Text("${index * _currentIndex}      "),
                    ],
                  ));
            }));
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
                _contentRight(),
              ],
            ),
          ],
        )));
  }
}
