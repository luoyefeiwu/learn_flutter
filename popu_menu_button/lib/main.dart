import 'package:flutter/material.dart';

void main() => runApp(MyApp());

enum ConferenceItem { AddMenber, LockConference, ModifyLayout, TurnpffAll }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PopupMenuButton",
      home: Scaffold(
        appBar: AppBar(title: Text("PopupMenuButton")),
        body: Center(
          child: FlatButton(
            onPressed: () {},
            child: PopupMenuButton<ConferenceItem>(
              onSelected: (ConferenceItem result) {},
              //菜单构造器
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<ConferenceItem>>[
                    const PopupMenuItem<ConferenceItem>(
                      value: ConferenceItem.AddMenber,
                      child: Text("添加新成员"),
                    ),
                    const PopupMenuItem<ConferenceItem>(
                      value: ConferenceItem.LockConference,
                      child: Text("锁定会议"),
                    ),
                    const PopupMenuItem<ConferenceItem>(
                      value: ConferenceItem.ModifyLayout,
                      child: Text("修改布局"),
                    ),
                    const PopupMenuItem<ConferenceItem>(
                      value: ConferenceItem.TurnpffAll,
                      child: Text("挂断所有"),
                    ),
                  ],
            ),
          ),
        ),
      ),
    );
  }
}
