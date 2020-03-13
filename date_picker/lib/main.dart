import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DatePick组件',
      home: DatePickView(),
    );
  }
}

class DatePickView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DatePicker组件"),
      ),
      body: RaisedButton(
          child: Text("点我"),
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2009, 5, 1, 11, 21, 33),
                    lastDate: DateTime(2029, 2, 1, 11, 21, 33))
                .then((DateTime val) {
              print(val);
            });
          }),
    );
  }
}
