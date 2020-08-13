import 'package:flutter/material.dart';

import 'company/near_company.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
