import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

//违规详情
class ViolationInfo extends StatefulWidget {
  @override
  State createState() => _violationInfoState();
}

class _violationInfoState extends State<ViolationInfo> {
  //头部信息
  Widget _title() {
    return Container(
      color: Colors.grey[100],
      height: ScreenUtil().setHeight(100),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      child: Text("责任单位信息", style: TextStyle(fontSize: ScreenUtil().setSp(45))),
    );
  }

  //责任单位内容
  Widget _content() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Container(
              child: Column(
            children: [
              Row(
                children: [
                  Align(child: Text("门头名称:")),
                  Text("马兰拉面"),
                ],
              ),
              Row(
                children: [
                  Text("注册名称:"),
                  Text("好味道食品有限公司"),
                ],
              ),
              Row(
                children: [
                  Text("营业执照:"),
                  Text("有"),
                ],
              ),
              Row(
                children: [
                  Text("三包责任书:"),
                  Text("无"),
                ],
              ),
              //画线
              Divider(
                color: Colors.grey,
              ),
              Text("三包责任范围"),
              Row(
                children: [
                  Text("东至:"),
                  Text("好再来超市西侧"),
                ],
              ),
              Row(
                children: [
                  Text("南至:"),
                  Text("门前3米内"),
                ],
              ),
              Row(
                children: [
                  Text("西至:"),
                  Text("市政道路界面3米处"),
                ],
              ),
              Row(
                children: [
                  Text("北至:"),
                  Text("停车场栏杆1米处"),
                ],
              ),
            ],
          )),
          Container(),
        ],
      ),
    );
  }

  //描述
  Widget _description() {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Text("违规内容"),
            Icon(Icons.label),
            Text("点击提醒"),
          ],
        ),
        Container(
            child: Column(
          children: [
            Row(children: [
              Text("违规描述"),
              Text("店门口随意搬放物品"),
            ]),
            Row(
              children: [
                Text("照片"),
                Text("照片1"),
              ],
            )
          ],
        )),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(67, 120, 188, 1.0),
        title: Text("违规详情"),
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
      body: Container(
        child: Column(
          children: [
            _title(),
            _content(),
            _description(),
            Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(400),
                      child: FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue,
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("处理反馈"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("提示"),
                                  content: Text("点击处理反馈了"),
                                  actions: [
                                    FlatButton(
                                      child: Text("取消"),
                                      onPressed: () =>
                                          Navigator.of(context).pop(), //关闭对话框
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
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(450),
                      child: FlatButton(
                        color: Colors.red,
                        highlightColor: Colors.redAccent,
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("上报城管"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
