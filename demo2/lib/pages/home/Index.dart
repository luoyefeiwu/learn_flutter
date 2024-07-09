import 'package:demo2/model/MyMenu.dart';
import 'package:demo2/pages/InStorage/InStorageIndex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/Api.dart';
import '../Inventory/InventoryIndex.dart';
import '../outStorage/OutStorageIndex.dart';

class Index extends StatefulWidget {
  const Index({super.key, required this.title});

  final String title;

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  //记录当前tabbar点击的下标
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        child: _child(context),
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        //tabbar的点击事件
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        //设置图标尺寸
        iconSize: 30,
        //设置选中图标的颜色
        fixedColor: Colors.blue,
        //设置item
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "应用"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
      ),
    );
  }

  Widget _child(BuildContext context) {
    Widget? result = null;
    switch (_currentIndex) {
      case 0:
      case 1:
        result = getApplication(context);
        break;
      case 2:
        result = getMy(context);
        break;
    }
    return result!;
  }

  Widget getMy(BuildContext context) {
    return Container();
  }

  Widget getApplication(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(color: Colors.black12),
        child: const Column(
          children: [
            InStorageIndex(),
            InventoryIndex(),
            OutStorageIndex(),
          ],
        ));
  }
}
