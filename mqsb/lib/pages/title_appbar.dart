import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

//appbar
class TitleAppBar extends StatelessWidget {
  final String titleName;

  TitleAppBar({this.titleName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color.fromRGBO(67, 120, 188, 1.0),
      title: Text(titleName),
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
    );
  }
}
