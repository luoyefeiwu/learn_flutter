import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CompanyDetail extends StatefulWidget {
  @override
  State createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(67, 120, 188, 1.0),
        title: Text("责任单位管理"),
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
        color: Color.fromRGBO(245, 245, 245, 1.0),
        width: ScreenUtil().setWidth(1080),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(ScreenUtil().setSp(20)),
              alignment: Alignment.centerLeft,
              child: Text(
                "责任单位信息",
                style: TextStyle(fontSize: ScreenUtil().setSp(40)),
              ),
            ),
            Container(
                margin: EdgeInsets.all(ScreenUtil().setSp(40)),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.room,
                          size: ScreenUtil().setSp(45),
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Text("西城区广外街道"),
                        ),
                        Text("查看定位",
                            style: TextStyle(
                              color: Colors.blueAccent,
                            )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setSp(20)),
                      // height: ScreenUtil().setHeight(800),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                "images/bj1.png",
                                fit: BoxFit.cover,
                                height: ScreenUtil().setHeight(550),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 20,
                                  child: Text(
                                    "责任单位照片",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                          Container(
                              height: ScreenUtil().setHeight(300),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("三包书签订 (补发)"),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: ScreenUtil().setSp(50)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("日期"),
                                            Text("2020-08-17 12:00"),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Align(
                                      widthFactor: 1.4,
                                      // heightFactor: 2,
                                      alignment: Alignment.centerRight,
                                      child: Image.asset(
                                        "images/bj2.png",
                                        fit: BoxFit.cover,
                                        height: ScreenUtil().setHeight(250),
                                        width: ScreenUtil().setWidth(500),
                                      ))
                                ],
                              ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
