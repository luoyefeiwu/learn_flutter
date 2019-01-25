import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            child: new Text(
              "hello jerry",
              style: TextStyle(fontSize: 40.0),
            ),
            alignment: Alignment.topLeft,
            width: 500.0,
            height: 400.0,
            // color: Colors.lightBlue,
            padding: const EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
            margin: const EdgeInsets.all(10),
            decoration: new BoxDecoration(
              gradient: const LinearGradient(colors: [
                Colors.lightBlue,
                Colors.greenAccent,
                Colors.purple
              ]),
              border: Border.all(width: 5.0, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
