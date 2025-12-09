import 'package:flutter/material.dart';
import 'package:hook_up/pages/home/info/Info.dart';
import 'package:hook_up/pages/home/tab_profile/advertisement.dart';
import 'package:hook_up/pages/home/tab_profile/function_button.dart';
import 'package:hook_up/pages/home/tab_profile/header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('我的'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('setting');
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: ListView(
        children: [
          Header(),
          FunctionButton(),
          Advertisement(),
          Info(),
        ],
      ),
    );
  }
}
