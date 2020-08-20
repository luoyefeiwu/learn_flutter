import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

//处理反馈
class FeedbackCase extends StatefulWidget {
  @override
  State createState() => _FeedbackCaseState();
}

class _FeedbackCaseState extends State<FeedbackCase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(67, 120, 188, 1.0),
        title: Text("处理反馈"),
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
        color: Colors.grey[100],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 40,
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                child: Text(
                  "拍照/录像记录",
                  style: TextStyle(fontSize: ScreenUtil().setSp(40)),
                )),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width - 40,
              child: Container(
                //margin: EdgeInsets.only(top: 20, left: 10),
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(200),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: Container(
                    width: 20,
                    height: 800,
                    color: Colors.grey[100],
                    margin: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "➕",
                            style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("上传附件"),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
