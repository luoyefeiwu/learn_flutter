import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToastUtils {
  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black12,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }
}
