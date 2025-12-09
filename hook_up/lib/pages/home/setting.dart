import 'package:flutter/material.dart';
import 'package:hook_up/utils/common_toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              CommonToast.showTotast(context, '已经退出登录');
            },
            child: Text(
              "退出登录",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }
}
