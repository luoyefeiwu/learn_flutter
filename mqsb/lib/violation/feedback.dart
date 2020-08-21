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
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text("语言/文字描述"),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Stack(
                  children: [
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "请填写消息文字说明，或选择语音",
                        hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.mic_none,
                          color: Colors.blue,
                        ))
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Text("常用语 "),
                  Expanded(
                    child: Text(
                      "责任单位已处理",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "已处理",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "责任单位已删除",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
