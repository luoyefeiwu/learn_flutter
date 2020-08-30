import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:image_picker/image_picker.dart';

//处理反馈
class FeedbackCase extends StatefulWidget {
  @override
  State createState() => _FeedbackCaseState();
}

class _FeedbackCaseState extends State<FeedbackCase> {
  final cloudinary =
      CloudinaryPublic('CLOUD_NAME', 'UPLOAD_PRESET', cache: false);
  final _picker = ImagePicker();

  Future<Widget> _upload() async {
    PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);
    File file = File(pickedFile.path);
    CloudinaryResponse response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(file, resourceType: CloudinaryResourceType.Image),
    );

    print(response.secureUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                height: ScreenUtil().setHeight(300),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[100], width: 1),
                ),
                child: Container(
                  width: 200,
                  height: 800,
                  color: Colors.white,
//                  margin: EdgeInsets.only(
//                      top: 10,
//                      left: 10,
//                      right: ScreenUtil().setWidth(700),
//                      bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(200),
                        height: ScreenUtil().setHeight(200),
                        margin: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _upload();
                          },
                          child: Column(
                            children: [
                              Container(
                                width: ScreenUtil().setWidth(180),
                                height: ScreenUtil().setHeight(100),
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(100),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text("上传附件"),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
//                    Column(
//                      children: [
//                        Align(
//                          alignment: Alignment.centerLeft,
//                          child: Text(
//                            "➕",
//                            style: TextStyle(fontSize: ScreenUtil().setSp(30)),
//                          ),
//                        ),
//                        Align(
//                          alignment: Alignment.centerLeft,
//                          child: Text("上传附件"),
//                        ),
//                      ],
//                    )
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "语音/文字描述",
                style: TextStyle(fontSize: ScreenUtil().setSp(50)),
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      //color: Colors.white,
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
                            child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("提示"),
                                          content: Text("点击录音了"),
                                          actions: [
                                            FlatButton(
                                              child: Text("取消"),
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pop(), //关闭对话框
                                            ),
                                            FlatButton(
                                              child: Text("确认"),
                                              onPressed: () {
                                                // ... 执行删除操作
                                                Navigator.of(context)
                                                    .pop(true); //关闭对话框
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Icon(
                                  Icons.mic_none,
                                  color: Colors.blue,
                                )),
                          )
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
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("录音"),
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
                child: Text("反馈"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
