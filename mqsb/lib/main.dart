import 'package:flutter/material.dart';
import 'package:mqsb/schedule/schedule_info.dart';
import 'package:mqsb/violation/violationInfo.dart';
import 'package:mqsb/violation/violationList.dart';
import 'company/company_detail.dart';
import 'company/near_company.dart';

import 'home/index.dart';
import 'home/login.dart';
import 'violation/feedback.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    //ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    // ScreenUtil.init(context);
    // TODO: implement build
    return Container(
      child: MaterialApp(
          title: 'Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.blue),
          home: Login(),
          routes: <String, WidgetBuilder>{
            "/near": (BuildContext context) => NearCompany(),
            "/index": (BuildContext context) => Index(),
            "/detail": (BuildContext context) => CompanyDetail(),
            "/login": (BuildContext context) => Login(),
            "/feedback": (BuildContext context) => FeedbackCase(),
            "/violationList": (BuildContext context) => ViolationList(),
            "/violationInfo": (BuildContext context) => ViolationInfo(),
            "/scheduleInfo": (BuildContext context) => ScheduleInfo(),
          }),
    );
  }
}
