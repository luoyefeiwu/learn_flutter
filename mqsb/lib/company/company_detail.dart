import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:photo_view/photo_view.dart';

class CompanyDetail extends StatefulWidget {
  @override
  State createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> {
  String _selectType = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
      body: SingleChildScrollView(
        child: Container(
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
                    // crossAxisAlignment: CrossAxisAlignment.start,
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
//            PhotoView(imageProvider: null)
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                            Container(
                              child: Row(
                                children: [
                                  Expanded(flex: 1, child: Text("所属行业:")),
                                  Expanded(
                                    flex: 4,
                                    child: DropdownButton(
                                      items: [
                                        DropdownMenuItem(
                                          child: Container(
                                            width: ScreenUtil().setWidth(700),
                                            child: Text("金融"),
                                          ),
                                          value: "1",
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: ScreenUtil().setWidth(700),
                                            child: Text("法律"),
                                          ),
                                          value: "2",
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: ScreenUtil().setWidth(700),
                                            child: Text("科技"),
                                          ),
                                          value: "3",
                                        ),
                                        DropdownMenuItem(
                                          child: Container(
                                            width: ScreenUtil().setWidth(700),
                                            child: Text("新闻"),
                                          ),
                                          value: "4",
                                        ),
                                      ],
                                      hint: Text("请选择"),
                                      value: _selectType,
                                      elevation: 24,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectType = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("门头名称:"),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "搜索",
                                        hintStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            color: Colors.white),
                                        // prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("注册地址:"),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "搜索",
                                        hintStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            color: Colors.white),
                                        // prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("责任人 :"),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "搜索",
                                        hintStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            color: Colors.white),
                                        // prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("联系人电话:"),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "搜索",
                                        hintStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            color: Colors.white),
                                        // prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.centerLeft,
                              child: Text("三包责任范围"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("东  至:"),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "搜索",
                                        hintStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            color: Colors.white),
                                        // prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("南  至:"),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "搜索",
                                        hintStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            color: Colors.white),
                                        // prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("西  至:"),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "搜索",
                                        hintStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            color: Colors.white),
                                        // prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text("北  至:"),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "搜索",
                                        hintStyle: TextStyle(
                                            fontSize: ScreenUtil().setSp(13),
                                            color: Colors.white),
                                        // prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        contentPadding: EdgeInsets.all(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
