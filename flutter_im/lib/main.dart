import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "聊天室",
      theme: mDefaultTheme,
    ));

final ThemeData mDefaultTheme = new ThemeData(
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Color(0xFFebebeb),
    cardColor: Colors.green);
