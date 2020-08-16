import 'package:flutter/material.dart';
import 'company/near_company.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          home: NearCompany(),
          routes: <String, WidgetBuilder>{
            "/near": (BuildContext context) => new NearCompany(),
          }),
    );
  }
}
