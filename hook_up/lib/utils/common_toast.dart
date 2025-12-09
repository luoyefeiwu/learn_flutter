import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CommonToast {
  static showTotast(BuildContext context, String msg) {
    TDToast.showText(msg, context: context);
  }
}
